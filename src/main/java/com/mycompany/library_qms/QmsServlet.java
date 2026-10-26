package com.mycompany.library_qms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet(name = "QmsServlet", urlPatterns = {"/qms"})
public class QmsServlet extends HttpServlet {
    private static final String VIEW = "/WEB-INF/qms.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        loadPage(req);
        req.getRequestDispatcher(VIEW).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        try (Connection con = DB.getConnection()) {
            switch (action == null ? "" : action) {
                case "plan": savePlan(con, req); break;
                case "review": saveReview(con, req); break;
                case "defect": saveDefect(con, req); break;
                case "defectStatus": updateDefect(con, req); break;
                case "qualityAction": saveQualityAction(con, req); break;
                case "checklist": saveChecklist(con, req); break;
                case "improvement": saveImprovement(con, req); break;
                default: throw new IllegalArgumentException("Unknown action.");
            }
            resp.sendRedirect(req.getContextPath() + "/qms?notice=" + java.net.URLEncoder.encode("Record saved successfully.", "UTF-8"));
        } catch (Exception ex) {
            getServletContext().log("QMS save failed", ex);
            req.setAttribute("error", "Could not save the record. Check that MySQL is running, the database script was executed, and DB.java has the correct password. Details: " + ex.getMessage());
            loadPage(req);
            req.getRequestDispatcher(VIEW).forward(req, resp);
        }
    }

    private void savePlan(Connection c, HttpServletRequest r) throws SQLException {
        String sql = "INSERT INTO quality_plans(title, objective, quality_factor, owner_name, entry_criteria, exit_criteria, review_frequency, status) VALUES(?,?,?,?,?,?,?,?)";
        try (PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, val(r,"title")); p.setString(2,val(r,"objective")); p.setString(3,val(r,"qualityFactor"));
            p.setString(4,val(r,"owner")); p.setString(5,val(r,"entryCriteria")); p.setString(6,val(r,"exitCriteria"));
            p.setString(7,val(r,"reviewFrequency")); p.setString(8,val(r,"status")); p.executeUpdate();
        }
    }
    private void saveReview(Connection c, HttpServletRequest r) throws SQLException {
        String sql = "INSERT INTO reviews(review_type, artifact, reviewer, review_date, result, comments) VALUES(?,?,?,?,?,?)";
        try (PreparedStatement p=c.prepareStatement(sql)) {
            p.setString(1,val(r,"reviewType")); p.setString(2,val(r,"artifact")); p.setString(3,val(r,"reviewer"));
            p.setDate(4, dateOrToday(val(r,"reviewDate"))); p.setString(5,val(r,"result")); p.setString(6,val(r,"comments")); p.executeUpdate();
        }
    }
    private void saveDefect(Connection c, HttpServletRequest r) throws SQLException {
        String sql = "INSERT INTO defects(title, category, severity, description, assigned_to, status, found_in, resolution) VALUES(?,?,?,?,?,?,?,?)";
        try (PreparedStatement p=c.prepareStatement(sql)) {
            p.setString(1,val(r,"defectTitle")); p.setString(2,val(r,"category")); p.setString(3,val(r,"severity"));
            p.setString(4,val(r,"description")); p.setString(5,val(r,"assignedTo")); p.setString(6,"Identified");
            p.setString(7,val(r,"foundIn")); p.setString(8,""); p.executeUpdate();
        }
    }
    private void updateDefect(Connection c, HttpServletRequest r) throws SQLException {
        String sql = "UPDATE defects SET status=?, resolution=? WHERE id=?";
        try (PreparedStatement p=c.prepareStatement(sql)) {
            p.setString(1,val(r,"newStatus")); p.setString(2,val(r,"resolution")); p.setInt(3,Integer.parseInt(val(r,"defectId"))); p.executeUpdate();
        }
    }
    private void saveQualityAction(Connection c, HttpServletRequest r) throws SQLException {
        String sql = "INSERT INTO quality_actions(problem, root_cause, corrective_action, preventive_action, owner_name, status, verification) VALUES(?,?,?,?,?,?,?)";
        try (PreparedStatement p=c.prepareStatement(sql)) {
            p.setString(1,val(r,"problem")); p.setString(2,val(r,"rootCause")); p.setString(3,val(r,"corrective"));
            p.setString(4,val(r,"preventive")); p.setString(5,val(r,"actionOwner")); p.setString(6,val(r,"actionStatus"));
            p.setString(7,val(r,"verification")); p.executeUpdate();
        }
    }
    private void saveChecklist(Connection c, HttpServletRequest r) throws SQLException {
        String sql = "INSERT INTO checklists(stage, item_text, responsible, result, notes) VALUES(?,?,?,?,?)";
        try (PreparedStatement p=c.prepareStatement(sql)) {
            p.setString(1,val(r,"stage")); p.setString(2,val(r,"itemText")); p.setString(3,val(r,"responsible"));
            p.setString(4,val(r,"checkResult")); p.setString(5,val(r,"checkNotes")); p.executeUpdate();
        }
    }
    private void saveImprovement(Connection c, HttpServletRequest r) throws SQLException {
        String sql = "INSERT INTO improvements(source_metric, observation, proposed_change, owner_name, status, outcome) VALUES(?,?,?,?,?,?)";
        try (PreparedStatement p=c.prepareStatement(sql)) {
            p.setString(1,val(r,"sourceMetric")); p.setString(2,val(r,"observation")); p.setString(3,val(r,"proposedChange"));
            p.setString(4,val(r,"improvementOwner")); p.setString(5,val(r,"improvementStatus")); p.setString(6,val(r,"outcome")); p.executeUpdate();
        }
    }
    private String val(HttpServletRequest r, String name) {
        String v = r.getParameter(name);
        return v == null ? "" : v.trim();
    }
    private java.sql.Date dateOrToday(String s) {
        try { return java.sql.Date.valueOf(s); } catch (Exception e) { return new java.sql.Date(System.currentTimeMillis()); }
    }

    private void loadPage(HttpServletRequest req) {
        req.setAttribute("notice", req.getParameter("notice"));
        try (Connection c = DB.getConnection()) {
            req.setAttribute("plans", rows(c, "SELECT * FROM quality_plans ORDER BY id DESC"));
            req.setAttribute("reviews", rows(c, "SELECT * FROM reviews ORDER BY id DESC"));
            req.setAttribute("defects", rows(c, "SELECT * FROM defects ORDER BY id DESC"));
            req.setAttribute("actions", rows(c, "SELECT * FROM quality_actions ORDER BY id DESC"));
            req.setAttribute("checklists", rows(c, "SELECT * FROM checklists ORDER BY id DESC"));
            req.setAttribute("improvements", rows(c, "SELECT * FROM improvements ORDER BY id DESC"));
            req.setAttribute("defectCount", scalar(c,"SELECT COUNT(*) FROM defects"));
            req.setAttribute("openDefects", scalar(c,"SELECT COUNT(*) FROM defects WHERE status <> 'Closed'"));
            req.setAttribute("closedDefects", scalar(c,"SELECT COUNT(*) FROM defects WHERE status = 'Closed'"));
            req.setAttribute("reviewCount", scalar(c,"SELECT COUNT(*) FROM reviews"));
            req.setAttribute("reviewPassed", scalar(c,"SELECT COUNT(*) FROM reviews WHERE result='Approved'"));
            req.setAttribute("planCount", scalar(c,"SELECT COUNT(*) FROM quality_plans"));
            req.setAttribute("actionCount", scalar(c,"SELECT COUNT(*) FROM quality_actions"));
        } catch (Exception ex) {
            getServletContext().log("QMS database read failed", ex);
            req.setAttribute("error", "Database connection failed. First run database/schema.sql, then edit the MySQL username/password in DB.java. Details: " + ex.getMessage());
            req.setAttribute("plans", Collections.emptyList()); req.setAttribute("reviews", Collections.emptyList());
            req.setAttribute("defects", Collections.emptyList()); req.setAttribute("actions", Collections.emptyList());
            req.setAttribute("checklists", Collections.emptyList()); req.setAttribute("improvements", Collections.emptyList());
            req.setAttribute("defectCount",0); req.setAttribute("openDefects",0); req.setAttribute("closedDefects",0);
            req.setAttribute("reviewCount",0); req.setAttribute("reviewPassed",0); req.setAttribute("planCount",0); req.setAttribute("actionCount",0);
        }
    }
    private List<Map<String,Object>> rows(Connection c, String sql) throws SQLException {
        List<Map<String,Object>> out = new ArrayList<>();
        try (Statement s=c.createStatement(); ResultSet rs=s.executeQuery(sql)) {
            ResultSetMetaData md=rs.getMetaData(); int n=md.getColumnCount();
            while(rs.next()) { Map<String,Object> row=new LinkedHashMap<>(); for(int i=1;i<=n;i++) row.put(md.getColumnLabel(i),rs.getObject(i)); out.add(row); }
        }
        return out;
    }
    private int scalar(Connection c, String sql) throws SQLException {
        try (Statement s=c.createStatement(); ResultSet rs=s.executeQuery(sql)) { return rs.next()?rs.getInt(1):0; }
    }
}

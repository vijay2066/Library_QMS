<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%!
String esc(Object x) {
    if (x == null) return "";
    return String.valueOf(x).replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&#39;");
}
String cell(Map row, String key) { return esc(row.get(key)); }
%>
<%
List<Map<String,Object>> plans=(List<Map<String,Object>>)request.getAttribute("plans");
List<Map<String,Object>> reviews=(List<Map<String,Object>>)request.getAttribute("reviews");
List<Map<String,Object>> defects=(List<Map<String,Object>>)request.getAttribute("defects");
List<Map<String,Object>> actions=(List<Map<String,Object>>)request.getAttribute("actions");
List<Map<String,Object>> checklists=(List<Map<String,Object>>)request.getAttribute("checklists");
List<Map<String,Object>> improvements=(List<Map<String,Object>>)request.getAttribute("improvements");
int defectCount=(Integer)request.getAttribute("defectCount"), openDefects=(Integer)request.getAttribute("openDefects");
int closedDefects=(Integer)request.getAttribute("closedDefects"), reviewCount=(Integer)request.getAttribute("reviewCount");
int reviewPassed=(Integer)request.getAttribute("reviewPassed"), planCount=(Integer)request.getAttribute("planCount");
int actionCount=(Integer)request.getAttribute("actionCount");
String tab=request.getParameter("tab")==null?"dashboard":request.getParameter("tab");
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Library Software QMS</title>
<style>
:root{--navy:#17365d;--blue:#245a91;--pale:#eef4fb;--bg:#f3f6fa;--ink:#243247;--muted:#64748b;--line:#dbe3ed}
*{box-sizing:border-box}body{margin:0;font-family:Arial,sans-serif;background:var(--bg);color:var(--ink)}
header{background:linear-gradient(120deg,#17365d,#28629a);color:white;padding:24px 5%;}header h1{margin:0 0 8px;font-size:26px}header p{margin:0;color:#dbeafe}
nav{display:flex;gap:8px;flex-wrap:wrap;background:#fff;padding:12px 5%;border-bottom:1px solid var(--line)}
nav a{padding:10px 13px;text-decoration:none;color:var(--navy);font-weight:bold;border-radius:7px}nav a:hover,nav a.active{background:var(--pale)}
main{max-width:1250px;margin:24px auto;padding:0 20px}.notice,.error{padding:12px 16px;border-radius:8px;margin-bottom:16px}.notice{background:#e5f6eb;color:#17613a}.error{background:#fee2e2;color:#991b1b;overflow-wrap:anywhere}
.cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(165px,1fr));gap:14px;margin:18px 0}.card,.panel{background:white;border:1px solid var(--line);border-radius:12px;padding:18px;box-shadow:0 3px 12px #0f172a08}.card small{color:var(--muted)}.num{font-size:30px;font-weight:bold;color:var(--blue);margin-top:8px}
.panel{margin:18px 0}.panel h2{font-size:20px;color:var(--navy);margin:0 0 14px}.panel h3{font-size:16px;color:var(--navy)}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(230px,1fr));gap:14px}.field{display:flex;flex-direction:column;gap:6px}label{font-weight:bold;font-size:13px}input,select,textarea{width:100%;padding:10px;border:1px solid #cbd5e1;border-radius:7px;font:inherit;background:white}textarea{min-height:76px;resize:vertical}.wide{grid-column:1/-1}
button{background:var(--blue);color:white;border:0;padding:11px 16px;border-radius:7px;font-weight:bold;cursor:pointer;margin-top:12px}button:hover{background:var(--navy)}
.table-wrap{overflow-x:auto}table{width:100%;border-collapse:collapse;font-size:13px}th,td{text-align:left;padding:10px;border-bottom:1px solid var(--line);vertical-align:top}th{background:var(--pale);color:var(--navy);white-space:nowrap}.workflow{display:flex;flex-wrap:wrap;gap:8px}.workflow span{background:var(--pale);padding:10px 12px;border-radius:7px;font-weight:bold;color:var(--navy)}.hint{color:var(--muted);font-size:13px;line-height:1.5}footer{text-align:center;padding:25px;color:var(--muted);font-size:12px}
@media(max-width:600px){header h1{font-size:21px}main{padding:0 12px}nav{padding:10px 12px}}
</style></head><body>
<header><h1>Library Software Quality Management System</h1></header>
<nav>
<a class="<%=tab.equals("dashboard")?"active":""%>" href="<%=request.getContextPath()%>/qms?tab=dashboard">Dashboard</a>
<a class="<%=tab.equals("plan")?"active":""%>" href="<%=request.getContextPath()%>/qms?tab=plan">Quality Plan</a>
<a class="<%=tab.equals("reviews")?"active":""%>" href="<%=request.getContextPath()%>/qms?tab=reviews">Reviews</a>
<a class="<%=tab.equals("defects")?"active":""%>" href="<%=request.getContextPath()%>/qms?tab=defects">Defects</a>
<a class="<%=tab.equals("actions")?"active":""%>" href="<%=request.getContextPath()%>/qms?tab=actions">Corrective Actions</a>
<a class="<%=tab.equals("checklists")?"active":""%>" href="<%=request.getContextPath()%>/qms?tab=checklists">Checklists</a>
<a class="<%=tab.equals("improvements")?"active":""%>" href="<%=request.getContextPath()%>/qms?tab=improvements">Improvement</a>
<a class="<%=tab.equals("reports")?"active":""%>" href="<%=request.getContextPath()%>/qms?tab=reports">Reports</a>
</nav><main>
<% if(request.getAttribute("notice")!=null){ %><div class="notice"><%=esc(request.getAttribute("notice"))%></div><% } %>
<% if(request.getAttribute("error")!=null){ %><div class="error"><b>Database / application message:</b> <%=esc(request.getAttribute("error"))%></div><% } %>

<% if(tab.equals("dashboard")) { %>
<h2>Quality overview</h2>
<div class="cards">
<div class="card"><small>Quality plans</small><div class="num"><%=planCount%></div></div>
<div class="card"><small>Reviews recorded</small><div class="num"><%=reviewCount%></div></div>
<div class="card"><small>Total defects</small><div class="num"><%=defectCount%></div></div>
<div class="card"><small>Open defects</small><div class="num"><%=openDefects%></div></div>
<div class="card"><small>Closed defects</small><div class="num"><%=closedDefects%></div></div>
<div class="card"><small>Corrective actions</small><div class="num"><%=actionCount%></div></div>
<div class="card"><small>Approved reviews</small><div class="num"><%=reviewPassed%></div></div>
<div class="card"><small>Defect closure rate</small><div class="num"><%=defectCount==0?0:Math.round(closedDefects*100.0/defectCount)%>%</div></div>
</div>


<% } else if(tab.equals("plan")) { %>
<section class="panel"><h2>Create quality plan</h2><form method="post" action="<%=request.getContextPath()%>/qms"><input type="hidden" name="action" value="plan"><div class="grid">
<div class="field"><label>Plan title *</label><input name="title" required placeholder="e.g. Library QMS Release 1"></div>
<div class="field"><label>Responsible owner *</label><input name="owner" required placeholder="Quality lead"></div>
<div class="field"><label>Quality factor</label><select name="qualityFactor"><option>Reliability</option><option>Usability</option><option>Maintainability</option><option>Functional suitability</option><option>Security</option><option>Performance efficiency</option></select></div>
<div class="field"><label>Review frequency</label><select name="reviewFrequency"><option>Every milestone</option><option>Weekly</option><option>Before each release</option></select></div>
<div class="field wide"><label>Quality objective *</label><textarea name="objective" required placeholder="Reduce data inconsistencies and prevent defects from missing reviews"></textarea></div>
<div class="field"><label>Entry criteria</label><textarea name="entryCriteria" placeholder="Requirements documented; review checklist prepared"></textarea></div>
<div class="field"><label>Exit criteria</label><textarea name="exitCriteria" placeholder="Critical defects closed; test evidence approved"></textarea></div>
<div class="field"><label>Status</label><select name="status"><option>Draft</option><option>Approved</option><option>In Progress</option><option>Completed</option></select></div></div><button type="submit">Save Quality Plan</button></form></section>
<section class="panel"><h2>Saved quality plans</h2><div class="table-wrap"><table><tr><th>ID</th><th>Title</th><th>Objective</th><th>Factor</th><th>Owner</th><th>Entry / Exit criteria</th><th>Status</th></tr>
<% for(Map row:plans){%><tr><td><%=cell(row,"id")%></td><td><%=cell(row,"title")%></td><td><%=cell(row,"objective")%></td><td><%=cell(row,"quality_factor")%></td><td><%=cell(row,"owner_name")%></td><td><%=cell(row,"entry_criteria")%> / <%=cell(row,"exit_criteria")%></td><td><%=cell(row,"status")%></td></tr><%}%></table></div></section>
<% } else if(tab.equals("reviews")) { %>
<section class="panel"><h2>Record review / verification</h2><form method="post" action="<%=request.getContextPath()%>/qms"><input type="hidden" name="action" value="review"><div class="grid">
<div class="field"><label>Review type *</label><select name="reviewType"><option>Requirements Review</option><option>Design Review</option><option>Code Review</option><option>Test Review</option><option>Release Verification</option><option>Documentation Review</option></select></div>
<div class="field"><label>Artifact / version *</label><input name="artifact" required placeholder="Requirements v1.0"></div>
<div class="field"><label>Reviewer *</label><input name="reviewer" required></div>
<div class="field"><label>Review date</label><input type="date" name="reviewDate"></div>
<div class="field"><label>Result</label><select name="result"><option>Pending</option><option>Approved</option><option>Needs Changes</option><option>Rejected</option></select></div>
<div class="field wide"><label>Comments / findings</label><textarea name="comments" placeholder="Checklist findings, evidence, action items"></textarea></div></div><button>Save Review</button></form></section>
<section class="panel"><h2>Review history</h2><div class="table-wrap"><table><tr><th>ID</th><th>Type</th><th>Artifact</th><th>Reviewer</th><th>Date</th><th>Result</th><th>Comments</th></tr><%for(Map row:reviews){%><tr><td><%=cell(row,"id")%></td><td><%=cell(row,"review_type")%></td><td><%=cell(row,"artifact")%></td><td><%=cell(row,"reviewer")%></td><td><%=cell(row,"review_date")%></td><td><%=cell(row,"result")%></td><td><%=cell(row,"comments")%></td></tr><%}%></table></div></section>
<% } else if(tab.equals("defects")) { %>
<section class="panel"><h2>Identify and classify defect</h2><form method="post" action="<%=request.getContextPath()%>/qms"><input type="hidden" name="action" value="defect"><div class="grid">
<div class="field"><label>Defect title *</label><input name="defectTitle" required></div><div class="field"><label>Category</label><select name="category"><option>Data inconsistency</option><option>Usability</option><option>Documentation</option><option>Requirements</option><option>Design</option><option>Code</option><option>Testing</option><option>Security</option><option>Performance</option></select></div>
<div class="field"><label>Severity</label><select name="severity"><option>Low</option><option>Medium</option><option>High</option><option>Critical</option></select></div><div class="field"><label>Assigned to</label><input name="assignedTo"></div><div class="field"><label>Found in</label><input name="foundIn" placeholder="e.g. code review / system test"></div><div class="field wide"><label>Description *</label><textarea name="description" required></textarea></div></div><button>Register Defect</button></form></section>
<section class="panel"><h2>Defect lifecycle and records</h2><p class="hint">Identification → Classification → Assignment → Correction → Verification → Closure</p><div class="table-wrap"><table><tr><th>ID</th><th>Defect</th><th>Category</th><th>Severity</th><th>Assigned</th><th>Status</th><th>Description</th></tr><%for(Map row:defects){%><tr><td><%=cell(row,"id")%></td><td><%=cell(row,"title")%></td><td><%=cell(row,"category")%></td><td><%=cell(row,"severity")%></td><td><%=cell(row,"assigned_to")%></td><td><%=cell(row,"status")%></td><td><%=cell(row,"description")%></td></tr><%}%></table></div></section>
<section class="panel"><h2>Update defect status</h2><form method="post" action="<%=request.getContextPath()%>/qms"><input type="hidden" name="action" value="defectStatus"><div class="grid"><div class="field"><label>Defect ID *</label><input type="number" min="1" name="defectId" required></div><div class="field"><label>New status</label><select name="newStatus"><option>Assigned</option><option>In Progress</option><option>Fixed - Pending Verification</option><option>Verified</option><option>Closed</option><option>Reopened</option></select></div><div class="field wide"><label>Correction / verification notes</label><textarea name="resolution"></textarea></div></div><button>Update Defect</button></form><p class="hint">Use the ID shown in the defect table. Close a defect only after verification.</p></section>
<% } else if(tab.equals("actions")) { %>
<section class="panel"><h2>Corrective and preventive action (CAPA)</h2><form method="post" action="<%=request.getContextPath()%>/qms"><input type="hidden" name="action" value="qualityAction"><div class="grid">
<div class="field wide"><label>Problem *</label><textarea name="problem" required></textarea></div><div class="field wide"><label>Root cause *</label><textarea name="rootCause" required placeholder="Why did the issue occur?"></textarea></div><div class="field"><label>Corrective action *</label><textarea name="corrective" required></textarea></div><div class="field"><label>Preventive action *</label><textarea name="preventive" required></textarea></div><div class="field"><label>Owner</label><input name="actionOwner"></div><div class="field"><label>Status</label><select name="actionStatus"><option>Open</option><option>In Progress</option><option>Pending Verification</option><option>Verified</option><option>Closed</option></select></div><div class="field wide"><label>Verification evidence</label><textarea name="verification"></textarea></div></div><button>Save Corrective Action</button></form></section>
<section class="panel"><h2>CAPA records</h2><div class="table-wrap"><table><tr><th>ID</th><th>Problem</th><th>Root cause</th><th>Corrective action</th><th>Preventive action</th><th>Owner</th><th>Status</th><th>Verification</th></tr><%for(Map row:actions){%><tr><td><%=cell(row,"id")%></td><td><%=cell(row,"problem")%></td><td><%=cell(row,"root_cause")%></td><td><%=cell(row,"corrective_action")%></td><td><%=cell(row,"preventive_action")%></td><td><%=cell(row,"owner_name")%></td><td><%=cell(row,"status")%></td><td><%=cell(row,"verification")%></td></tr><%}%></table></div></section>
<% } else if(tab.equals("checklists")) { %>
<section class="panel"><h2>Quality checklist</h2><form method="post" action="<%=request.getContextPath()%>/qms"><input type="hidden" name="action" value="checklist"><div class="grid"><div class="field"><label>Stage</label><select name="stage"><option>Requirements</option><option>Design</option><option>Code</option><option>Testing</option><option>Release</option><option>Documentation</option></select></div><div class="field"><label>Checklist item *</label><input name="itemText" required placeholder="All requirements are clear and testable"></div><div class="field"><label>Responsible person</label><input name="responsible"></div><div class="field"><label>Result</label><select name="checkResult"><option>Not Checked</option><option>Pass</option><option>Fail</option><option>Not Applicable</option></select></div><div class="field wide"><label>Notes / evidence</label><textarea name="checkNotes"></textarea></div></div><button>Save Checklist Item</button></form></section>
<section class="panel"><h2>Checklist register</h2><div class="table-wrap"><table><tr><th>ID</th><th>Stage</th><th>Item</th><th>Responsible</th><th>Result</th><th>Notes</th></tr><%for(Map row:checklists){%><tr><td><%=cell(row,"id")%></td><td><%=cell(row,"stage")%></td><td><%=cell(row,"item_text")%></td><td><%=cell(row,"responsible")%></td><td><%=cell(row,"result")%></td><td><%=cell(row,"notes")%></td></tr><%}%></table></div></section>
<% } else if(tab.equals("improvements")) { %>
<section class="panel"><h2>Continuous improvement register</h2><form method="post" action="<%=request.getContextPath()%>/qms"><input type="hidden" name="action" value="improvement"><div class="grid"><div class="field"><label>Metric / source</label><input name="sourceMetric" placeholder="Defect closure rate"></div><div class="field"><label>Owner</label><input name="improvementOwner"></div><div class="field wide"><label>Observation *</label><textarea name="observation" required placeholder="Repeated documentation defects were found during review"></textarea></div><div class="field wide"><label>Proposed process change *</label><textarea name="proposedChange" required placeholder="Introduce a mandatory documentation checklist"></textarea></div><div class="field"><label>Status</label><select name="improvementStatus"><option>Proposed</option><option>Approved</option><option>In Progress</option><option>Verified</option><option>Rejected</option></select></div><div class="field"><label>Outcome / evidence</label><textarea name="outcome"></textarea></div></div><button>Save Improvement</button></form></section>
<section class="panel"><h2>Improvement history</h2><div class="table-wrap"><table><tr><th>ID</th><th>Source metric</th><th>Observation</th><th>Proposed change</th><th>Owner</th><th>Status</th><th>Outcome</th></tr><%for(Map row:improvements){%><tr><td><%=cell(row,"id")%></td><td><%=cell(row,"source_metric")%></td><td><%=cell(row,"observation")%></td><td><%=cell(row,"proposed_change")%></td><td><%=cell(row,"owner_name")%></td><td><%=cell(row,"status")%></td><td><%=cell(row,"outcome")%></td></tr><%}%></table></div></section>
<% } else if(tab.equals("reports")) { %>
<section class="panel"><h2>Quality status report</h2><p>Report generated from current saved database records.</p><div class="cards"><div class="card"><small>Plans</small><div class="num"><%=planCount%></div></div><div class="card"><small>Reviews</small><div class="num"><%=reviewCount%></div></div><div class="card"><small>Approved reviews</small><div class="num"><%=reviewPassed%></div></div><div class="card"><small>Approval rate</small><div class="num"><%=reviewCount==0?0:Math.round(reviewPassed*100.0/reviewCount)%>%</div></div><div class="card"><small>Total defects</small><div class="num"><%=defectCount%></div></div><div class="card"><small>Open defects</small><div class="num"><%=openDefects%></div></div><div class="card"><small>Closure rate</small><div class="num"><%=defectCount==0?0:Math.round(closedDefects*100.0/defectCount)%>%</div></div><div class="card"><small>CAPA records</small><div class="num"><%=actionCount%></div></div></div><h3>Metric definitions</h3><ul><li>Review approval rate = approved reviews ÷ all reviews × 100.</li><li>Defect closure rate = closed defects ÷ all defects × 100.</li><li>Open defects are defects whose status is not Closed.</li><li>Use severity and repeated categories to prioritize corrective and preventive actions.</li></ul><button onclick="window.print()">Print / Save as PDF</button></section>
<% } %>
</main><footer>Library Software QMS · Educational prototype · Use realistic test data only</footer></body></html>

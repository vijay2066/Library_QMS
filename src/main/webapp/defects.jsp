
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Defect Management - Library QMS</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3f5f9;
            color: #263248;
        }

        header {
            background: #17365d;
            color: white;
            padding: 22px;
            text-align: center;
        }

        nav {
            background: #244b78;
            padding: 14px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }

        .container {
            max-width: 950px;
            margin: 25px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px #00000012;
        }

        h2 {
            color: #17365d;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 18px;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        label {
            font-weight: bold;
        }

        input, select, textarea {
            padding: 10px;
            border: 1px solid #cbd5e1;
            border-radius: 5px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

        textarea {
            min-height: 75px;
            resize: vertical;
        }

        .full {
            grid-column: 1 / -1;
        }

        button {
            margin-top: 20px;
            padding: 12px 20px;
            background: #244b78;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover {
            background: #17365d;
        }

        .secondary {
            background: #64748b;
            margin-left: 8px;
        }

        #message {
            font-weight: bold;
        }

        .note {
            color: #64748b;
            font-size: 14px;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #667085;
        }
    </style>
</head>

<body>
<div style="padding:12px;background:#e1ebf8;text-align:center;font-family:Arial"><a style="font-weight:bold;color:#17365d" href="qms">Open the complete database-backed QMS application</a></div>

<header>
    <h1>Library Software Quality Management System</h1>
    <p>Defect and Non-Conformance Management</p>
</header>

<nav>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="quality-plan.jsp">Quality Plan</a>
    <a href="reviews.jsp">Reviews</a>
    <a href="defects.jsp">Defects</a>
    <a href="metrics.jsp">Metrics</a>
    <a href="reports.jsp">Reports</a>
</nav>

<div class="container">

    <h2>Record a Defect</h2>

    <p>
        Record software problems, classify their severity,
        assign responsibility, and track correction and verification.
    </p>

    <form id="defectForm">

        <div class="form-grid">

            <div class="field">
                <label for="defectId">Defect ID</label>
                <input type="text" id="defectId"
                       value="DEF-001" required>
            </div>

            <div class="field">
                <label for="date">Date Identified</label>
                <input type="date" id="date" required>
            </div>

            <div class="field">
                <label for="category">Defect Category</label>
                <select id="category" required>
                    <option value="">Select category</option>
                    <option>Requirements Defect</option>
                    <option>Design Defect</option>
                    <option>Coding Defect</option>
                    <option>Testing Defect</option>
                    <option>Documentation Defect</option>
                    <option>Usability Defect</option>
                    <option>Data Inconsistency</option>
                    <option>Security Defect</option>
                </select>
            </div>

            <div class="field">
                <label for="severity">Severity</label>
                <select id="severity" required>
                    <option value="">Select severity</option>
                    <option>Critical</option>
                    <option>High</option>
                    <option>Medium</option>
                    <option>Low</option>
                </select>
            </div>

            <div class="field">
                <label for="priority">Priority</label>
                <select id="priority" required>
                    <option value="">Select priority</option>
                    <option>Urgent</option>
                    <option>High</option>
                    <option>Normal</option>
                    <option>Low</option>
                </select>
            </div>

            <div class="field">
                <label for="module">Affected Module</label>
                <select id="module" required>
                    <option value="">Select module</option>
                    <option>Book Management</option>
                    <option>Member Management</option>
                    <option>Borrowing and Returns</option>
                    <option>Reservations</option>
                    <option>Fine Calculation</option>
                    <option>Reports</option>
                    <option>Documentation</option>
                    <option>Other</option>
                </select>
            </div>

            <div class="field full">
                <label for="title">Defect Title</label>
                <input type="text" id="title"
                       placeholder="Short description of the defect"
                       required>
            </div>

            <div class="field full">
                <label for="description">Defect Description</label>
                <textarea id="description"
                    placeholder="Explain the problem and how to reproduce it"
                    required></textarea>
            </div>

            <div class="field">
                <label for="reportedBy">Reported By</label>
                <input type="text" id="reportedBy"
                       placeholder="Team member name" required>
            </div>

            <div class="field">
                <label for="assignedTo">Assigned To</label>
                <input type="text" id="assignedTo"
                       placeholder="Person responsible for fixing it"
                       required>
            </div>

            <div class="field">
                <label for="status">Defect Status</label>
                <select id="status" required>
                    <option value="">Select status</option>
                    <option>Open</option>
                    <option>Assigned</option>
                    <option>In Progress</option>
                    <option>Fixed - Awaiting Verification</option>
                    <option>Closed</option>
                    <option>Reopened</option>
                </select>
            </div>

            <div class="field">
                <label for="verification">Verification Result</label>
                <select id="verification" required>
                    <option value="">Select result</option>
                    <option>Not Verified</option>
                    <option>Passed</option>
                    <option>Failed</option>
                </select>
            </div>

            <div class="field full">
                <label for="correction">Corrective Action</label>
                <textarea id="correction"
                    placeholder="Describe the fix or action planned"></textarea>
            </div>

        </div>

        <button type="submit">Validate Defect</button>
        <button type="reset" class="secondary">Clear Form</button>

        <p id="message" role="status"></p>

        <p class="note">
            Prototype version: defect records are not saved permanently yet.
        </p>

    </form>

</div>

<footer>
    Library QMS Prototype | Software Quality Assurance Project
</footer>

<script>
    document.getElementById("defectForm").addEventListener(
        "submit", function(event) {
            event.preventDefault();

            document.getElementById("message").textContent =
                "Defect details validated successfully. " +
                "Permanent storage will be added later.";

            document.getElementById("message").style.color = "#166534";
        }
    );
</script>

</body>
</html>

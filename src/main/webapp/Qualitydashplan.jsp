
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quality Plan - Library QMS</title>

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
            margin: 0 12px;
        }

        .container {
            max-width: 900px;
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
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
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
            font-size: 14px;
            font-family: Arial, sans-serif;
        }

        textarea {
            min-height: 80px;
            resize: vertical;
        }

        .full {
            grid-column: 1 / -1;
        }

        button {
            padding: 12px 20px;
            background: #244b78;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            margin-top: 20px;
        }

        button:hover {
            background: #17365d;
        }

        .secondary {
            background: #64748b;
            margin-left: 8px;
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
    <p>Quality Planning Module</p>
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

    <h2>Create Quality Plan</h2>
    <p>
        Document the quality objectives, standards, responsibilities,
        reviews and testing activities for the project.
    </p>

    <form id="qualityForm">

        <div class="form-grid">

            <div class="field">
                <label for="planId">Plan ID</label>
                <input type="text" id="planId"
                       value="QP-001" required>
            </div>

            <div class="field">
                <label for="projectName">Project Name</label>
                <input type="text" id="projectName"
                       value="Library Management Software" required>
            </div>

            <div class="field full">
                <label for="objective">Quality Objective</label>
                <textarea id="objective" required
                    placeholder="Example: Reduce data inconsistencies and ensure accurate records."></textarea>
            </div>

            <div class="field">
                <label for="factor">Quality Factor</label>
                <select id="factor" required>
                    <option value="">Select quality factor</option>
                    <option>Reliability</option>
                    <option>Usability</option>
                    <option>Functional Correctness</option>
                    <option>Maintainability</option>
                    <option>Security</option>
                    <option>Performance Efficiency</option>
                </select>
            </div>

            <div class="field">
                <label for="criteria">Quality Criteria</label>
                <input type="text" id="criteria" required
                    placeholder="Example: All critical tests must pass">
            </div>

            <div class="field">
                <label for="responsible">Responsible Person</label>
                <input type="text" id="responsible" required
                    placeholder="Team member or role">
            </div>

            <div class="field">
                <label for="review">Review Activity</label>
                <select id="review" required>
                    <option value="">Select review activity</option>
                    <option>Requirements Review</option>
                    <option>Design Review</option>
                    <option>Code Review</option>
                    <option>Test Case Review</option>
                    <option>Release Review</option>
                </select>
            </div>

            <div class="field full">
                <label for="testing">Testing Activity</label>
                <textarea id="testing" required
                    placeholder="Example: Test borrowing, returning, reservations and fine calculations."></textarea>
            </div>

            <div class="field">
                <label for="entry">Entry Criteria</label>
                <textarea id="entry" required
                    placeholder="Conditions that must be met before work begins."></textarea>
            </div>

            <div class="field">
                <label for="exit">Exit Criteria</label>
                <textarea id="exit" required
                    placeholder="Conditions required to complete the activity."></textarea>
            </div>

            <div class="field">
                <label for="status">Plan Status</label>
                <select id="status" required>
                    <option>Draft</option>
                    <option>Under Review</option>
                    <option>Approved</option>
                    <option>Needs Revision</option>
                </select>
            </div>

        </div>

        <button type="submit">Validate Quality Plan</button>
        <button type="reset" class="secondary">Clear Form</button>

        <p id="message" role="status"></p>

    </form>

</div>

<footer>
    Library QMS Prototype | Software Quality Assurance Project
</footer>

<script>
    document.getElementById("qualityForm").addEventListener(
        "submit", function(event) {
            event.preventDefault();

            document.getElementById("message").textContent =
                "Quality plan details validated successfully. " +
                "This prototype does not save the plan permanently yet.";
            document.getElementById("message").style.color = "#166534";
        }
    );
</script>

</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reviews - Library QMS</title>

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
            font-size: 14px;
            font-family: Arial, sans-serif;
        }

        textarea {
            min-height: 75px;
            resize: vertical;
        }

        .full {
            grid-column: 1 / -1;
        }

        button {
            padding: 12px 20px;
            margin-top: 20px;
            background: #244b78;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
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
    <p>Reviews and Verification Module</p>
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

    <h2>Record a Quality Review</h2>

    <p>
        Record review activities performed by the development
        team to identify mistakes and improve software quality.
    </p>

    <form id="reviewForm">

        <div class="form-grid">

            <div class="field">
                <label for="reviewId">Review ID</label>
                <input type="text" id="reviewId"
                       value="REV-001" required>
            </div>

            <div class="field">
                <label for="reviewType">Review Type</label>
                <select id="reviewType" required>
                    <option value="">Select review type</option>
                    <option>Requirements Review</option>
                    <option>Design Review</option>
                    <option>Code Review</option>
                    <option>Test Case Review</option>
                    <option>Release Review</option>
                </select>
            </div>

            <div class="field">
                <label for="reviewer">Reviewer Name</label>
                <input type="text" id="reviewer"
                       placeholder="Enter reviewer name" required>
            </div>

            <div class="field">
                <label for="date">Review Date</label>
                <input type="date" id="date" required>
            </div>

            <div class="field full">
                <label for="item">Item Reviewed</label>
                <input type="text" id="item"
                       placeholder="Example: Book borrowing module"
                       required>
            </div>

            <div class="field full">
                <label for="checklist">Checklist Used</label>
                <textarea id="checklist" required
                    placeholder="Example: Requirements are complete, design is correct, coding standards are followed."></textarea>
            </div>

            <div class="field">
                <label for="findings">Review Findings</label>
                <textarea id="findings"
                    placeholder="Describe any issues identified"></textarea>
            </div>

            <div class="field">
                <label for="defects">Defects Identified</label>
                <input type="number" id="defects"
                       min="0" value="0" required>
            </div>

            <div class="field">
                <label for="status">Review Status</label>
                <select id="status" required>
                    <option value="">Select status</option>
                    <option>Planned</option>
                    <option>In Progress</option>
                    <option>Completed</option>
                    <option>Needs Rework</option>
                </select>
            </div>

            <div class="field">
                <label for="action">Follow-up Action</label>
                <select id="action" required>
                    <option value="">Select action</option>
                    <option>No Action Required</option>
                    <option>Correct Defects</option>
                    <option>Repeat Review</option>
                    <option>Refer to Defect Tracking</option>
                </select>
            </div>

        </div>

        <button type="submit">Validate Review</button>
        <button type="reset" class="secondary">Clear Form</button>

        <p id="message" role="status"></p>

        <p class="note">
            Prototype version: review records are not saved permanently yet.
        </p>

    </form>

</div>

<footer>
    Library QMS Prototype | Software Quality Assurance Project
</footer>

<script>
    document.getElementById("reviewForm").addEventListener(
        "submit", function(event) {
            event.preventDefault();

            document.getElementById("message").textContent =
                "Review details validated successfully. " +
                "Permanent storage will be added later.";

            document.getElementById("message").style.color = "#166534";
        }
    );
</script>

</body>
</html>


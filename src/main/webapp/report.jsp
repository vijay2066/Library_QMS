
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quality Reports - Library QMS</title>

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

        nav a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 1000px;
            margin: 25px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px #00000012;
        }

        h2 {
            color: #17365d;
        }

        .cards {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(180px, 1fr));
            gap: 18px;
            margin: 25px 0;
        }

        .card {
            background: #eef4fb;
            border-left: 5px solid #244b78;
            border-radius: 8px;
            padding: 20px;
        }

        .card h3 {
            font-size: 15px;
            margin-top: 0;
        }

        .number {
            font-size: 28px;
            font-weight: bold;
            color: #17365d;
        }

        .form-field {
            margin: 20px 0;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        select, input {
            padding: 11px;
            width: 100%;
            max-width: 450px;
            border: 1px solid #cbd5e1;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 12px 20px;
            background: #244b78;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px 5px 5px 0;
        }

        button:hover {
            background: #17365d;
        }

        .secondary {
            background: #64748b;
        }

        .report-output {
            margin-top: 25px;
            padding: 20px;
            background: #f8fafc;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            display: none;
        }

        .report-output h3 {
            color: #17365d;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #cbd5e1;
            padding: 12px;
            text-align: left;
        }

        th {
            background: #244b78;
            color: white;
        }

        .note {
            color: #64748b;
            font-size: 13px;
        }

        .improvement {
            background: #fff7ed;
            border-left: 4px solid #f59e0b;
            padding: 15px;
            margin-top: 20px;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #667085;
        }

        @media print {
            nav, .report-form, footer,
            .note, .print-button {
                display: none !important;
            }

            body, .container {
                background: white;
                box-shadow: none;
            }

            .report-output {
                display: block !important;
            }
        }
    </style>
</head>

<body>
<div style="padding:12px;background:#e1ebf8;text-align:center;font-family:Arial"><a style="font-weight:bold;color:#17365d" href="qms">Open the complete database-backed QMS application</a></div>

<header>
    <h1>Library Software Quality Management System</h1>
    <p>Quality Reporting Module</p>
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

    <h2>Quality Status Dashboard</h2>

    <p>
        This dashboard provides an overview of software
        quality activities for the Library Management System.
    </p>

    <div class="cards">

        <div class="card">
            <h3>Quality Objectives</h3>
            <div class="number">5</div>
            <p>Defined quality objectives</p>
        </div>

        <div class="card">
            <h3>Total Reviews</h3>
            <div class="number">10</div>
            <p>Reviews conducted</p>
        </div>

        <div class="card">
            <h3>Defects Found</h3>
            <div class="number">5</div>
            <p>Reported software defects</p>
        </div>

        <div class="card">
            <h3>Defects Closed</h3>
            <div class="number">3</div>
            <p>Verified and closed defects</p>
        </div>

        <div class="card">
            <h3>Defect Closure Rate</h3>
            <div class="number">60%</div>
            <p>Percentage of defects closed</p>
        </div>

        <div class="card">
            <h3>Test Pass Rate</h3>
            <div class="number">90%</div>
            <p>Percentage of tests passed</p>
        </div>

    </div>

    <p class="note">
        Note: These are demonstration values.
        Database integration will be added later.
    </p>

    <div class="report-form">

        <h2>Generate Quality Report</h2>

        <form id="reportForm">

            <div class="form-field">
                <label for="reportType">Select Report Type</label>

                <select id="reportType" required>
                    <option value="">Select report</option>
                    <option value="summary">
                        Overall Quality Summary
                    </option>
                    <option value="defects">
                        Defect Status Report
                    </option>
                    <option value="reviews">
                        Review Activity Report
                    </option>
                    <option value="testing">
                        Testing Performance Report
                    </option>
                    <option value="improvement">
                        Process Improvement Report
                    </option>
                </select>
            </div>

            <div class="form-field">
                <label for="reportDate">Report Date</label>
                <input type="date" id="reportDate" required>
            </div>

            <div class="form-field">
                <label for="preparedBy">Prepared By</label>
                <input type="text" id="preparedBy"
                       placeholder="Enter team member name"
                       required>
            </div>

            <button type="submit">Generate Report</button>

        </form>

    </div>

    <div class="report-output" id="reportOutput">

        <h2 id="reportTitle">Quality Report</h2>

        <p>
            <strong>Project:</strong>
            Library Management Software
        </p>

        <p>
            <strong>Report Date:</strong>
            <span id="displayDate"></span>
        </p>

        <p>
            <strong>Prepared By:</strong>
            <span id="displayName"></span>
        </p>

        <div id="reportContent"></div>

        <button type="button"
                class="print-button"
                onclick="window.print()">
            Print Report
        </button>

    </div>

</div>

<footer>
    Library QMS Prototype | Software Quality Assurance Project
</footer>

<script>

    document.getElementById("reportDate").value =
        new Date().toLocaleDateString("en-CA");

    document.getElementById("reportForm").addEventListener(
        "submit", function(event) {

            event.preventDefault();

            const type =
                document.getElementById("reportType").value;

            const date =
                document.getElementById("reportDate").value;

            const name =
                document.getElementById("preparedBy").value;

            const output =
                document.getElementById("reportOutput");

            const title =
                document.getElementById("reportTitle");

            const content =
                document.getElementById("reportContent");

            document.getElementById("displayDate")
                .textContent = date;

            document.getElementById("displayName")
                .textContent = name;

            let reportHTML = "";

            if (type === "summary") {

                title.textContent =
                    "Overall Quality Summary Report";

                reportHTML = `
                    <table>
                        <tr>
                            <th>Quality Metric</th>
                            <th>Value</th>
                        </tr>
                        <tr>
                            <td>Quality Objectives</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>Reviews Completed</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>Defects Found</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>Defects Closed</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <td>Defect Closure Rate</td>
                            <td>60%</td>
                        </tr>
                        <tr>
                            <td>Test Pass Rate</td>
                            <td>90%</td>
                        </tr>
                    </table>
                `;
            }

            else if (type === "defects") {

                title.textContent =
                    "Defect Status Report";

                reportHTML = `
                    <table>
                        <tr>
                            <th>Defect Metric</th>
                            <th>Value</th>
                        </tr>
                        <tr>
                            <td>Total Defects</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>Closed Defects</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <td>Remaining Defects</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>Closure Rate</td>
                            <td>60%</td>
                        </tr>
                    </table>

                    <div class="improvement">
                        <strong>Recommended Action:</strong>
                        Review the two remaining defects,
                        assign responsibility and verify
                        corrections before closure.
                    </div>
                `;
            }

            else if (type === "reviews") {

                title.textContent =
                    "Review Activity Report";

                reportHTML = `
                    <table>
                        <tr>
                            <th>Review Activity</th>
                            <th>Sample Count</th>
                        </tr>
                        <tr>
                            <td>Requirements Reviews</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <td>Design Reviews</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>Code Reviews</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <td>Test Reviews</td>
                            <td>2</td>
                        </tr>
                    </table>
                `;
            }

            else if (type === "testing") {

                title.textContent =
                    "Testing Performance Report";

                reportHTML = `
                    <table>
                        <tr>
                            <th>Testing Metric</th>
                            <th>Value</th>
                        </tr>
                        <tr>
                            <td>Total Test Cases</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>Passed Tests</td>
                            <td>9</td>
                        </tr>
                        <tr>
                            <td>Failed Tests</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>Test Pass Rate</td>
                            <td>90%</td>
                        </tr>
                    </table>

                    <div class="improvement">
                        <strong>Recommended Action:</strong>
                        Investigate the failed test case,
                        correct the issue and repeat testing.
                    </div>
                `;
            }

            else if (type === "improvement") {

                title.textContent =
                    "Process Improvement Report";

                reportHTML = `
                    <h3>Quality Problem</h3>
                    <p>
                        Defects may occur in book borrowing,
                        returns and availability updates.
                    </p>

                    <h3>Possible Root Cause</h3>
                    <p>
                        Incomplete requirements review or
                        insufficient test coverage.
                    </p>

                    <h3>Corrective Action</h3>
                    <p>
                        Fix confirmed defects and repeat
                        the relevant test cases.
                    </p>

                    <h3>Preventive Action</h3>
                    <p>
                        Introduce mandatory code reviews,
                        review checklists and additional
                        test cases for important operations.
                    </p>

                    <h3>Verification</h3>
                    <p>
                        Confirm that corrected defects
                        pass retesting and record the result.
                    </p>

                    <h3>Continuous Improvement</h3>
                    <p>
                        Compare quality metrics across
                        development cycles and improve
                        review and testing procedures.
                    </p>
                `;
            }

            content.innerHTML = reportHTML;

            output.style.display = "block";

            output.scrollIntoView({
                behavior: "smooth"
            });

        }
    );

</script>

</body>
</html>

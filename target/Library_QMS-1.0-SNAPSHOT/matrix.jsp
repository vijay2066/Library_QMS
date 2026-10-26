<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quality Metrics - Library QMS</title>

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

        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 18px;
            margin: 25px 0;
        }

        .card {
            padding: 22px;
            background: #eef4fb;
            border-left: 5px solid #244b78;
            border-radius: 8px;
        }

        .card h3 {
            margin-top: 0;
            font-size: 15px;
        }

        .value {
            font-size: 28px;
            font-weight: bold;
            color: #17365d;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 7px;
            margin-bottom: 18px;
        }

        label {
            font-weight: bold;
        }

        input, select {
            padding: 10px;
            border: 1px solid #cbd5e1;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            padding: 12px 20px;
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
            margin-top: 15px;
        }

        .note {
            color: #64748b;
            font-size: 13px;
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
    <p>Quality Metrics and Measurement Module</p>
</header>

<nav>
    <a href="index.html">Home</a>
    <a href="quality-plan.jsp">Quality Plan</a>
    <a href="reviews.jsp">Reviews</a>
    <a href="defects.jsp">Defects</a>
    <a href="metrics.jsp">Metrics</a>
    <a href="reports.jsp">Reports</a>
</nav>

<div class="container">

    <h2>Software Quality Dashboard</h2>

    <p>
        Quality metrics help the development team measure software
        quality, review activities, defects, and testing performance.
    </p>

    <div class="metrics-grid">

        <div class="card">
            <h3>Total Reviews</h3>
            <div class="value" id="totalReviews">10</div>
            <p>Reviews conducted</p>
        </div>

        <div class="card">
            <h3>Defects Found</h3>
            <div class="value" id="defectsFound">5</div>
            <p>Issues identified</p>
        </div>

        <div class="card">
            <h3>Defects Fixed</h3>
            <div class="value" id="defectsFixed">3</div>
            <p>Issues corrected</p>
        </div>

        <div class="card">
            <h3>Defect Closure Rate</h3>
            <div class="value" id="closureRate">60%</div>
            <p>Percentage of defects closed</p>
        </div>

        <div class="card">
            <h3>Test Pass Rate</h3>
            <div class="value" id="testPassRate">90%</div>
            <p>Percentage of tests passed</p>
        </div>

    </div>

    <h2>Update Quality Metrics</h2>

    <form id="metricsForm">

        <div class="field">
            <label for="reviews">Total Reviews Conducted</label>
            <input type="number" id="reviews" min="0" value="10" required>
        </div>

        <div class="field">
            <label for="found">Total Defects Found</label>
            <input type="number" id="found" min="0" value="5" required>
        </div>

        <div class="field">
            <label for="fixed">Total Defects Closed</label>
            <input type="number" id="fixed" min="0" value="3" required>
        </div>

        <div class="field">
            <label for="tests">Total Test Cases</label>
            <input type="number" id="tests" min="0" value="10" required>
        </div>

        <div class="field">
            <label for="passed">Test Cases Passed</label>
            <input type="number" id="passed" min="0" value="9" required>
        </div>

        <button type="submit">Calculate Metrics</button>
        <button type="reset" class="secondary">Reset</button>

        <p id="message" role="status"></p>

    </form>

    <p class="note">
        Prototype: The displayed values are sample data.
        Calculated metrics are not saved permanently.
    </p>

</div>

<footer>
    Library QMS Prototype | Software Quality Assurance Project
</footer>

<script>
    const form = document.getElementById("metricsForm");
    const message = document.getElementById("message");

    form.addEventListener("submit", function(event) {
        event.preventDefault();

        const reviews = Number(document.getElementById("reviews").value);
        const found = Number(document.getElementById("found").value);
        const fixed = Number(document.getElementById("fixed").value);
        const tests = Number(document.getElementById("tests").value);
        const passed = Number(document.getElementById("passed").value);

        if (fixed > found) {
            message.style.color = "#b91c1c";
            message.textContent =
                "Error: Closed defects cannot exceed total defects found.";
            return;
        }

        if (passed > tests) {
            message.style.color = "#b91c1c";
            message.textContent =
                "Error: Passed test cases cannot exceed total test cases.";
            return;
        }

        const closureRate = found === 0
            ? 0
            : (fixed / found) * 100;

        const passRate = tests === 0
            ? 0
            : (passed / tests) * 100;

        document.getElementById("totalReviews").textContent = reviews;
        document.getElementById("defectsFound").textContent = found;
        document.getElementById("defectsFixed").textContent = fixed;

        document.getElementById("closureRate").textContent =
            closureRate.toFixed(1) + "%";

        document.getElementById("testPassRate").textContent =
            passRate.toFixed(1) + "%";

        message.style.color = "#166534";
        message.textContent =
            "Quality metrics calculated successfully!";
    });

    form.addEventListener("reset", function() {
        setTimeout(function() {
            message.textContent = "";
        }, 0);
    });
</script>

</body>
</html>

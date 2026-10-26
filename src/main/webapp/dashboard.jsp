
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library QMS Dashboard</title>

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
            padding: 25px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 18px;
        }

        .card {
            background: white;
            padding: 22px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #00000012;
        }

        .number {
            font-size: 30px;
            color: #244b78;
            font-weight: bold;
        }

        .workflow {
            margin-top: 25px;
            background: white;
            padding: 22px;
            border-radius: 10px;
        }

        .stage {
            display: inline-block;
            background: #e1ebf8;
            padding: 12px;
            margin: 5px;
            border-radius: 6px;
            font-weight: bold;
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
    <p>Monitor, Measure and Improve Software Quality</p>
</header>

<nav>
    <a href="index.jsp">Dashboard</a>
    <a href="quality-plan.jsp">Quality Plan</a>
    <a href="reviews.jsp">Reviews</a>
    <a href="defects.jsp">Defects</a>
    <a href="metrics.jsp">Metrics</a>
    <a href="reports.jsp">Reports</a>
</nav>

<div class="container">

    <h2>Quality Dashboard</h2>
    <p>Welcome to the Library QMS project dashboard.</p>

    <div class="cards">

        <div class="card">
            <h3>Quality Objectives</h3>
            <div class="number">5</div>
            <p>Objectives defined for the project</p>
        </div>

        <div class="card">
            <h3>Open Defects</h3>
            <div class="number">0</div>
            <p>Defects awaiting correction</p>
        </div>

        <div class="card">
            <h3>Reviews Completed</h3>
            <div class="number">0</div>
            <p>Completed quality reviews</p>
        </div>

        <div class="card">
            <h3>Test Pass Rate</h3>
            <div class="number">0%</div>
            <p>Based on recorded test results</p>
        </div>

    </div>

</div>

<footer>
    Library QMS Prototype | Software Quality Assurance Project
</footer>

</body>
</html>


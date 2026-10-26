LIBRARY SOFTWARE QUALITY MANAGEMENT SYSTEM (QMS)
=================================================

This is a student prototype for Team 8. It manages quality of the development/maintenance process for library software. It is NOT a full library circulation application.

TECH STACK
----------
- Java 11 source level
- Jakarta EE 10 web application (WAR)
- JSP + Jakarta Servlet
- Maven
- MySQL 8.x recommended
- Apache NetBeans + a Jakarta EE 10-compatible server

FEATURES
--------
1. Dashboard with live counts and calculated quality metrics.
2. Quality plan records: objective, factor, owner, entry/exit criteria, review frequency and status.
3. Review register: requirements/design/code/test/release/documentation reviews.
4. Defect register: category, severity, owner, discovery stage, description and lifecycle status updates.
5. Corrective and preventive action (CAPA) register with root cause and verification evidence.
6. Quality checklist register by project stage.
7. Continuous improvement register.
8. Quality report with approval and defect closure rates; browser print / Save as PDF.
9. Data stored in MySQL and retained after application/server restart.

SETUP
-----
1. Install/start MySQL Server and make sure you know your MySQL username and password.
2. Open MySQL Workbench (or a MySQL command-line client).
3. Open and execute database/schema.sql. This creates database library_qms and its tables.
4. Open src/main/java/com/mycompany/library_qms/DB.java.
5. Change USER and PASSWORD to match your local MySQL credentials. The default password is the placeholder "change_me"; replace it.
6. Open NetBeans. Choose File > Open Project and select the extracted Library_QMS folder containing pom.xml.
7. Allow Maven to download dependencies. Make sure a Jakarta EE 10-compatible server is configured. This is a Jakarta EE web app; do not run it as a Java SE main class. A plain Tomcat setup may require Jakarta EE/JSP support matching the project's Jakarta APIs; use a compatible server/runtime.
8. Clean and Build the project, then Run.
9. Open the application context and use /qms if the home page does not redirect automatically.
10. Add a quality plan, a review, a defect, a checklist item and a CAPA record. Confirm the records remain after a page refresh and server restart.

DATABASE CONFIGURATION
----------------------
Edit DB.java if your MySQL server uses a different host, port, username, password, or database name. Never submit a real password in screenshots or source control.

IMPORTANT
---------
- The ZIP contains implementation code and setup instructions, but this environment cannot run your local NetBeans server or connect to your MySQL instance. Therefore, you must execute the SQL script and configure DB.java before testing end-to-end.
- If you see a build/deployment error, send the complete error text or screenshot; the fix may depend on the server version configured in NetBeans.
- Use fictional/sample records for your demo. Do not enter private student or library-user information.

USE [C:\USERS\SANJU\DESKTOP\2_OLD_NOVAQUIZ\APP_DATA\NV_DB.MDF];
GO

/* =========================================================
   1. INSERT 5 EXAMS
   ========================================================= */

DECLARE @E1 INT, @E2 INT, @E3 INT, @E4 INT, @E5 INT;

INSERT INTO dbo.EXAMS
    (EXAM_TITLE, EXAM_MARKS, TIME_LIMIT, IS_PUBLISHED)
VALUES
    (N'Java Programming',       100, 60, 1),
    (N'Database Management',    100, 60, 1),
    (N'Web Development',        100, 60, 1),
    (N'Python Programming',     100, 60, 1),
    (N'Computer Fundamentals',  100, 60, 1);

-- Get the IDs of the exams just inserted
SELECT @E1 = EXAM_ID FROM dbo.EXAMS WHERE EXAM_TITLE = N'Java Programming';
SELECT @E2 = EXAM_ID FROM dbo.EXAMS WHERE EXAM_TITLE = N'Database Management';
SELECT @E3 = EXAM_ID FROM dbo.EXAMS WHERE EXAM_TITLE = N'Web Development';
SELECT @E4 = EXAM_ID FROM dbo.EXAMS WHERE EXAM_TITLE = N'Python Programming';
SELECT @E5 = EXAM_ID FROM dbo.EXAMS WHERE EXAM_TITLE = N'Computer Fundamentals';


/* =========================================================
   2. INSERT 50 QUESTIONS
   10 QUESTIONS PER EXAM
   ========================================================= */


/* ---------------- JAVA PROGRAMMING ---------------- */

INSERT INTO dbo.QUESTIONS
    (E_ID, Q_TEXT, OPTION_A, OPTION_B, OPTION_C, OPTION_D, CORRECT_OPTION)
VALUES
(@E1, N'Which language is Java primarily based on?', N'C', N'C++', N'Python', N'Ruby', 'B'),

(@E1, N'Which keyword is used to create a class in Java?', N'class', N'Class', N'new', N'struct', 'A'),

(@E1, N'Which method is the entry point of a Java application?', N'start()', N'run()', N'main()', N'execute()', 'C'),

(@E1, N'Which keyword is used to inherit a class in Java?', N'implements', N'inherits', N'extends', N'super', 'C'),

(@E1, N'Which data type stores true or false values?', N'int', N'boolean', N'char', N'float', 'B'),

(@E1, N'Which keyword is used to create an object?', N'object', N'create', N'new', N'make', 'C'),

(@E1, N'Which symbol is used to end a Java statement?', N':', N'.', N';', N',', 'C'),

(@E1, N'Which feature allows Java programs to run on different platforms?', N'Pointers', N'Platform independence', N'Multiple inheritance', N'Operator overloading', 'B'),

(@E1, N'Which package contains the Scanner class?', N'java.io', N'java.util', N'java.lang', N'java.sql', 'B'),

(@E1, N'Which keyword prevents a variable from being changed?', N'static', N'constant', N'final', N'fixed', 'C');


/* ---------------- DATABASE MANAGEMENT ---------------- */

INSERT INTO dbo.QUESTIONS
    (E_ID, Q_TEXT, OPTION_A, OPTION_B, OPTION_C, OPTION_D, CORRECT_OPTION)
VALUES
(@E2, N'What does SQL stand for?', N'Structured Query Language', N'Simple Query Language', N'System Query Language', N'Standard Question Language', 'A'),

(@E2, N'Which command is used to retrieve data from a table?', N'GET', N'SELECT', N'FETCH', N'READ', 'B'),

(@E2, N'Which command is used to add a new record?', N'ADD', N'INSERT', N'CREATE', N'APPEND', 'B'),

(@E2, N'Which command is used to modify existing data?', N'UPDATE', N'CHANGE', N'MODIFY', N'ALTER', 'A'),

(@E2, N'Which command removes records from a table?', N'REMOVE', N'DELETE', N'DROP', N'CLEAR', 'B'),

(@E2, N'Which key uniquely identifies a record?', N'Foreign key', N'Candidate key', N'Primary key', N'Alternate key', 'C'),

(@E2, N'Which SQL command creates a table?', N'MAKE TABLE', N'NEW TABLE', N'CREATE TABLE', N'BUILD TABLE', 'C'),

(@E2, N'Which clause is used to filter records?', N'SORT BY', N'WHERE', N'FILTER', N'ORDER', 'B'),

(@E2, N'Which clause sorts query results?', N'ORDER BY', N'SORT BY', N'GROUP BY', N'ARRANGE BY', 'A'),

(@E2, N'Which function returns the number of rows?', N'TOTAL()', N'COUNT()', N'NUMBER()', N'ROWS()', 'B');


/* ---------------- WEB DEVELOPMENT ---------------- */

INSERT INTO dbo.QUESTIONS
    (E_ID, Q_TEXT, OPTION_A, OPTION_B, OPTION_C, OPTION_D, CORRECT_OPTION)
VALUES
(@E3, N'What does HTML stand for?', N'Hyper Text Markup Language', N'High Text Machine Language', N'Hyperlink Text Management Language', N'Home Tool Markup Language', 'A'),

(@E3, N'Which HTML tag creates a hyperlink?', N'<link>', N'<a>', N'<href>', N'<url>', 'B'),

(@E3, N'Which language is mainly used for styling web pages?', N'Java', N'Python', N'CSS', N'SQL', 'C'),

(@E3, N'Which language is commonly used to make web pages interactive?', N'JavaScript', N'SQL', N'XML', N'C', 'A'),

(@E3, N'Which HTML tag creates a paragraph?', N'<para>', N'<p>', N'<paragraph>', N'<text>', 'B'),

(@E3, N'Which CSS property changes text color?', N'font-color', N'text-color', N'color', N'foreground', 'C'),

(@E3, N'Which HTML tag is used for an image?', N'<picture>', N'<img>', N'<image>', N'<src>', 'B'),

(@E3, N'What does URL stand for?', N'Uniform Resource Locator', N'Universal Resource Link', N'Uniform Reference Link', N'Universal Resource Locator', 'A'),

(@E3, N'Which protocol is commonly used to transfer web pages?', N'FTP', N'HTTP', N'SMTP', N'SSH', 'B'),

(@E3, N'Which HTML element contains the main visible page content?', N'<head>', N'<title>', N'<body>', N'<meta>', 'C');


/* ---------------- PYTHON PROGRAMMING ---------------- */

INSERT INTO dbo.QUESTIONS
    (E_ID, Q_TEXT, OPTION_A, OPTION_B, OPTION_C, OPTION_D, CORRECT_OPTION)
VALUES
(@E4, N'Which symbol is used for comments in Python?', N'//', N'/*', N'#', N'--', 'C'),

(@E4, N'Which function displays output in Python?', N'write()', N'print()', N'display()', N'output()', 'B'),

(@E4, N'Which function is used to get input from the user?', N'read()', N'scan()', N'input()', N'get()', 'C'),

(@E4, N'Which data type stores a sequence of characters?', N'int', N'float', N'str', N'bool', 'C'),

(@E4, N'Which collection is ordered and changeable?', N'tuple', N'set', N'list', N'frozenset', 'C'),

(@E4, N'Which keyword defines a function?', N'function', N'def', N'fun', N'function_def', 'B'),

(@E4, N'Which operator is used for exponentiation?', N'^', N'**', N'//', N'%%', 'B'),

(@E4, N'Which value represents a Boolean true value?', N'true', N'True', N'TRUE', N'yes', 'B'),

(@E4, N'Which keyword is used to create a loop over a sequence?', N'for', N'loop', N'repeat', N'each', 'A'),

(@E4, N'Which function returns the length of an object?', N'length()', N'size()', N'len()', N'count()', 'C');


/* ---------------- COMPUTER FUNDAMENTALS ---------------- */

INSERT INTO dbo.QUESTIONS
    (E_ID, Q_TEXT, OPTION_A, OPTION_B, OPTION_C, OPTION_D, CORRECT_OPTION)
VALUES
(@E5, N'What is the full form of CPU?', N'Central Processing Unit', N'Computer Processing Unit', N'Central Program Unit', N'Control Processing Unit', 'A'),

(@E5, N'Which device is used to enter text?', N'Monitor', N'Keyboard', N'Speaker', N'Printer', 'B'),

(@E5, N'Which device displays output?', N'Keyboard', N'Mouse', N'Monitor', N'Scanner', 'C'),

(@E5, N'Which memory is volatile?', N'ROM', N'RAM', N'Hard Disk', N'Flash Memory', 'B'),

(@E5, N'What is the binary number system based on?', N'8', N'10', N'2', N'16', 'C'),

(@E5, N'Which device is used to move the pointer?', N'Keyboard', N'Mouse', N'Scanner', N'Printer', 'B'),

(@E5, N'Which one is an operating system?', N'Microsoft Word', N'Windows', N'Google Chrome', N'Oracle', 'B'),

(@E5, N'Which unit is commonly used to measure computer storage?', N'Byte', N'Meter', N'Volt', N'Hertz', 'A'),

(@E5, N'Which component performs arithmetic and logical operations?', N'ALU', N'RAM', N'ROM', N'BIOS', 'A'),

(@E5, N'Which device provides permanent storage?', N'RAM', N'Cache', N'Hard Disk', N'Register', 'C');


/* =========================================================
   3. INSERT 1 USER
   ========================================================= */

INSERT INTO dbo.USERS
    (FULLNAME, USERNAME, EMAIL, MOBILE, PASSWORD)
VALUES
(
    N'NovaQuiz Demo User',
    N'novademo',
    N'novademo@example.com',
    N'9999999999',
    N'123456'
);


/* =========================================================
   4. VERIFY
   ========================================================= */

SELECT COUNT(*) AS TotalExams
FROM dbo.EXAMS
WHERE EXAM_TITLE IN
(
    N'Java Programming',
    N'Database Management',
    N'Web Development',
    N'Python Programming',
    N'Computer Fundamentals'
);

SELECT COUNT(*) AS TotalQuestions
FROM dbo.QUESTIONS
WHERE E_ID IN (@E1, @E2, @E3, @E4, @E5);

SELECT *
FROM dbo.USERS
WHERE USERNAME = N'novademo';
GO
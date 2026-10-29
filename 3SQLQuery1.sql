BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @Exams TABLE
    (
        EXAM_ID INT PRIMARY KEY,
        EXAM_MARKS INT
    );

    INSERT INTO @Exams (EXAM_ID, EXAM_MARKS)
    SELECT TOP 5 EXAM_ID, EXAM_MARKS
    FROM dbo.EXAMS
    ORDER BY EXAM_ID;

    IF (SELECT COUNT(*) FROM @Exams) < 5
        THROW 50001, 'At least 5 exams must exist first.', 1;

    DECLARE @NewUsers TABLE
    (
        USERNAME VARCHAR(50),
        FULLNAME VARCHAR(100),
        EMAIL VARCHAR(100),
        MOBILE VARCHAR(20),
        PASSWORD VARCHAR(100)
    );

    INSERT INTO @NewUsers
        (USERNAME, FULLNAME, EMAIL, MOBILE, PASSWORD)
    VALUES
        ('aarav_patel', 'Aarav Patel', 'aarav.patel@example.com', '9000000001', 'Test@123'),
        ('diya_shah', 'Diya Shah', 'diya.shah@example.com', '9000000002', 'Test@123'),
        ('krish_mehta', 'Krish Mehta', 'krish.mehta@example.com', '9000000003', 'Test@123'),
        ('ananya_joshi', 'Ananya Joshi', 'ananya.joshi@example.com', '9000000004', 'Test@123'),
        ('vivaan_trivedi', 'Vivaan Trivedi', 'vivaan.trivedi@example.com', '9000000005', 'Test@123'),
        ('priya_dave', 'Priya Dave', 'priya.dave@example.com', '9000000006', 'Test@123'),
        ('aditya_pandya', 'Aditya Pandya', 'aditya.pandya@example.com', '9000000007', 'Test@123'),
        ('isha_desai', 'Isha Desai', 'isha.desai@example.com', '9000000008', 'Test@123'),
        ('rohan_parmar', 'Rohan Parmar', 'rohan.parmar@example.com', '9000000009', 'Test@123'),
        ('meera_thakkar', 'Meera Thakkar', 'meera.thakkar@example.com', '9000000010', 'Test@123'),
        ('arjun_soni', 'Arjun Soni', 'arjun.soni@example.com', '9000000011', 'Test@123'),
        ('kavya_modi', 'Kavya Modi', 'kavya.modi@example.com', '9000000012', 'Test@123'),
        ('dev_bhatt', 'Dev Bhatt', 'dev.bhatt@example.com', '9000000013', 'Test@123'),
        ('riya_gandhi', 'Riya Gandhi', 'riya.gandhi@example.com', '9000000014', 'Test@123'),
        ('yash_patel', 'Yash Patel', 'yash.patel@example.com', '9000000015', 'Test@123'),
        ('tanvi_shah', 'Tanvi Shah', 'tanvi.shah@example.com', '9000000016', 'Test@123'),
        ('dhruv_jani', 'Dhruv Jani', 'dhruv.jani@example.com', '9000000017', 'Test@123'),
        ('nisha_raval', 'Nisha Raval', 'nisha.raval@example.com', '9000000018', 'Test@123'),
        ('manav_patel', 'Manav Patel', 'manav.patel@example.com', '9000000019', 'Test@123'),
        ('khushi_mehta', 'Khushi Mehta', 'khushi.mehta@example.com', '9000000020', 'Test@123');

    INSERT INTO dbo.USERS
        (USERNAME, FULLNAME, EMAIL, MOBILE, PASSWORD)
    SELECT N.USERNAME, N.FULLNAME, N.EMAIL, N.MOBILE, N.PASSWORD
    FROM @NewUsers N
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.USERS U
        WHERE U.USERNAME = N.USERNAME
           OR U.EMAIL = N.EMAIL
    );

    INSERT INTO dbo.EXAM_RESULTS
        (USER_ID, EXAM_ID, SCORE, TOTAL_MARKS, SUBMITTED_AT)
    SELECT
        U.ID,
        E.EXAM_ID,
        CASE
            WHEN E.EXAM_MARKS > 0 THEN
                CAST(E.EXAM_MARKS *
                    (50 + ((U.ID + E.EXAM_ID) % 51)) / 100 AS INT)
            ELSE 0
        END,
        E.EXAM_MARKS,
        DATEADD(DAY, -((U.ID + E.EXAM_ID) % 30), GETDATE())
    FROM dbo.USERS U
    INNER JOIN @NewUsers N ON N.USERNAME = U.USERNAME
    CROSS JOIN @Exams E
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.EXAM_RESULTS R
        WHERE R.USER_ID = U.ID
          AND R.EXAM_ID = E.EXAM_ID
    );

    COMMIT TRANSACTION;

    SELECT
        U.FULLNAME,
        U.USERNAME,
        COUNT(R.RESULT_ID) AS TOTAL_ATTEMPTS
    FROM dbo.USERS U
    INNER JOIN @NewUsers N ON N.USERNAME = U.USERNAME
    LEFT JOIN dbo.EXAM_RESULTS R ON R.USER_ID = U.ID
    GROUP BY U.FULLNAME, U.USERNAME
    ORDER BY U.USERNAME;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
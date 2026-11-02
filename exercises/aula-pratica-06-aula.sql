USE ULHT_DB26
GO

CREATE TABLE HR.skill_assessment (
    assessment_id INT NOT NULL,
    employee_id INT NOT NULL,
    score DECIMAL(5,2) NOT NULL
);

SELECT assessment_id 
FROM HR.skill_assessment
WHERE assessment_id IS NULL;

SELECT assessment_id, COUNT(*) AS repeticoes
FROM HR.skill_assessment
GROUP BY assessment_id
HAVING COUNT(*) > 1;

ALTER TABLE HR.skill_assessment
ADD CONSTRAINT PK_skill_assessment
PRIMARY KEY (assessment_id);

SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'HR' AND table_name = 'skill_assessment';

SELECT name, is_primary_key, is_unique
FROM sys.indexes
WHERE object_id = OBJECT_ID('HR.skill_assessment', 'U') AND is_primary_key = 1;

CREATE TABLE HR.course_session (
    course_code NVARCHAR(100) NOT NULL,
    session_number SMALLINT NOT NULL,
    starts_on DATE NOT NULL
);

ALTER TABLE HR.course_session
ADD CONSTRAINT PK_course_session
PRIMARY KEY (course_code, session_number);

CREATE TABLE HR.employee_badge (
    badge_row_id INT NOT NULL,
    employee_id INT NOT NULL,
    badge_code VARCHAR(12) NOT NULL
);

INSERT INTO HR.employee_badge (badge_row_id, employee_id, badge_code)
VALUES (75, 101, 'A1B2C3D4E5F6'), (2, 102, 'G7H8I9J0K1L2'), (3, 103, 'M3N4O5P6Q7R8');

/* INSERT INTO HR.employee_badge (badge_row_id, employee_id, badge_code)
 * VALUES (75, 104, 'A1B2C3D4E5F6'); */

ALTER TABLE HR.employee_badge
ADD CONSTRAINT PK_employee_badge
PRIMARY KEY (badge_row_id);

SELECT employee_id, badge_code, COUNT(*) AS repeticoes
FROM HR.employee_badge
GROUP BY employee_id, badge_code
HAVING COUNT(*) > 1;

ALTER TABLE HR.employee_badge
ADD CONSTRAINT UQ_employee_badge 
UNIQUE (employee_id, badge_code);

/* INSERT INTO HR.employee_badge (badge_row_id, employee_id, badge_code)
 * VALUES (2, 102, 'A1B2C3D4E5F6'); */

SELECT column_name, ordinal_position
FROM information_schema.KEY_COLUMN_USAGE
WHERE constraint_schema = 'HR' 
    AND constraint_name = 'UQ_employee_badge_pair'
ORDER BY ordinal_position;

SELECT assessment_id, score
FROM HR.skill_assessment
WHERE score < 0 OR score > 100;

ALTER TABLE HR.skill_assessment
ADD CONSTRAINT CK_skill_assessment_score
CHECK (score BETWEEN 0 AND 100);

/* INSERT INTO HR.skill_assessment (assessment_id, employee_id, score)
 * VALUES (4, 109, 850.5); */

/* INSERT INTO HR.skill_assessment (assessment_id, employee_id, score)
 * VALUES (4, 109, -850.5); */

/*INSERT INTO HR.skill_assessment (assessment_id, employee_id, score)
 * VALUES (4, 109, NULL); */

DELETE FROM HR.skill_assessment
WHERE assessment_id = 4;

CREATE TABLE HR.review_period (
    review_id INT NOT NULL,
    start_date DATE NULL,
    end_date DATE NULL
);

ALTER TABLE HR.review_period
ADD CONSTRAINT CK_review_period_dates
CHECK (end_date >= start_date);

/* INSERT INTO HR.review_period (review_id, start_date, end_date)
 * VALUES (1, '2022-01-01', '2020-06-30'); */

INSERT INTO HR.review_period (review_id, start_date, end_date)
VALUES (1, '2022-01-01', '2022-01-01');

SELECT * FROM HR.review_period
WHERE start_date IS NULL;

ALTER TABLE HR.review_period
ADD CONSTRAINT CK_review_period_start_date
CHECK (start_date IS NOT NULL);

/* INSERT INTO HR.review_period (review_id, start_date, end_date)
 * VALUES (2, NULL, '2022-12-31'); */

SELECT name, definition, is_disabled, is_not_trusted
FROM sys.check_constraints
WHERE object_id = OBJECT_ID('HR.skill_assessment', 'U');
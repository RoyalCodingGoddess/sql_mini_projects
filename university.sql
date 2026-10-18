PRAGMA foreign_keys = ON;

CREATE TABLE department (
dept_name TEXT PRIMARY KEY,
building TEXT,
budget REAL
);

CREATE TABLE instructor (
ID INTEGER PRIMARY KEY,
name TEXT,
dept_name TEXT,
salary REAL,
FOREIGN KEY (dept_name)
REFERENCES department (dept_name)
);

CREATE TABLE student (
ID INTEGER PRIMARY KEY,
name TEXT,
dept_name TEXT,
tot_cred INTEGER,
FOREIGN KEY (dept_name)
REFERENCES department (dept_name)
);

CREATE TABLE advisor (
s_id INTEGER PRIMARY KEY,
i_id INTEGER,
FOREIGN KEY (s_id)
REFERENCES student (ID),
FOREIGN KEY (i_id)
REFERENCES instructor (ID)
);

CREATE TABLE course (
course_id INTEGER PRIMARY KEY,
title TEXT,
dept_name TEXT,
credits INTEGER,
FOREIGN KEY (dept_name)
REFERENCES department (dept_name)
);

CREATE TABLE classroom (
building TEXT,
room_number INTEGER,
capacity INTEGER,
PRIMARY KEY (building, room_number)
);

CREATE TABLE time_slot (
time_slot_id INTEGER PRIMARY KEY,
day TEXT,
start_time INTEGER,
end_time INTEGER
);

CREATE TABLE section (
course_id INTEGER,
sec_id INTEGER,
semester TEXT,
year INTEGER,
building TEXT,
room_number INTEGER,
time_slot_id INTEGER,
PRIMARY KEY (course_id, sec_id, semester, year),
FOREIGN KEY (course_id)
REFERENCES course (course_id),
FOREIGN KEY (building, room_number)
REFERENCES classroom (building, room_number),
FOREIGN KEY (time_slot_id)
REFERENCES time_slot (time_slot_id)
);


CREATE TABLE teaches (
ID INTEGER,
course_id INTEGER,
sec_id INTEGER,
semester TEXT,
year INTEGER,
PRIMARY KEY (ID, course_id, sec_id, semester, year),
FOREIGN KEY (ID)
REFERENCES instructor (ID),
FOREIGN KEY (course_id, sec_id, semester, year)
REFERENCES section (course_id, sec_id, semester, year)
);

CREATE TABLE takes (
ID INTEGER,
course_id INTEGER,
sec_id INTEGER,
semester TEXT,
year INTEGER,
grade TEXT,
PRIMARY KEY (ID, course_id, sec_id, semester, year),
FOREIGN KEY (ID)
REFERENCES student (ID),
FOREIGN KEY (course_id, sec_id, semester, year)
REFERENCES section (course_id, sec_id, semester, year)
);

CREATE TABLE prereq (
course_id INTEGER,
prereq_id INTEGER,
PRIMARY KEY (course_id, prereq_id),
FOREIGN KEY (course_id)
REFERENCES course (course_id),
FOREIGN KEY (prereq_id)
REFERENCES course (course_id)
);


-- INSERT SAMPLE RECORDS

INSERT INTO department VALUES
('Computer Engineering', 'Block A', 500000),
('Mathematics', 'Block B', 300000);


INSERT INTO instructor VALUES
(1, 'Ada Okafor', 'Computer Engineering', 75000),
(2, 'John Bello', 'Mathematics', 65000);


INSERT INTO student VALUES
(101, 'Amara James', 'Computer Engineering', 45),
(102, 'David Peter', 'Mathematics', 36),
(103, 'Chioma Grace', 'Computer Engineering', 60),
(104, 'Daniel Musa', 'Mathematics', 42),
(105, 'Faith Rose', 'Computer Engineering', 30);


INSERT INTO advisor VALUES
(101, 1),
(102, 2);


INSERT INTO course VALUES
(201, 'Database Systems', 'Computer Engineering', 3),
(202, 'Programming', 'Computer Engineering', 4),
(203, 'Calculus', 'Mathematics', 3),
(204, 'Data Structures', 'Computer Engineering', 3),
(205, 'Linear Algebra', 'Mathematics', 3);


INSERT INTO classroom VALUES
('Block A', 101, 40),
('Block B', 202, 30);


INSERT INTO time_slot VALUES
(1, 'Monday', 900, 1000),
(2, 'Tuesday', 1000, 1100),
(3, 'Wednesday', 1100, 1200),
(4, 'Thursday', 1200, 1300),
(5, 'Friday', 1300, 1400);


-- and has the composite foreign key to time_slot.
INSERT INTO section VALUES
(201, 1, 'Fall', 2026, 'Block A', 101, 1),
(202, 1, 'Fall', 2026, 'Block A', 101, 2),
(203, 1, 'Fall', 2026, 'Block B', 202, 3),
(204, 1, 'Fall', 2026, 'Block A', 101, 4),
(205, 1, 'Fall', 2026, 'Block B', 202, 5);


INSERT INTO teaches VALUES
(1, 201, 1, 'Fall', 2026),
(1, 202, 1, 'Fall', 2026),
(2, 203, 1, 'Fall', 2026),
(1, 204, 1, 'Fall', 2026),
(2, 205, 1, 'Fall', 2026);


INSERT INTO takes VALUES
(101, 201, 1, 'Fall', 2026, 'A'),
(102, 203, 1, 'Fall', 2026, 'B'),
(103, 202, 1, 'Fall', 2026, 'A'),
(104, 205, 1, 'Fall', 2026, 'B'),
(105, 204, 1, 'Fall', 2026, 'A');


INSERT INTO prereq VALUES
(204, 202),
(202, 201);


-- Display all departments
SELECT * FROM department;

-- Display all students
SELECT * FROM student;

-- Display all courses
SELECT * FROM course;

-- Display all sections
SELECT * FROM section;

-- Display all student course registrations
SELECT * FROM takes;

-- Display instructors and their departments
SELECT instructor.name, instructor.dept_name
FROM instructor;

-- Display course titles and their departments
SELECT course.title, course.dept_name
FROM course;

-- Duplicate primary key test; uncomment only to test
-- INSERT INTO department VALUES ('Computer Engineering', 'Block C', 600000);




















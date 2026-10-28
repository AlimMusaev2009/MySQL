USE college;

CREATE TABLE Teacher(
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    created_at DATE
);

CREATE TABLE Students(
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    student_groups_id INT NOT NULL,
    birthday_date DATE,
    created_at DATE,
    
    FOREIGN KEY (student_groups_id) REFERENCES student_groups(id)
);

CREATE TABLE Subjects(
	id INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(50) NOT NULL,
    hours DECIMAL NOT NULL,
    teacher_id INT NOT NULL,
    
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE Classes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,
    places VARCHAR(50) NOT NULL
);

CREATE TABLE Student_Groups(
	id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50) NOT NULL,
    stud_count TINYINT,
    speciality VARCHAR(50) NOT NULL
);

CREATE TABLE Lessons(
	id INT PRIMARY KEY AUTO_INCREMENT,
    theme_name VARCHAR(50) NOT NULL,
    stud_count TINYINT,
    subjects_id INT NOT NULL,
    student_groups_id INT NOT NULL,
    teacher_id INT NOT NULL,
    date_at DATETIME,
    
    FOREIGN KEY (subjects_id) REFERENCES subjects(id),
    FOREIGN KEY (student_groups_id) REFERENCES student_groups(id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE Student_Grades(
	id INT PRIMARY KEY AUTO_INCREMENT,
    value_grade TINYINT NOT NULL,
    teacher_id INT NOT NULL,
	students_id INT NOT NULL,
    subjects_id INT NOT NULL,
    lessons_id INT NOT NULL,
    created_at DATE,
    
    FOREIGN KEY (teacher_id) REFERENCES teacher(id),
	FOREIGN KEY (subjects_id) REFERENCES subjects(id),
    FOREIGN KEY (students_id) REFERENCES students(id),
    FOREIGN KEY (lessons_id) REFERENCES lessons(id)
);

CREATE TABLE Schedules(
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_day DATE NOT NULL,
    lessons_id INT NOT NULL,
    created_at DATETIME,
    
    FOREIGN KEY (lessons_id) REFERENCES lessons(id)
);

Call teacher_insert();

SELECT * FROM Teacher;

SELECT elt(floor(rand() * 5) + 1, "Информатика", "Базы данных", "Математика", "Компьютерные сети")
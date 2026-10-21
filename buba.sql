USE academy;

CREATE TABLE if not exists teachers(
	id int primary key auto_increment,
    full_name varchar(100) not null,
    email varchar(100) unique,
    phone varchar(100) unique,
    employment_date date
);

CREATE TABLE if not exists courses(
	id int primary key auto_increment,
    course_name varchar(100) not null,
    speciality varchar(100) not null,
    created_at date
);

CREATE TABLE if not exists clases(
	id int primary key auto_increment,
    class_name varchar(100) not null,
    students tinyint
);

CREATE TABLE if not exists shedule(
	id int primary key auto_increment,
    day_name varchar(100) not null,
    date_day date
);

CREATE TABLE if not exists student_groups(
	id int primary key auto_increment,
    group_name varchar(100) not null,
    course_id int not null,
    student_count tinyint,
    created_at date,
    foreign key (course_id) references courses(id)
);

CREATE TABLE if not exists students(
	id int primary key auto_increment,
    full_name varchar(100) not null,
    email varchar(100) unique,
    phone_id int not null,
    group_id int not null,
    created_at date,
    foreign key (group_id) references student_groups(id)
);

CREATE TABLE if not exists subjects(
	id int primary key auto_increment,
    sub_name varchar(100) not null,
    teacher_id int not null,
    course_id int not null,
    hours decimal default 12,
    foreign key (course_id) references courses(id),
    foreign key (teacher_id) references teachers(id)
);

CREATE TABLE if not exists lessons(
	id int primary key auto_increment,
    theme_name varchar(100) not null,
    subject_id int not null,
    class_id int not null,
    group_id int not null,
    shedule_id int not null,
    foreign key (shedule_id) references shedule(id),
    foreign key (subject_id) references subjects(id),
    foreign key (class_id) references clases(id),
    foreign key (group_id) references student_groups(id)
);
    
CREATE TABLE if not exists grades(
	id int primary key auto_increment,
    value_grade int not null,
    subject_id int not null,
    student_id int not null,
    lesson_id int not null,
    foreign key (lesson_id) references lessons(id),
    foreign key (student_id) references students(id),
    foreign key (subject_id) references subjects(id),
    check (value_grade > 0 and value_grade < 6)
);



select * from shedule;


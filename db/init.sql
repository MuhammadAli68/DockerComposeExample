-- Create sample schema
CREATE SCHEMA myschema;

-- Create sample table
CREATE TABLE myschema.students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number SMALLINT NOT NULL,
	phone VARCHAR(50) UNIQUE,
	email VARCHAR(50) UNIQUE,
	graduation_year SMALLINT
);

INSERT INTO myschema.students(first_name,last_name,homeroom_number,phone,email,graduation_year) VALUES('Mark','Salk',5,'777-555-1234',NULL,2035);
INSERT INTO myschema.students(first_name,last_name,homeroom_number,phone,email,graduation_year) VALUES('Walt','Baker',6,'892-465-2234',NULL,2035);
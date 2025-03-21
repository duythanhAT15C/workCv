-- create user 'careeruser'@'localhost' identified by 'careeruser';
-- grant all privileges on * . * to 'careeruser'@'localhost';

DROP DATABASE IF EXISTS `job_search`;
create database if not exists `job_search`;
USE `job_search`;
DROP TABLE IF EXISTS category;
CREATE TABLE category (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) DEFAULT NULL,
    number_choose int DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS role;
CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT,
    role_name VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(255) DEFAULT NULL,
    description VARCHAR(255) DEFAULT NULL,
    email VARCHAR(255) DEFAULT NULL,
    full_name VARCHAR(255) DEFAULT NULL,
    image VARCHAR(255) DEFAULT NULL,
    password VARCHAR(255) DEFAULT NULL,
    phone_number VARCHAR(255) DEFAULT NULL,
    status INT DEFAULT NULL,
    verification_token VARCHAR(255) DEFAULT NULL,
    cv_id INT DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS recruitment;
CREATE TABLE recruitment (
    id INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(255) DEFAULT NULL,
    create_at VARCHAR(255) DEFAULT NULL,
    description VARCHAR(255) DEFAULT NULL,
    experience VARCHAR(255) DEFAULT NULL,
    quantity INT DEFAULT NULL,
    rank_value VARCHAR(255) DEFAULT NULL,
    salary VARCHAR(255) DEFAULT NULL,
    status INT DEFAULT NULL,
    title VARCHAR(255) DEFAULT NULL,
    type VARCHAR(255) DEFAULT NULL,
    view VARCHAR(255) DEFAULT NULL,
    deadline VARCHAR(255) DEFAULT NULL,
    category_id INT DEFAULT NULL,
    company_id INT DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS cv;
CREATE TABLE cv (
    id INT NOT NULL AUTO_INCREMENT,
    file_name VARCHAR(255) DEFAULT NULL,
    user_id VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS apply_post;
CREATE TABLE apply_post (
    id INT NOT NULL AUTO_INCREMENT,
    created_at VARCHAR(255) DEFAULT NULL,
    name_cv VARCHAR(255) DEFAULT NULL,
    status INT DEFAULT NULL,
    text VARCHAR(255) DEFAULT NULL,
    recruitment_id INT DEFAULT NULL,
    user_id INT DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS company;
CREATE TABLE company (
    id INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(255) DEFAULT NULL,
    description VARCHAR(255) DEFAULT NULL,
    email VARCHAR(255) DEFAULT NULL,
    logo VARCHAR(255) DEFAULT NULL,
    name_company VARCHAR(255) DEFAULT NULL,
    phone_number VARCHAR(255) DEFAULT NULL,
    status INT DEFAULT NULL,
    user_id INT DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS save_job;
CREATE TABLE save_job (
    id INT NOT NULL AUTO_INCREMENT,
    recruitment_id INT DEFAULT NULL,
    user_id INT DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS follow_company;
CREATE TABLE follow_company (
    id INT NOT NULL AUTO_INCREMENT,
    company_id INT DEFAULT NULL,
    user_id INT DEFAULT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS users_roles;
CREATE TABLE users_roles (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT DEFAULT NULL,
    role_id INT DEFAULT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE user
ADD CONSTRAINT FK_CV_USER FOREIGN KEY (cv_id) REFERENCES cv(id);

ALTER TABLE recruitment
ADD CONSTRAINT FK_CATEGORY_RECRUITMENT FOREIGN KEY (category_id) REFERENCES category(id),
ADD CONSTRAINT FK_COMPANY_RECRUITMENT FOREIGN KEY (company_id) REFERENCES company(id);

ALTER TABLE apply_post
ADD CONSTRAINT FK_RECRUITMENT_APPLY_POST FOREIGN KEY (recruitment_id) REFERENCES recruitment(id),
ADD CONSTRAINT FK_USER_APPLY_POST FOREIGN KEY (user_id) REFERENCES user(id);

ALTER TABLE company
ADD CONSTRAINT FK_USER_COMPANY FOREIGN KEY (user_id) REFERENCES user(id);

ALTER TABLE save_job
ADD CONSTRAINT FK_RECRUITMENT_SAVE_JOB FOREIGN KEY (recruitment_id) REFERENCES recruitment(id),
ADD CONSTRAINT FK_USER_SAVE_JOB FOREIGN KEY (user_id) REFERENCES user(id);

ALTER TABLE follow_company
ADD CONSTRAINT FK_COMPANY_FOLLOW_COMPANY FOREIGN KEY (company_id) REFERENCES company(id),
ADD CONSTRAINT FK_USER_FOLLOW_COMPANY FOREIGN KEY (user_id) REFERENCES user(id);

ALTER TABLE users_roles
ADD CONSTRAINT FK_USER_ID_ROLE FOREIGN KEY (user_id) REFERENCES user(id),
ADD CONSTRAINT FK_ROLE_ID_USER FOREIGN KEY (role_id) REFERENCES role(id);

INSERT INTO role (role_name) VALUES ('ROLE_CANDIDATE'), ('ROLE_COMPANY');

INSERT INTO category (name, number_choose) VALUES
('Java', 100),
('Python', 120),
('JavaScript', 130),
('C++', 80),
('C#', 90),
('PHP', 85),
('Ruby', 70),
('Go', 60),
('Swift', 50),
('Kotlin', 75),
('Rust', 40),
('SQL', 110),
('HTML/CSS', 140),
('TypeScript', 95),
('R', 65),
('Scala', 55),
('Dart', 45),
('MATLAB', 30),
('Perl', 35);


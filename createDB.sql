CREATE DATABASE Do_it;

USE DATABASE Do_it;

CREATE TABLE Person(
  id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(100) NOT NULL,
  lastName VARCHAR(100) NOT NULL,
  dateOfBirth DATETIME,
  registrationDate DATETIME,
  phone VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(250) NOT NULL,
  address VARCHAR(250) NOT NULL,
  city VARCHAR(50) NOT NULL,
  postalCode VARCHAR(10) NOT NULL,
  province VARCHAR(10) NOT NULL,
  profilePhoto LONGBLOB
);

CREATE TABLE Employee(
  id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  person_id BIGINT(20) NOT NULL,
  averageRating DECIMAL(2,1),
  FOREIGN KEY (person_id)
  REFERENCES Person (id)
);

CREATE TABLE Employer(
  id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  person_id BIGINT(20) NOT NULL,
  averageRating INT(10),
  FOREIGN KEY (person_id)
  REFERENCES Person (id)
);

CREATE TABLE Status(
  id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE Review(
  id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  rating DECIMAL(2,1),
  description VARCHAR(250)
);

CREATE TABLE ServiceOrder(
  id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  orderDate DATETIME NOT NULL,
  startDate DATETIME NOT NULL,
  endDate DATETIME NOT NULL,
  location VARCHAR(250) NOT NULL,
  employer_id BIGINT(20) NOT NULL,
  employee_id BIGINT(20),
  status_id BIGINT(20) NOT NULL,
  employeeReview_id BIGINT(20),
  employerReview_id BIGINT(20),
  FOREIGN KEY (employee_id) REFERENCES Employee(id),
  FOREIGN KEY (employer_id) REFERENCES Employer(id),
  FOREIGN KEY (status_id) REFERENCES Status(id),
  FOREIGN KEY (employeeReview_id) REFERENCES Review(id),
  FOREIGN KEY (employerReview_id) REFERENCES Review(id)
);

CREATE TABLE OrderResponse (
  id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  OrderResponseDate DATETIME NOT NULL,
  message VARCHAR(250) NOT NULL,
  priceOffer DECIMAL(8,2),
  order_id BIGINT(20),
  employee_id BIGINT(20),
  FOREIGN KEY (order_id) REFERENCES ServiceOrder(id),
  FOREIGN KEY (employee_id) REFERENCES Employee(id)
);

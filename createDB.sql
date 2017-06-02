
CREATE TABLE Person(
  id BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
  firstName VARCHAR(100) NOT NULL,
  lastName VARCHAR(100) NOT NULL,
  dateOfBirth DATE,           <-- ???
  registrationDate DATE,      <-- ???
  phone VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(250) NOT NULL,
  address VARCHAR(250) NOT NULL,
  city VARCHAR(100) NOT NULL,
  postalCode VARCHAR(100) NOT NULL,     <-- filter?
  province VARCHAR(10) NOT NULL,
  profilePhoto IMAGE,
  rating INT(10)
)

CREATE TABLE Employee(
  id BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
  person_id BIGINT(20) NOT NULL
  rating INT(10),                 <-- figure out
    FOREIGN KEY (person_id)
    REFERENCES Person (id)
    ON DELETE CASCADE
)

CREATE TABLE Employer(
  id BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
  person_id BIGINT(20) NOT NULL
  rating INT(10),                 <-- figure out
    FOREIGN KEY (person_id)
    REFERENCES Person (id)
    ON DELETE CASCADE
)

CREATE TABLE STATUS(
  id BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
  name VARCHAR(50) NOT NULL
)

CREATE TABLE Review(
  id BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
  rating INT(10)                  <--figure out
  description VARCHAR(250)
)

CREATE TABLE Order(
 id BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
 orderDate DATE,  --> decided to change to "orderDate" cause DATE DATE looks strange
 startDate DATE,
 endDate DATE,
 location VARCHAR(50),
 employer_id BIGINT(20),
 employee_id BIGINT(20),
 status_id BIGINT(20),
 employeeReview_id BIGINT(20),
 employerReview_id BIGINT(20),
 FOREIGN KEY (employee_id) REFERENCES Employee(id) ON DELETE CASCADE,  --> figure out (couple cascades at the same time)
 FOREIGN KEY (employer_id) REFERENCES Employer(id) ON DELETE CASCADE,
 FOREIGN KEY (status_id) REFERENCES Status(id) ON DELETE CASCADE,
 FOREIGN KEY (employeeReview_id) REFERENCES Review(id) ON DELETE CASCADE,
 FOREIGN KEY (employerReview_id) REFERENCES Review(id) ON DELETE CASCADE
)

CREATE TABLE OrderResponse (
id BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
OrderResponseDate DATE, --> the same as in the previous
message VARCHAR(250),
priceOffer DECIMAL(13,4), --> figure out
order_id BIGINT(20),
employee_id BIGINT(20),
FOREIGN KEY (order_id) REFERENCES Order(id) ON DELETE CASCADE,  --> figure out (couple cascades at the same time)
FOREIGN KEY (employee_id) REFERENCES Employee(id) ON DELETE CASCADE  --> figure out (couple cascades at the same time)
)

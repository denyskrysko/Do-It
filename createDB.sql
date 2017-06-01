
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

CREATE TABLE Person(
  id BIGINT(20) NOT NULL IDENTITY,
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
CREATE TABLE Payment (
    payId SERIAL PRIMARY KEY,
    paymentMethod VARCHAR(50) NOT NULL
);

CREATE TABLE Psychological_service (
    psychosvcId SERIAL PRIMARY KEY,
    psychosvcName VARCHAR(100) NOT NULL,
    psychosvcSurname VARCHAR(100) NOT NULL CHECK (psychosvcSurname ~ '^[A-Za-z ]+$'),
    dateTime DATE NOT NULL CHECK (dateTime >= CURRENT_DATE),
    cost INT NOT NULL CHECK (cost >= 0),
    payId INT NOT NULL REFERENCES Payment(payId)
);

CREATE TABLE OnlineApplication (
    appId SERIAL PRIMARY KEY,
    userData VARCHAR(1000) NOT NULL
);

CREATE TABLE "User" (
    userId SERIAL PRIMARY KEY,
    fullName VARCHAR(120) NOT NULL,
    gender VARCHAR(30) NOT NULL CHECK (gender ~ '^[A-Za-z ]+$'),
    address VARCHAR(200) NOT NULL CHECK (address REGEXP '^[A-Za-z0-9,.\- ]+$'),
    age INT NOT NULL CHECK (age > 0),
    accountNumber INT NOT NULL CHECK (accountNumber >= 0),
    appId INT NOT NULL REFERENCES OnlineApplication(appId),
    psychosvcId INT NOT NULL REFERENCES Psychological_service(psychosvcId)
);

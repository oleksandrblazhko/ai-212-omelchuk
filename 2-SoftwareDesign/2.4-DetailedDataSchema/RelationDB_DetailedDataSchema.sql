CREATE TABLE Payment(
    payId INT PRIMARY KEY NOT NULL,
    paymentMethod VARCHAR(50) NOT NULL
);

CREATE TABLE Psychological_service(
    psychosvcId INT PRIMARY KEY NOT NULL,
    psychosvcName VARCHAR(100) NOT NULL,
    dateTime DATE NOT NULL CHECK (dateTime >= CURRENT_DATE),
    cost INT NOT NULL CHECK (cost >= 0),
    payId INT NOT NULL REFERENCES Payment(payId)
);

CREATE TABLE OnlineApplication(
    appId INT PRIMARY KEY NOT NULL,
    userData VARCHAR(1000) NOT NULL
);

CREATE TABLE User(
    userId INT PRIMARY KEY NOT NULL,
    fullName VARCHAR(120) NOT NULL CHECK (fullName REGEXP '^[A-Za-z ]+$'),
    sex VARCHAR NOT NULL CHECK (sex <= 30),
    age INT NOT NULL CHECK (age > 0),
    accountNumber INT NOT NULL CHECK (accountNumber >= 0),
    appId INT NOT NULL REFERENCES OnlineApplication(appId),
    psychosvcId INT NOT NULL REFERENCES Psychological_service(psychosvcId)
);

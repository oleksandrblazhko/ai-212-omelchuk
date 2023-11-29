CREATE TYPE Payment_Type AS (
    payId SERIAL,
    paymentMethod VARCHAR(50)
);
/
CREATE TYPE PsychologicalService_Type AS (
    psychosvcId SERIAL,
    psychosvcName VARCHAR(100),
    dateTime DATE,
    cost INT,
    payId INT
);
/
CREATE TYPE OnlineApplication_Type AS (
    appId SERIAL,
    userData VARCHAR(1000)
);
/
CREATE TYPE UserType AS (
    userId SERIAL,
    fullName VARCHAR(120),
    gender VARCHAR(30),
    address VARCHAR(200),
    age INT,
    accountNumber INT,
    appId INT,
    psychosvcId INT
);
/

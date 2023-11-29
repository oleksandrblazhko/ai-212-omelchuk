CREATE OR REPLACE TYPE Payment_Type AS (
    payId NUMBER,
    paymentMethod VARCHAR(50)
);
/
CREATE OR REPLACE TYPE PsychologicalService_Type AS (
    psychosvcId NUMBER,
    psychosvcName VARCHAR(100),
    dateTime DATE,
    cost INT,
    payId INT
);
/
CREATE OR REPLACE TYPE OnlineApplication_Type AS (
    appId NUMBER,
    userData VARCHAR(1000)
);
/
CREATE OR REPLACE TYPE UserType AS (
    userId NUMBER,
    fullName VARCHAR(120),
    gender VARCHAR(30),
    address VARCHAR(200),
    age INT,
    accountNumber INT,
    appId INT,
    psychosvcId INT
);
/

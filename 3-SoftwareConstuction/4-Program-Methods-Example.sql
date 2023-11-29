CREATE OR REPLACE FUNCTION createRequest (
    p_fullName IN VARCHAR2,
    p_gender IN VARCHAR2,
    p_address IN VARCHAR2,
    p_age IN INT,
    p_accountNumber IN INT,
    p_appId IN INT,
    p_psychosvcId IN INT
)
RETURN INT IS
    v_fullName "User".fullName%TYPE := TRIM(p_fullName);
    v_gender "User".gender%TYPE := TRIM(upper(p_gender));
    v_address "User".address%TYPE := TRIM(p_address);
    v_age "User".age%TYPE := p_age;
    v_accountNumber "User".accountNumber%TYPE := p_accountNumber;
    v_appId OnlineApplication.appId%TYPE := p_appId;
    v_psychosvcId Psychological_service.psychosvcId%TYPE := p_psychosvcId;
BEGIN
    -- Умова №1: Повне ім'я користувача не повинно бути порожнім і не повинно перевищувати 120 символів.
    IF LENGTH(v_fullName) = 0 OR LENGTH(v_fullName) > 120 THEN
        RETURN -1; -- Помилка: ПІБ користувача не відповідає умовам.
    END IF;

    -- Умова №2: Стать користувача повинна відповідати одному з варіантів: "чоловік", "жінка", "інше".
    IF v_gender NOT IN ('ЧОЛОВІК', 'ЖІНКА', 'ІНШЕ') THEN
        RETURN -2; -- Помилка: Стать користувача не відповідає умовам.
    END IF;

    -- Умова №3: Адреса користувача не повинна бути порожньою і не повинна перевищувати 200 символів.
    IF LENGTH(v_address) = 0 OR LENGTH(v_address) > 200 THEN
        RETURN -3; -- Помилка: Адреса користувача не відповідає умовам.
    END IF;

    -- Умова №4: Вік користувача повинен бути додатнім числом.
    IF v_age <= 0 THEN
        RETURN -4; -- Помилка: Вік користувача не відповідає умовам.
    END IF;

    -- Умова №5: Номер рахунку користувача повинен бути не від'ємним числом.
    IF v_accountNumber < 0 THEN
        RETURN -5; -- Помилка: Номер рахунку користувача не відповідає умовам.
    END IF;

    -- Умова №6: Перевірка наявності запису в таблиці OnlineApplication з вказаним appId.
    BEGIN
        SELECT appId INTO v_appId FROM OnlineApplication WHERE appId = v_appId AND ROWNUM = 1;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN -6; -- Помилка: Неправильний appId для OnlineApplication.
    END;

    -- Умова №7: Перевірка наявності запису в таблиці Psychological_service з вказаним psychosvcId.
    BEGIN
        SELECT psychosvcId INTO v_psychosvcId FROM Psychological_service WHERE psychosvcId = v_psychosvcId AND ROWNUM = 1;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN -7; -- Помилка: Неправильний psychosvcId для Psychological_service.
    END;

    -- Всі умови виконані, можна вставляти дані в таблицю.
    INSERT INTO "User" (fullName, gender, address, age, accountNumber, appId, psychosvcId)
    VALUES (v_fullName, v_gender, v_address, v_age, v_accountNumber, v_appId, v_psychosvcId);
    COMMIT;

    RETURN 1; -- Користувач успішно ввів всі дані.
END;
/

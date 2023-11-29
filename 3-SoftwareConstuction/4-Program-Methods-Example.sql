CREATE OR REPLACE FUNCTION createRequest (
    p_fullName IN VARCHAR2,
    p_address IN VARCHAR2,
    p_age IN INT,
    p_gender IN VARCHAR2,
    p_psychosvcName IN VARCHAR2
)
RETURN INT IS
    v_fullName "User".fullName%TYPE := TRIM(p_fullName);
    v_address "User".address%TYPE := TRIM(p_address);
    v_age "User".age%TYPE := p_age;
    v_gender "User".gender%TYPE := TRIM(UPPER(p_gender));
    v_psychosvcName Psychological_service.psychosvcName%TYPE := TRIM(p_psychosvcName);
BEGIN
    -- Умова №1: Повне ім'я користувача не повинно бути порожнім і не повинно перевищувати 120 символів.
    IF LENGTH(v_fullName) = 0 OR LENGTH(v_fullName) > 120 OR NOT REGEXP_LIKE(v_fullName, '^[A-Za-z ]+$') THEN
        RETURN -1; -- Помилка: ПІБ користувача не відповідає умовам.
    END IF;

    -- Умова №2: Адреса користувача не повинна бути порожньою і не повинна перевищувати 200 символів.
    IF LENGTH(v_address) = 0 OR LENGTH(v_address) > 200 OR NOT REGEXP_LIKE(v_address, '^[A-Za-z0-9,.\- ]+$') THEN
        RETURN -2; -- Помилка: Адреса користувача не відповідає умовам.
    END IF;

    -- Умова №3: Вік користувача повинен бути числом більше 18.
    IF v_age <= 18 THEN
        RETURN -3; -- Помилка: Вік користувача не відповідає умовам.
    END IF;

    -- Умова №4: Стать користувача повинна відповідати одному з варіантів: "чоловік", "жінка", "інше".
    IF v_gender NOT IN ('ЧОЛОВІК', 'ЖІНКА', 'ІНШЕ') THEN
        RETURN -4; -- Помилка: Стать користувача не відповідає умовам.
    END IF;

    -- Умова №5: Назва психологічної послуги не повинна бути порожньою і не повинна перевищувати 100 символів.
    IF LENGTH(v_psychosvcName) = 0 OR LENGTH(v_psychosvcName) > 100 THEN
        RETURN -5; -- Помилка: Назва психологічної послуги не відповідає умовам.
    END IF;

    -- Всі умови виконані, можна вставляти дані в таблицю.
    INSERT INTO "User" (fullName, address, age, gender, psychosvcName)
    VALUES (v_fullName, v_address, v_age, v_gender, v_psychosvcName);
    COMMIT;

    RETURN 1; -- Користувач успішно ввів всі дані.
END;
/

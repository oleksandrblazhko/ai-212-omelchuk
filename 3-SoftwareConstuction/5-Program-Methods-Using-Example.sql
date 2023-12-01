DECLARE
    v_result INT;
BEGIN
    -- Виклик функції createRequest
    v_result := createRequest('John Doe', '123 Main St', 25, 'Male', 'Психотерапія');

    -- Обробка результату
    IF v_result = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Користувач успішно введений.');
    ELSIF v_result = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! ПІБ користувача не відповідає умовам.');
    ELSIF v_result = -2 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Адреса користувача не відповідає умовам.');
    ELSIF v_result = -3 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Вік користувача не відповідає умовам.');
    ELSIF v_result = -4 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Стать користувача не відповідає умовам.');
    ELSIF v_result = -5 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Назва психологічної послуги не відповідає умовам.');
   
    END IF;
END;
/

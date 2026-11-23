DELIMITER //

DROP PROCEDURE IF EXISTS ps_shedule_insert //

CREATE PROCEDURE ps_shedule_insert()
BEGIN
    DECLARE days_list VARCHAR(255) DEFAULT 'Понедельник,Вторник,Среда,Четверг,Пятница,Суббота,Воскресенье';
    DECLARE i INT DEFAULT 1;
    DECLARE current_date_val DATE DEFAULT CURDATE();
    DECLARE day_idx INT;
    DECLARE day_name_val VARCHAR(20);

    WHILE i <= 30 DO
        SET day_idx = WEEKDAY(current_date_val) + 1;
        SET day_name_val = SUBSTRING_INDEX(SUBSTRING_INDEX(days_list, ',', day_idx), ',', -1);

        INSERT INTO shedule (day_name, date_day) 
        VALUES (day_name_val, current_date_val);

        SET current_date_val = DATE_ADD(current_date_val, INTERVAL 1 DAY);
        SET i = i + 1;
    END WHILE;
END //

DELIMITER;

-- create address table
CREATE TABLE IF NOT EXISTS ADDRESS (
    ADDRESS_ID VARCHAR(255) NOT NULL,
    ADDRESS_LINE1 VARCHAR(255) NOT NULL,
    ADDRESS_LINE2 VARCHAR(255),
    CITY VARCHAR(255) NOT NULL,
    COUNTRY VARCHAR(255),
    PHONE VARCHAR(255),
    POSTAL_CODE VARCHAR(255),
    STATE VARCHAR(255),
    USER_ID VARCHAR(255) NOT NULL,
    PRIMARY KEY (ADDRESS_ID)
);

-- create cart table
CREATE TABLE IF NOT EXISTS CART (
    CART_ID VARCHAR(255) NOT NULL,
    TOTAL_PRICE DOUBLE NOT NULL,
    USER_NAME VARCHAR(255) NOT NULL,
	  CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (CART_ID, USER_NAME)
);

-- create cart item table
CREATE TABLE IF NOT EXISTS CART_ITEM (
    CART_ITEM_ID VARCHAR(255) NOT NULL,
    ITEM_PRICE DOUBLE NOT NULL,
    EXTENDED_PRICE DOUBLE NOT NULL,
    PRODUCT_ID VARCHAR(255) NOT NULL,
    PRODUCT_NAME VARCHAR(255) NOT NULL,
    QUANTITY INTEGER NOT NULL,
    CART_ID VARCHAR(255),
    PRIMARY KEY (CART_ITEM_ID),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT CART_FK FOREIGN KEY (CART_ID) REFERENCES CART (CART_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- create order table
CREATE TABLE IF NOT EXISTS ORDER_TABLE (
    ORDER_ID VARCHAR(255) NOT NULL,
    TOTAL_ORDER_PRICE DOUBLE NOT NULL,
    TOTAL_ITEMS_PRICE DOUBLE NOT NULL,
    USER_NAME VARCHAR(255) NOT NULL,
    USER_ID VARCHAR(255) NOT NULL,
    PAYMENT_METHOD_ID VARCHAR(255),
    TAX_PRICE VARCHAR(255),
    SHIPPING_PRICE VARCHAR(255),
    IS_PAID TINYINT(1) DEFAULT 0,
    IS_DELIVERED TINYINT(1) DEFAULT 0,
    PAYMENT_DATE VARCHAR(255),
    PAYMENT_ID VARCHAR(255),
    PAYMENT_RECEIPT_URL VARCHAR(255),
    DELIVERED_DATE VARCHAR(255),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ORDER_ID)
);

CREATE TABLE IF NOT EXISTS ORDER_SHIPPING_ADDRESS (
    ORDER_SHIPPING_ID VARCHAR(255) NOT NULL,
    ORDER_ID VARCHAR(255) NOT NULL,
    ADDRESS_LINE1 VARCHAR(255) NOT NULL,
    ADDRESS_LINE2 VARCHAR(255),
    CITY VARCHAR(255) NOT NULL,
    COUNTRY VARCHAR(255),
    PHONE VARCHAR(255),
    POSTAL_CODE VARCHAR(255),
    STATE VARCHAR(255),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ORDER_ID)
);

CREATE TABLE IF NOT EXISTS ORDER_BILLING_ADDRESS (
    ORDER_BILLING_ID VARCHAR(255) NOT NULL,
    ORDER_ID VARCHAR(255) NOT NULL,
    ADDRESS_LINE1 VARCHAR(255) NOT NULL,
    ADDRESS_LINE2 VARCHAR(255),
    CITY VARCHAR(255) NOT NULL,
    COUNTRY VARCHAR(255),
    PHONE VARCHAR(255),
    POSTAL_CODE VARCHAR(255),
    STATE VARCHAR(255),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ORDER_ID)
);

-- create order item table
CREATE TABLE IF NOT EXISTS ORDER_ITEM (
    ORDER_ITEM_ID VARCHAR(255) NOT NULL,
    ORDER_ITEM_PRICE DOUBLE NOT NULL,
    ORDER_EXTENDED_PRICE DOUBLE NOT NULL,
    PRODUCT_ID VARCHAR(255) NOT NULL,
    QUANTITY INTEGER NOT NULL,
    ORDER_ID VARCHAR(255) NOT NULL,
    PRIMARY KEY (ORDER_ITEM_ID),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ORDER_FK FOREIGN KEY (ORDER_ID) REFERENCES ORDER_TABLE (ORDER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
);

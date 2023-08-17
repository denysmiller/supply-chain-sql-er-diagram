CREATE TABLE CUSTOMER (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(255) NOT NULL,  
    contact_info VARCHAR(255),  
    address VARCHAR(255)  
);  

CREATE TABLE SUPPLIER (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(255) NOT NULL,  
    contact_info VARCHAR(255),  
    address VARCHAR(255)  
);  

CREATE TABLE PRODUCT_CATEGORY (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(255) NOT NULL,  
    description TEXT  
);  

CREATE TABLE PRODUCT (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(255) NOT NULL,  
    description TEXT,  
    price FLOAT NOT NULL,  
    quantity_in_stock INT,  
    supplier_id INT,  
    category_id INT,  
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(id),  
    FOREIGN KEY (category_id) REFERENCES PRODUCT_CATEGORY(id)  
);  

CREATE TABLE ORDER (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    order_date DATE NOT NULL,  
    customer_id INT,  
    total_amount FLOAT NOT NULL,  
    status VARCHAR(50),  
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id)  
);  

CREATE TABLE ORDER_ITEM (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    order_id INT,  
    product_id INT,  
    quantity INT,  
    price FLOAT,  
    FOREIGN KEY (order_id) REFERENCES ORDER(id),  
    FOREIGN KEY (product_id) REFERENCES PRODUCT(id)  
);  

CREATE TABLE INVENTORY (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    product_id INT,  
    quantity_on_hand INT,  
    last_updated DATE,  
    FOREIGN KEY (product_id) REFERENCES PRODUCT(id)  
);  

CREATE TABLE WAREHOUSE (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    location VARCHAR(255) NOT NULL,  
    manager_name VARCHAR(255)  
);  

CREATE TABLE SUPPLY (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    supplier_id INT,  
    product_id INT,  
    quantity INT,  
    supply_date DATE,  
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(id),  
    FOREIGN KEY (product_id) REFERENCES PRODUCT(id)  
);  

CREATE TABLE SHIPMENT (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    order_id INT,  
    shipment_date DATE,  
    tracking_number VARCHAR(100),  
    status VARCHAR(50),  
    FOREIGN KEY (order_id) REFERENCES ORDER(id)  
);  

CREATE TABLE PAYMENT (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    order_id INT,  
    amount FLOAT NOT NULL,  
    payment_date DATE,  
    payment_method VARCHAR(50),  
    FOREIGN KEY (order_id) REFERENCES ORDER(id)  
);  

CREATE TABLE INVOICE (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    order_id INT,  
    total_amount FLOAT NOT NULL,  
    invoice_date DATE,  
    FOREIGN KEY (order_id) REFERENCES ORDER(id)  
);  

CREATE TABLE CUSTOMER_ADDRESS (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    customer_id INT,  
    address VARCHAR(255) NOT NULL,  
    address_type VARCHAR(50),  
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id)  
);  

CREATE TABLE PRODUCT_SUPPLIER (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    product_id INT,  
    supplier_id INT,  
    FOREIGN KEY (product_id) REFERENCES PRODUCT(id),  
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(id),  
    UNIQUE (product_id, supplier_id) -- Уникальность для предотвращения дублирования  
);
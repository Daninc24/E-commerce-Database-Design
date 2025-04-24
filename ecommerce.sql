-- E-COMMERCE DATABASE SCHEMA

CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(100) NOT NULL
);

CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50) NOT NULL
);

CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    sku VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE size_category (
    size_cat_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_cat_id INT,
    size_value VARCHAR(50),
    FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);

CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

CREATE TABLE attribute_category (
    attr_cat_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE attribute_type (
    attr_type_id INT PRIMARY KEY AUTO_INCREMENT,
    data_type VARCHAR(50) NOT NULL
);

CREATE TABLE product_attribute (
    attr_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    attr_cat_id INT,
    attr_type_id INT,
    value VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
    FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id)
);


-- 👤 Brand
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    logo_url VARCHAR(255)
);

-- 📂 Product Category
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 📦 Product
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- 🖼️ Product Image
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- 🧾 Product Item (SKU level)
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    sku VARCHAR(100) NOT NULL UNIQUE,
    price_override DECIMAL(10, 2),
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- 🎨 Color
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_code CHAR(7)
);

-- 📏 Size Category
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 📐 Size Option
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    label VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- 🔄 Product Variation
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_item_id INT,
    variation_type ENUM('color', 'size') NOT NULL,
    variation_value_id INT NOT NULL,
    FOREIGN KEY (product_item_id) REFERENCES product_item(id)
    -- We'll handle variation_value_id logic in application layer depending on variation_type
);

-- 🧪 Attribute Type
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    data_type ENUM('text', 'number', 'boolean') NOT NULL
);

-- 📚 Attribute Category
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 🧵 Product Attribute
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_type_id INT,
    value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);

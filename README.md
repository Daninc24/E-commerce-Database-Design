# E-commerce-Database-Design
Peer Group database work

📦 product
Purpose: Stores general information about each product.

Key Columns: id, name, brand_id, category_id, base_price

🏷️ brand
Purpose: Holds data about product brands.

Key Columns: id, name, logo_url

🗂️ product_category
Purpose: Categorizes products into groups like clothing, electronics, etc.

Key Columns: id, name, description

🖼️ product_image
Purpose: Stores image URLs or file references tied to specific products.

Key Columns: id, product_id, image_url, is_primary

🧾 product_item
Purpose: Represents a purchasable unit with specific variations (e.g., red size M t-shirt).

Key Columns: id, product_id, sku, price_override, stock_quantity

🔄 product_variation
Purpose: Connects a product_item to specific variation options like size or color.

Key Columns: id, product_item_id, variation_type, variation_value_id

🎨 color
Purpose: Stores color options that can be used as a variation.

Key Columns: id, name, hex_code

📏 size_category
Purpose: Groups different size types (e.g., clothing sizes vs. shoe sizes).

Key Columns: id, name (e.g., "Clothing", "Shoes")

📐 size_option
Purpose: Lists actual size values, linked to a size category.

Key Columns: id, size_category_id, label (e.g., "M", "L", "42")

🧵 product_attribute
Purpose: Defines additional product attributes like material, weight, or tech specs.

Key Columns: id, product_id, attribute_type_id, value

📚 attribute_category
Purpose: Organizes attributes into high-level groups (e.g., physical, technical).

Key Columns: id, name

🧪 attribute_type
Purpose: Defines the data type of an attribute (text, number, boolean).

Key Columns: id, name, data_type

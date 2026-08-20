create table customers (
    customer_id varchar(50),
    customer_unique_id varchar(50),
    customer_zip_code_prefix integer,
    customer_city varchar(100),
    customer_state varchar(2)
);

create table orders (
    order_id varchar(50),
    customer_id varchar(50),
    order_status varchar(20),
    order_purchase_timestamp timestamp,
    order_approved_at timestamp,
    order_delivered_carrier_date timestamp,
    order_delivered_customer_date timestamp,
    order_estimated_delivery_date timestamp
);

create table order_items (
    order_id varchar(50),
    order_item_id integer,
    product_id varchar(50),
    seller_id varchar(50),
    shipping_limit_date timestamp,
    price numeric(10,2),
    freight_value numeric(10,2)
);

create table products (
    product_id varchar(50),
    product_category_name varchar(100),
    product_name_lenght integer,
    product_description_lenght integer,
    product_photos_qty integer,
    product_weight_g integer,
    product_length_cm integer,
    product_height_cm integer,
    product_width_cm integer
);

create table sellers (
    seller_id varchar(50),
    seller_zip_code_prefix integer,
    seller_city varchar(100),
    seller_state varchar(2)
);

create table order_payments (
    order_id varchar(50),
    payment_sequential integer,
    payment_type varchar(30),
    payment_installments integer,
    payment_value numeric(10,2)
);

create table order_reviews (
    review_id varchar(50),
    order_id varchar(50),
    review_score integer,
    review_comment_title text,
    review_comment_message text,
    review_creation_date timestamp,
    review_answer_timestamp timestamp
);

create table product_category_name_translation (
    product_category_name varchar(100),
    product_category_name_english varchar(100)
);

-- retail sales analytics; sales and business analysis using the olist dataset

-- 1: order status distribution
select
    order_status,
    count(*) as total_orders
from orders
group by order_status
order by total_orders desc;


-- 2: total revenue from delivered orders
select
    round(sum(oi.price), 2) as total_revenue
from order_items oi
join orders o
    on oi.order_id = o.order_id
where o.order_status = 'delivered';


-- 3: average order value
select
    round(sum(oi.price) / count(distinct o.order_id), 2) as average_order_value
from order_items oi
join orders o
    on oi.order_id = o.order_id
where o.order_status = 'delivered';


-- 4: monthly revenue
select
    date_trunc('month', o.order_purchase_timestamp) as month,
    round(sum(oi.price), 2) as monthly_revenue
from order_items oi
join orders o
    on oi.order_id = o.order_id
where o.order_status = 'delivered'
group by month
order by month;


-- 5: revenue by product category
select
    coalesce(t.product_category_name_english, p.product_category_name) as category,
    round(sum(oi.price), 2) as total_revenue
from order_items oi
join orders o
    on oi.order_id = o.order_id
join products p
    on oi.product_id = p.product_id
left join product_category_name_translation t
    on p.product_category_name = t.product_category_name
where o.order_status = 'delivered'
group by category
order by total_revenue desc
limit 10;


-- 6: revenue by customer state
select
    c.customer_state as state,
    round(sum(oi.price), 2) as total_revenue
from order_items oi
join orders o
    on oi.order_id = o.order_id
join customers c
    on o.customer_id = c.customer_id
where o.order_status = 'delivered'
group by state
order by total_revenue desc;


-- 7: cancellation rate
select
    round(
        100.0 * count(*) filter (where order_status = 'canceled')
        / count(*),
        2
    ) as cancellation_rate
from orders;


-- 8: average delivery time
select
    round(
        avg(
            extract(
                epoch from (order_delivered_customer_date - order_purchase_timestamp)
            ) / 86400
        ),
        2
    ) as avg_delivery_days
from orders
where order_status = 'delivered'
  and order_delivered_customer_date is not null;


-- 9: review score by delivery status
select
    case
        when o.order_delivered_customer_date > o.order_estimated_delivery_date
            then 'late'
        else 'on_time'
    end as delivery_status,
    round(avg(r.review_score), 2) as avg_review_score,
    count(*) as total_orders
from orders o
join order_reviews r
    on o.order_id = r.order_id
where o.order_status = 'delivered'
  and o.order_delivered_customer_date is not null
  and o.order_estimated_delivery_date is not null
group by delivery_status
order by delivery_status;


-- 10: late delivery rate
select
    round(
        100.0 * count(*) filter (
            where order_delivered_customer_date > order_estimated_delivery_date
        ) / count(*),
        2
    ) as late_delivery_rate
from orders
where order_status = 'delivered'
  and order_delivered_customer_date is not null
  and order_estimated_delivery_date is not null;


-- 11: repeat customer rate
select
    count(*) filter (where total_orders > 1) as repeat_customers,
    count(*) as total_customers,
    round(
        100.0 * count(*) filter (where total_orders > 1) / count(*),
        2
    ) as repeat_customer_rate
from (
    select
        c.customer_unique_id,
        count(distinct o.order_id) as total_orders
    from customers c
    join orders o
        on c.customer_id = o.customer_id
    where o.order_status = 'delivered'
    group by c.customer_unique_id
) customer_orders;

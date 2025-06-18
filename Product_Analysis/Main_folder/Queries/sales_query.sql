-- Creating a common table expression

with cte as(

select

a.Product,
a.Category,
a.Brand,
a.Description,
a.Sale_Price,
a.Cost_Price,
a.Image_url,
b.Date,
b.Customer_Type,
b.discount_band,
b.Units_Sold,

(sale_price*Units_Sold) as Revenue,
(cost_price*Units_Sold) as Total_cost,
format (date, 'MMMM') as Month,
format(date, 'yyyy') as Year

from product_data a
join product_sales b on a.Product_ID = b.Product
)

-- Showing the discounted revenue

select *,
(1 - (discount*1.0/100)) * Revenue as Discounted_revenue
from cte a
join discount_data b
on a.Discount_Band = b.Discount_Band and a.Month = b.Month


-- Start coding here
select product_line,
case extract(month from date)
when  6 then 'June'
when  7 then 'July'
when  8 then 'August'
end as month


,warehouse,round(sum(total*(1-payment_fee)):: numeric,2) as net_revenue
from sales
where client_type like 'Wholesale'
group by product_line,month,warehouse
order by product_line,month,net_revenue desc

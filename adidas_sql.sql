-- 1. product --
# 01. product별 total sales
select product, sum(`Total Sales`) as total_sales ,count(*) as count
from adidas_sales
group by 1
order by 2 desc, 3 desc;


# 02. 년도별, product별 total sales
# 년도별 product별 total sales 
select product, sum(`Total Sales`) as total_sales
from adidas_sales
where year(`Invoice Date`) = 2020
group by product
order by 2 desc;

select product, sum(`Total Sales`) as total_sales
from adidas_sales
where year(`Invoice Date`) = 2021
group by product
order by 2 desc;


# 03.prducts별 unit sold 비교
select product, sum(`Units Sold`) as 'units_sold'
from adidas_sales
group by product
order by 2 desc;





-- 2. retailer --
# 01.시장점유율 
select retailer, round(sum(`Total Sales`) / (select sum(`Total Sales`) from adidas_sales),2) as market_share
from adidas_sales
group by retailer
order by 2 desc;

# 02.년도별 매출 합계 -> 년도별 시장 점유율 파이그래프 그리기 위해서
select retailer, year(`Invoice Date`) as year, sum(`Total Sales`) as market_share
from adidas_sales
group by retailer, year(`Invoice Date`)
order by 2, 3 desc;

# 03.retailer의 월별 total sales
select retailer, year(`Invoice Date`) as year, month(`Invoice Date`) as month, sum(`Total Sales`) as total_sales
from adidas_sales
where year(`Invoice Date`) = '2020'
group by 1,2,3
order by 2,3,4 desc;

select retailer, year(`Invoice Date`) as year, month(`Invoice Date`) as month, sum(`Total Sales`) as total_sales
from adidas_sales
where year(`Invoice Date`) = '2021'
group by 1,2,3
order by 2,3,4 desc;



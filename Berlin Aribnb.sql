SELECT *
FROM [dbo].[listings_detail$]


SELECT host_name,host_id, price--, COUNT (HOST_NAME) 
FROM [dbo].[listings_summary$]
group by host_name,host_id,price
having sum (price) >1000
ORDER BY count(host_name) DESC


select Top 10 host_name, (host_id),count(host_id),price,sum (price) over (partition by host_id) as TotalEarningsForHost
from [dbo].[listings_summary$]
group by host_name,price,host_id
order by sum(price) desc


--Top 10 host by listing
select top 10 HOST_NAME,count(host_name) as NumberOfListings,host_id
from [dbo].[listings_summary$]
group by host_name,host_id
order by count(host_name) desc

--Top NEIGHBOURHOOD area
select top 10 neighbourhood, count(neighbourhood) as TopNeighbourhood
from [dbo].[listings_summary$]
group by neighbourhood
order by TopNeighbourhood DESC

--Neighbourhood with the REGION number of listings
select neighbourhood_group, count(neighbourhood_group) as TopRegion
from [dbo].[listings_summary$]
group by neighbourhood_group
ORDER BY TopRegion DESC


--Count of room types 
SELECT room_type,count(room_type) as RoomTypeCount
FROM [dbo].[listings_detail$]
group by room_type
order by RoomTypeCount desc


SELECT room_type,count(room_type) as RoomTypeCount,avg(try_convert(float, 'price')) over (partition by room_type)--avg(try_convert(float, 'price')) as AvgPrice
FROM [dbo].[listings_detail$]
group by room_type,price
order by RoomTypeCount desc


--select host_name,room_type,count(room_type) as RoomTypeCount,sum(price),avg(price)
--from [dbo].[listings_summary$]
--where room_type = 'Entire home/apt' and host_name <> 'null'
--group by host_name,room_type,price
--order by RoomTypeCount desc

select *
from [dbo].[listings_summary$]

--Top 10 bnb with the highest number of reviews
select top 10 host_name,name,number_of_reviews
from [dbo].[listings_summary$]
order by number_of_reviews desc 

---Average price per neighbourhood group
select neighbourhood_group, avg(price) as AvergaePrcie
from [dbo].[listings_summary$]
group by neighbourhood_group
order by avg(price) desc


--Maximum and Minimum prices
select neighbourhood,neighbourhood_group, MAX(PRICE) from [dbo].[listings_summary$] GROUP BY neighbourhood, neighbourhood_group order by max(price) desc
select neighbourhood,neighbourhood_group, Min(PRICE) from [dbo].[listings_summary$] GROUP BY neighbourhood, neighbourhood_group order by min(price) desc


--TotalRevenue
--
--select *--host_name,count(host_name),sum(price)
--from [dbo].[listings_summary$]
----group by host_name
----order by sum(price) desc

--select *
--from [dbo].[Listing2$]

--select host_name,count(host_name) as Num,sum(cast(maximum_nights as int)) as oo * (try_convert(float, "rice")) as oo --sum(isnull(cast(price*maximum_nights as decimal(6,2)))
--from [dbo].[Listing2$]
--where host_name <> 'null'
--group by host_name,rice
--order by oo desc

--select try_convert(float, "rice") from [dbo].[Listing2$]
--select sum(maximum_nights) from [dbo].[Listing2$]

--select sum((try_convert(float, "rice"))*maximum_nights) as Num  , host_name,count (host_name) from [dbo].[Listing2$]
--group by rice,maximum_nights,host_name
--order by num desc

--select *--host_total_listings_count, host_name  
--from [dbo].[Listing2$] 
----order by host_total_listings_count desc
--group by host_name

--Top 10 words or filters potential customers search for online when looking for a room
SELECT Top 10 amenities, count(amenities) as Words
FROM [dbo].[listings_detail$]
group by amenities
order by Words desc

--Types of host available 
select *
from [dbo].[listings_detail$]

--select Top 10 neighbourhood_group, count(neighbourhood_group) as HS
--from [dbo].[listings_summary$]
--group by neighbourhood_group
--ORDER BY HS DESC

SELECT room_type,count(room_type) as RoomTypeCount
FROM [dbo].[listings_detail$]
group by room_type
order by RoomTypeCount desc


--Types of room in each neighbourhood group
select neighbourhood_group,count(neighbourhood_group)as CountNH,ls.room_type
from [dbo].[listings_summary$] ls
join [dbo].[listings_detail$] ld
on ls.host_id = ld.host_id
group by ls.room_type,neighbourhood_group
order by CountNH desc


--Top 10 rating based overall ratings of hosts with more than 100 reviews
select top 10  review_scores_rating,host_name,state,neighbourhood_group_cleansed,number_of_reviews 
from [dbo].[listings_detail$] where number_of_reviews > '100'
order by review_scores_rating desc ,number_of_reviews desc


--select * from [dbo].[listings_detail$]
--select * from [dbo].[listings_summary$]

----select distinct host_name, (number_of_reviews/ sum(number_of_reviews))*100  as p 
----from [dbo].[listings_detail$]
----where (number_of_reviews) <> '0' and host_name <>''
----group by host_name,number_of_reviews
----order by p desc

 

--select host_name, max(number_of_reviews) as NumberOfReviews
--from [dbo].[listings_detail$]
--group by host_name,number_of_reviews
--order by number_of_reviews de
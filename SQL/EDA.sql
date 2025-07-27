														-- HOTEL ANALYTICS --


-- Creating the table

CREATE TABLE hotel (
    ID INT PRIMARY KEY,
    Age FLOAT,
    DaysSinceCreation INT,
    AverageLeadTime INT,
    LodgingRevenue FLOAT,
    OtherRevenue FLOAT,
    BookingsCanceled INT,
    BookingsNoShowed INT,
    BookingsCheckedIn INT,
    PersonsNights INT,
    RoomNights INT,
    DaysSinceLastStay INT,
    DaysSinceFirstStay INT,
    DistributionChannel VARCHAR(100),
    MarketSegment VARCHAR(100),
    SRHighFloor TINYINT,
    SRLowFloor TINYINT,
    SRAccessibleRoom TINYINT,
    SRMediumFloor TINYINT,
    SRBathtub TINYINT,
    SRShower TINYINT,
    SRCrib TINYINT,
    SRKingSizeBed TINYINT,
    SRTwinBed TINYINT,
    SRNearElevator TINYINT,
    SRAwayFromElevator TINYINT,
    SRNoAlcoholInMiniBar TINYINT,
    SRQuietRoom TINYINT,
    CreationDate DATE,
    AvgArrivalDate DATE,
    TotalRevenue FLOAT,
    TotalBookings INT,
    SpecialRequests INT,
    FirstArrivalDate VARCHAR(20),
    LastArrivalDate VARCHAR(20),
    Country VARCHAR(100)
);

# Loading the data in the table

LOAD DATA INFILE  "cleaned_data.csv"
INTO TABLE hotel
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS;

# Overview of the data
select * from hotel;


						-- EXPLORATORY DATA ANLYSIS --

-- What is the total number of unique customers?

set @unique_customers  = (select count(*) from hotel);
select @unique_customers;





-- How has the number of new customers changed over time (monthly/yearly)?  
-- How many customers who were created in each month actually Checked In (BookingsCheckedIn > 0)?


	-- New customers over time

SELECT  
    YEAR(CreationDate) AS creation_year, 
    SUM(CASE WHEN MONTH(CreationDate) = 1 THEN 1 ELSE 0 END) AS Jan,
    SUM(CASE WHEN MONTH(CreationDate) = 2 THEN 1 ELSE 0 END) AS Feb,
    SUM(CASE WHEN MONTH(CreationDate) = 3 THEN 1 ELSE 0 END) AS Mar,
    SUM(CASE WHEN MONTH(CreationDate) = 4 THEN 1 ELSE 0 END) AS Apr,
    SUM(CASE WHEN MONTH(CreationDate) = 5 THEN 1 ELSE 0 END) AS May,
    SUM(CASE WHEN MONTH(CreationDate) = 6 THEN 1 ELSE 0 END) AS Jun,
    SUM(CASE WHEN MONTH(CreationDate) = 7 THEN 1 ELSE 0 END) AS Jul,
    SUM(CASE WHEN MONTH(CreationDate) = 8 THEN 1 ELSE 0 END) AS Aug,
    SUM(CASE WHEN MONTH(CreationDate) = 9 THEN 1 ELSE 0 END) AS Sep,
    SUM(CASE WHEN MONTH(CreationDate) = 10 THEN 1 ELSE 0 END) AS Oct,
    SUM(CASE WHEN MONTH(CreationDate) = 11 THEN 1 ELSE 0 END) AS Nov,
    SUM(CASE WHEN MONTH(CreationDate) = 12 THEN 1 ELSE 0 END) AS Dece
FROM hotel
GROUP BY 1
ORDER BY 1;


	-- Total Bookings Checked-In per Month

SELECT  
    YEAR(CreationDate) AS creation_year, 
    SUM(CASE WHEN MONTH(CreationDate) = 1 THEN BookingsCheckedIn ELSE 0 END) AS Jan,
    SUM(CASE WHEN MONTH(CreationDate) = 2 THEN BookingsCheckedIn ELSE 0 END) AS Feb,
    SUM(CASE WHEN MONTH(CreationDate) = 3 THEN BookingsCheckedIn ELSE 0 END) AS Mar,
    SUM(CASE WHEN MONTH(CreationDate) = 4 THEN BookingsCheckedIn ELSE 0 END) AS Apr,
    SUM(CASE WHEN MONTH(CreationDate) = 5 THEN BookingsCheckedIn ELSE 0 END) AS May,
    SUM(CASE WHEN MONTH(CreationDate) = 6 THEN BookingsCheckedIn ELSE 0 END) AS Jun,
    SUM(CASE WHEN MONTH(CreationDate) = 7 THEN BookingsCheckedIn ELSE 0 END) AS Jul,
    SUM(CASE WHEN MONTH(CreationDate) = 8 THEN BookingsCheckedIn ELSE 0 END) AS Aug,
    SUM(CASE WHEN MONTH(CreationDate) = 9 THEN BookingsCheckedIn ELSE 0 END) AS Sep,
    SUM(CASE WHEN MONTH(CreationDate) = 10 THEN BookingsCheckedIn ELSE 0 END) AS Oct,
    SUM(CASE WHEN MONTH(CreationDate) = 11 THEN BookingsCheckedIn ELSE 0 END) AS Nov,
    SUM(CASE WHEN MONTH(CreationDate) = 12 THEN BookingsCheckedIn ELSE 0 END) AS Dece
FROM hotel
GROUP BY 1
ORDER BY 1;


	-- Total revenue per month

SELECT  
    YEAR(CreationDate) AS creation_year, 
    round(SUM(CASE WHEN MONTH(CreationDate) = 1 THEN TotalRevenue ELSE 0 END)) AS Jan,
    round(SUM(CASE WHEN MONTH(CreationDate) = 2 THEN TotalRevenue ELSE 0 END)) AS Feb,
    round(SUM(CASE WHEN MONTH(CreationDate) = 3 THEN TotalRevenue ELSE 0 END))AS Mar,
    round(SUM(CASE WHEN MONTH(CreationDate) = 4 THEN TotalRevenue ELSE 0 END)) AS Apr,
    round(SUM(CASE WHEN MONTH(CreationDate) = 5 THEN TotalRevenue ELSE 0 END)) AS May,
    round(SUM(CASE WHEN MONTH(CreationDate) = 6 THEN TotalRevenue ELSE 0 END))AS Jun,
    round(SUM(CASE WHEN MONTH(CreationDate) = 7 THEN TotalRevenue ELSE 0 END))AS Jul,
    round(SUM(CASE WHEN MONTH(CreationDate) = 8 THEN TotalRevenue ELSE 0 END)) AS Aug,
    round(SUM(CASE WHEN MONTH(CreationDate) = 9 THEN TotalRevenue ELSE 0 END)) AS Sep,
    round(SUM(CASE WHEN MONTH(CreationDate) = 10 THEN TotalRevenue ELSE 0 END)) AS Oct,
    round(SUM(CASE WHEN MONTH(CreationDate) = 11 THEN TotalRevenue ELSE 0 END)) AS Nov,
    round(SUM(CASE WHEN MONTH(CreationDate) = 12 THEN TotalRevenue ELSE 0 END)) AS Dece,
    round(Sum(TotalRevenue)) as total
FROM hotel
GROUP BY 1
ORDER BY 1;






-- What is the average, median, and distribution of total revenue per customer?








-- What percentage of customers contributed to 80% of the total revenue?






-- How does customer age relate to total revenue or repeat bookings?






-- Which nationalities account for the majority of guests and revenue?






-- What are the top 5 most and least common booking channels and their revenue impact?


-- What percentage of customers never made any bookings.

set @no_bookings = (select sum(case when TotalBookings=0 then 1 else 0 end) from hotel);
set @TotalCustomers = (select count(*) from hotel);

select round((@no_bookings/@TotalCustomers)*100,2) as pct_no_bookings;




-- What percentage of customers made special requests?


set @TotalCustomers = (select count(*) from hotel);

select round((sum(case when SpecialRequests>0 then 1 else 0 end)/@TotalCustomers)*100,2) as pct_sr from hotel;




-- How do guest behaviors vary by market segment, distribution channel and country (e.g., cancellations, average spend)?

	-- MarketSegment
select 
	MarketSegment, 
    count(*) as total_customers, 
    round(sum(TotalRevenue)) as total_revenue,
    sum(BookingsCanceled) as cancellations,
    sum(BookingsNoShowed) as no_showed,
    sum(BookingsCheckedIn) as checked_in,
    sum(TotalBookings) as total_bookings,
    sum(SpecialRequests) as special_requests
from hotel
group by 1;


	-- DistributionChannel

select 
	DistributionChannel, 
    count(*) as total_customers, 
    round(sum(TotalRevenue)) as total_revenue,
    sum(BookingsCanceled) as cancellations,
    sum(BookingsNoShowed) as no_showed,
    sum(BookingsCheckedIn) as checked_in,
    sum(TotalBookings) as total_bookings,
    sum(SpecialRequests) as special_requests
from hotel
group by 1;


	-- Country

select 
	Country, 
    count(*) as total_customers, 
    round(sum(TotalRevenue)) as total_revenue,
    sum(BookingsCanceled) as cancellations,
    sum(BookingsNoShowed) as no_showed,
    sum(BookingsCheckedIn) as checked_in,
    sum(TotalBookings) as total_bookings,
    sum(SpecialRequests) as special_requests
from hotel
group by 1
order by 2 desc;




-- Booking channel preferences 

select 
	DistributionChannel,
    count(*) as customers,
    round((count(*)/sum(count(*)) over())*100,2) as percentage_share
from hotel
group by 1;


-- Which Special Request customers ask for most

select 
	sum(SRAccessibleRoom) as accessible_room,
    sum(SRAwayFromElevator) as away_from_elevator,
    sum(SRBathtub) as bathtub,
    sum(SRCrib) as crib,
    sum(SRHighFloor) as high_floor,
    sum(SRKingSizeBed) as King_bed,
    sum(SRLowFloor) as low_floor,
    sum(SRMediumFloor) as medium_floor,
    sum(SRNearElevator) as near_elevator,
    sum(SRNoAlcoholInMiniBar) as no_alcohol,
    sum(SRQuietRoom) as quiet_room,
    sum(SRShower) as shower,
    sum(SRTwinBed) as twin_bed
from hotel;

select count(*) from hotel where TotalBookings=0 and SpecialRequests>0;
select count(*) from hotel where TotalBookings=0;


					-- Booking Reliability Score 

-- Reliability Rate = BookingsCheckedIn / (TotalBookings - BookingsCanceled)
-- No-Show Rate = BookingsNoShowed / TotalBookings
-- Cancellation Rate = BookingsCanceled / TotalBookings


	-- aggregated by customers
    
select 
	ID,
    TotalBookings,
    round((BookingsCheckedIn/(TotalBookings-BookingsCanceled)),2) as reliability_rate,
    round((BookingsNoShowed/TotalBookings),2) as no_show_rate,
    round((BookingsCanceled/TotalBookings),2) as cancellation_rate
from hotel
order by 4 desc;

	-- aggregated by market segment
SELECT 
    MarketSegment,
    SUM(TotalBookings) AS total_bookings,
    ROUND(SUM(BookingsCheckedIn) / NULLIF(SUM(TotalBookings) - SUM(BookingsCanceled), 0), 2)*100 AS reliability_rate,
    ROUND(SUM(BookingsNoShowed) / NULLIF(SUM(TotalBookings), 0), 2)*100 AS no_show_rate,
    ROUND(SUM(BookingsCanceled) / NULLIF(SUM(TotalBookings), 0), 2)*100 AS cancellation_rate
FROM hotel
GROUP BY MarketSegment;

	-- aggregated by distribution channel
SELECT 
    DistributionChannel,
    SUM(TotalBookings) AS total_bookings,
    ROUND(SUM(BookingsCheckedIn) / NULLIF(SUM(TotalBookings) - SUM(BookingsCanceled), 0), 2)*100 AS reliability_rate,
    ROUND(SUM(BookingsNoShowed) / NULLIF(SUM(TotalBookings), 0), 2)*100 AS no_show_rate,
    ROUND(SUM(BookingsCanceled) / NULLIF(SUM(TotalBookings), 0), 2)*100 AS cancellation_rate
FROM hotel
GROUP BY 1;


								-- RFM Analysis [Recency, Frequency & Monetary]
 -- *** Need to look closely at the distribution of DaysSinceLastStay, TotalBookings and TotalRevenue for better segmentation and find more business relevant rfm scores.



set @max_revenue = round((select max(TotalRevenue) from hotel));
set @min_revenue = (select min(TotalRevenue) from hotel);
set @max_laststay = (select max(DaysSinceLastStay) from hotel);
set @min_laststay = (select min(DaysSinceLastStay) from hotel where DaysSinceLastStay <> -1);
set @max_totalbookings = (select max(TotalBookings) from hotel);
set @min_totalbookings = (select min(TotalBookings) from hotel);

select @max_revenue, @min_revenue, @max_laststay, @min_laststay, @max_totalbookings, @min_totalbookings;


DROP VIEW IF EXISTS rfm_segment_summary;
CREATE VIEW rfm_segment_summary AS
with rfm_scores as (
	select
		ID,
        DaysSinceLastStay,
        TotalBookings,
        TotalRevenue,
        CASE
			WHEN DaysSinceLastStay <= 106 THEN 5
			WHEN DaysSinceLastStay <= 296 THEN 4
			WHEN DaysSinceLastStay <= 519 THEN 3
			WHEN DaysSinceLastStay <= 834 THEN 2
			ELSE 1
		END AS recency_score,
        case 
			when TotalBookings >= 10 then 5
            when TotalBookings >= 5 then 4
            when TotalBookings >= 3 then 3
            when TotalBookings >= 2 then 2
            when TotalBookings = 1 then 1
        end as frequency_score,
        CASE
			WHEN TotalRevenue <= 129 THEN 1
			WHEN TotalRevenue <= 292 THEN 2
			WHEN TotalRevenue <= 449 THEN 3
			WHEN TotalRevenue <= 794 THEN 4
			ELSE 5
		END AS monetary_score
	from hotel
    where TotalRevenue>0
),

rfm_segments as (
	select
			*,
			concat(recency_score, frequency_score, monetary_score) as rfm_code,
			round((recency_score*0.4+ frequency_score*0.3 + monetary_score*0.3),2) as weighted_rfm_score,
            
			-- Strategic Segmentation based on RFM combinations
           CASE 
               -- Champions: High across all dimensions (4-5 in each)
               WHEN recency_score >= 4 AND frequency_score >= 4 AND monetary_score >= 4 THEN 'Champions'
               
               -- Loyal Customers: High F&M, moderate+ R
               WHEN frequency_score >= 4 AND monetary_score >= 4 AND recency_score >= 3 THEN 'Loyal Customers'
               
               -- Potential Loyalists: High R, moderate F&M
               WHEN recency_score >= 4 AND frequency_score >= 2 AND monetary_score >= 2 THEN 'Potential Loyalists'
               
               -- New Customers: High R, low F (regardless of M)
               WHEN recency_score >= 4 AND frequency_score <= 2 THEN 'New Customers'
               
               -- Promising: Moderate across all (2-3 range)
               WHEN recency_score >= 2 AND frequency_score >= 2 AND monetary_score >= 2 
                    AND (recency_score + frequency_score + monetary_score) >= 8 THEN 'Promising'
               
               -- Need Attention: High M&F but declining R
               WHEN monetary_score >= 3 AND frequency_score >= 3 AND recency_score <= 2 THEN 'Need Attention'
               
               -- About to Sleep: Moderate M&F, low R
               WHEN monetary_score >= 2 AND frequency_score >= 2 AND recency_score <= 2 THEN 'About to Sleep'
               
               -- At Risk: High historical value but very low recency
               WHEN monetary_score >= 4 AND recency_score = 1 THEN 'At Risk'
               
               -- Cannot Lose Them: Highest M&F but lowest R
               WHEN monetary_score = 5 AND frequency_score >= 4 AND recency_score = 1 THEN 'Cannot Lose Them'
               
               -- Hibernating: Low R&F but had some value
               WHEN recency_score <= 2 AND frequency_score <= 2 AND monetary_score >= 2 THEN 'Hibernating'
               
               -- Lost: Low across all dimensions
               ELSE 'Lost'
           END as customer_segment
    from rfm_scores

),

segment_analysis as (
	select
		customer_segment,
        count(*) as customer_count,
        round(count(*)/sum(count(*)) over(),3) as percentage_of_base,
        
        -- RFM Score Analysis
        ROUND(AVG(recency_score), 3) as avg_recency_score,
        ROUND(AVG(frequency_score),3) as avg_frequency_score,
        ROUND(AVG(monetary_score), 3) as avg_monetary_score,
        ROUND(AVG(weighted_rfm_score), 3) as avg_weighted_rfm,
        
        -- Business Metrics
        ROUND(AVG(TotalRevenue), 3) as avg_revenue,
        ROUND(AVG(TotalBookings), 3) as avg_bookings,
        ROUND(AVG(DaysSinceLastStay), 0) as avg_days_since_last_stay,
        ROUND(AVG(TotalRevenue / NULLIF(TotalBookings, 0)), 2) as avg_revenue_per_booking,
        
        -- Revenue Concentration
        ROUND(SUM(TotalRevenue), 3) as total_segment_revenue,
        ROUND((SUM(TotalRevenue)/ SUM(SUM(TotalRevenue)) OVER ())*100, 2) as revenue_contribution_pct,
        
        -- Value Ranges for each segment
        round(MIN(TotalRevenue),2) as min_revenue,
        round(MAX(TotalRevenue),2) as max_revenue,
        MIN(TotalBookings) as min_bookings,
        MAX(TotalBookings) as max_bookings,
        MIN(DaysSinceLastStay) as min_days_since_last_stay,
        MAX(DaysSinceLastStay) as max_days_since_last_stay
        
    FROM rfm_segments
    GROUP BY customer_segment
    ORDER BY 
		CASE customer_segment
			WHEN 'Champions' THEN 1
			WHEN 'Loyal Customers' THEN 2
			WHEN 'Potential Loyalists' THEN 3
			WHEN 'New Customers' THEN 4
			WHEN 'Promising' THEN 5
			WHEN 'Need Attention' THEN 6
			WHEN 'About to Sleep' THEN 7
			WHEN 'At Risk' THEN 8
			WHEN 'Cannot Lose Them' THEN 9
			WHEN 'Hibernating' THEN 10
			WHEN 'Lost' THEN 11
			ELSE 12
		END
)

SELECT * FROM segment_analysis;
 
select * from rfm_segment_summary;


 -- Adding the customer segment labels in our original table

ALTER TABLE hotel
ADD COLUMN customer_segment VARCHAR(50);

with rfm_scores as (
	select
		ID,
        DaysSinceLastStay,
        TotalBookings,
        TotalRevenue,
        CASE
			WHEN DaysSinceLastStay <= 106 THEN 5
			WHEN DaysSinceLastStay <= 296 THEN 4
			WHEN DaysSinceLastStay <= 519 THEN 3
			WHEN DaysSinceLastStay <= 834 THEN 2
			ELSE 1
		END AS recency_score,
        case 
			when TotalBookings >= 10 then 5
            when TotalBookings >= 5 then 4
            when TotalBookings >= 3 then 3
            when TotalBookings >= 2 then 2
            when TotalBookings = 1 then 1
        end as frequency_score,
        CASE
			WHEN TotalRevenue <= 129 THEN 1
			WHEN TotalRevenue <= 292 THEN 2
			WHEN TotalRevenue <= 449 THEN 3
			WHEN TotalRevenue <= 794 THEN 4
			ELSE 5
		END AS monetary_score
	from hotel
    where TotalRevenue>0
),

rfm_segments as (
	select
			*,
			concat(recency_score, frequency_score, monetary_score) as rfm_code,
			round((recency_score*0.4+ frequency_score*0.3 + monetary_score*0.3),2) as weighted_rfm_score,
            
			-- Strategic Segmentation based on RFM combinations
           CASE 
               -- Champions: High across all dimensions (4-5 in each)
               WHEN recency_score >= 4 AND frequency_score >= 4 AND monetary_score >= 4 THEN 'Champions'
               
               -- Loyal Customers: High F&M, moderate+ R
               WHEN frequency_score >= 4 AND monetary_score >= 4 AND recency_score >= 3 THEN 'Loyal Customers'
               
               -- Potential Loyalists: High R, moderate F&M
               WHEN recency_score >= 4 AND frequency_score >= 2 AND monetary_score >= 2 THEN 'Potential Loyalists'
               
               -- New Customers: High R, low F (regardless of M)
               WHEN recency_score >= 4 AND frequency_score <= 2 THEN 'New Customers'
               
               -- Promising: Moderate across all (2-3 range)
               WHEN recency_score >= 2 AND frequency_score >= 2 AND monetary_score >= 2 
                    AND (recency_score + frequency_score + monetary_score) >= 8 THEN 'Promising'
               
               -- Need Attention: High M&F but declining R
               WHEN monetary_score >= 3 AND frequency_score >= 3 AND recency_score <= 2 THEN 'Need Attention'
               
               -- About to Sleep: Moderate M&F, low R
               WHEN monetary_score >= 2 AND frequency_score >= 2 AND recency_score <= 2 THEN 'About to Sleep'
               
               -- At Risk: High historical value but very low recency
               WHEN monetary_score >= 4 AND recency_score = 1 THEN 'At Risk'
               
               -- Cannot Lose Them: Highest M&F but lowest R
               WHEN monetary_score = 5 AND frequency_score >= 4 AND recency_score = 1 THEN 'Cannot Lose Them'
               
               -- Hibernating: Low R&F but had some value
               WHEN recency_score <= 2 AND frequency_score <= 2 AND monetary_score >= 2 THEN 'Hibernating'
               
               -- Lost: Low across all dimensions
               ELSE 'Lost'
           END as customer_segment
    from rfm_scores

)

UPDATE hotel h
JOIN rfm_segments r
  ON h.ID = r.ID
SET h.customer_segment = r.customer_segment;



	-- Getting additional insights from the data

-- customer_segment vs country
select 
	Country,
    count(*) as Total_customers,
    sum(case when customer_segment = 'Champions' then 1 else 0 end) as Champions,
    sum(case when customer_segment = 'Loyal Customers' then 1 else 0 end) as Loyal_Customers,
    sum(case when customer_segment = 'Potential Loyalists' then 1 else 0 end) as Potential_Loyalists,
    sum(case when customer_segment = 'New Customers' then 1 else 0 end) as New_Customers,
    sum(case when customer_segment = 'Promising' then 1 else 0 end) as Promising,
    sum(case when customer_segment = 'Need Attention' then 1 else 0 end) as Need_Attention,
    sum(case when customer_segment = 'About to Sleep' then 1 else 0 end) as About_to_Sleep,
    sum(case when customer_segment = 'At Risk' then 1 else 0 end) as At_Risk,
	sum(case when customer_segment = 'Hibernating' then 1 else 0 end) as Hibernating,
	sum(case when customer_segment = 'Lost' then 1 else 0 end) as Lost
from hotel
where TotalRevenue>0
group by 1
order by Champions desc;

-- customer_segment vs DistributionChannel
select 
	DistributionChannel,
    count(*) as Total_customers,
    sum(case when customer_segment = 'Champions' then 1 else 0 end) as Champions,
    sum(case when customer_segment = 'Loyal Customers' then 1 else 0 end) as Loyal_Customers,
    sum(case when customer_segment = 'Potential Loyalists' then 1 else 0 end) as Potential_Loyalists,
    sum(case when customer_segment = 'New Customers' then 1 else 0 end) as New_Customers,
    sum(case when customer_segment = 'Promising' then 1 else 0 end) as Promising,
    sum(case when customer_segment = 'Need Attention' then 1 else 0 end) as Need_Attention,
    sum(case when customer_segment = 'About to Sleep' then 1 else 0 end) as About_to_Sleep,
    sum(case when customer_segment = 'At Risk' then 1 else 0 end) as At_Risk,
	sum(case when customer_segment = 'Hibernating' then 1 else 0 end) as Hibernating,
	sum(case when customer_segment = 'Lost' then 1 else 0 end) as Lost
from hotel
where TotalRevenue>0
group by 1
order by Champions desc;

-- customer_segment vs MarketSegment
select 
	MarketSegment,
    count(*) as Total_customers,
    sum(case when customer_segment = 'Champions' then 1 else 0 end) as Champions,
    sum(case when customer_segment = 'Loyal Customers' then 1 else 0 end) as Loyal_Customers,
    sum(case when customer_segment = 'Potential Loyalists' then 1 else 0 end) as Potential_Loyalists,
    sum(case when customer_segment = 'New Customers' then 1 else 0 end) as New_Customers,
    sum(case when customer_segment = 'Promising' then 1 else 0 end) as Promising,
    sum(case when customer_segment = 'Need Attention' then 1 else 0 end) as Need_Attention,
    sum(case when customer_segment = 'About to Sleep' then 1 else 0 end) as About_to_Sleep,
    sum(case when customer_segment = 'At Risk' then 1 else 0 end) as At_Risk,
	sum(case when customer_segment = 'Hibernating' then 1 else 0 end) as Hibernating,
	sum(case when customer_segment = 'Lost' then 1 else 0 end) as Lost
from hotel
where TotalRevenue>0
group by 1
order by Champions desc;
    

select 
	customer_segment,
    sum(SpecialRequests) as special_requests,
    sum(TotalBookings) as total_bookings,
    round(avg(Age)) as average_age,
    round(avg(DaysSinceCreation)) as avg_days_since_creation,
    round(avg(AverageLeadTime)) as avg_lead_time,
    round(sum(LodgingRevenue)) as lodging_revenue,
    round(sum(OtherRevenue)) as other_revenue,
    sum(BookingsCheckedIn) as checked_in,
    sum(BookingsCanceled) as cancelled,
    sum(BookingsNoShowed) as no_showed,
    sum(PersonsNights) as persons_nights,
    sum(RoomNights) as room_nights,
    round(avg(DaysSinceLastStay)) as avg_days_since_last_stay,
    round(avg(DaysSinceFirstStay)) as avg_days_since_first_stay
from hotel
where TotalRevenue > 0
group by customer_segment
ORDER BY 
		CASE customer_segment
			WHEN 'Champions' THEN 1
			WHEN 'Loyal Customers' THEN 2
			WHEN 'Potential Loyalists' THEN 3
			WHEN 'New Customers' THEN 4
			WHEN 'Promising' THEN 5
			WHEN 'Need Attention' THEN 6
			WHEN 'About to Sleep' THEN 7
			WHEN 'At Risk' THEN 8
			WHEN 'Cannot Lose Them' THEN 9
			WHEN 'Hibernating' THEN 10
			WHEN 'Lost' THEN 11
			ELSE 12
		END;

-- count of new customers in each customer_segment vs year

select 
	year(CreationDate) as _year,
    count(*) as Total_customers,
    sum(case when customer_segment = 'Champions' then 1 else 0 end) as Champions,
    sum(case when customer_segment = 'Loyal Customers' then 1 else 0 end) as Loyal_Customers,
    sum(case when customer_segment = 'Potential Loyalists' then 1 else 0 end) as Potential_Loyalists,
    sum(case when customer_segment = 'New Customers' then 1 else 0 end) as New_Customers,
    sum(case when customer_segment = 'Promising' then 1 else 0 end) as Promising,
    sum(case when customer_segment = 'Need Attention' then 1 else 0 end) as Need_Attention,
    sum(case when customer_segment = 'About to Sleep' then 1 else 0 end) as About_to_Sleep,
    sum(case when customer_segment = 'At Risk' then 1 else 0 end) as At_Risk,
	sum(case when customer_segment = 'Hibernating' then 1 else 0 end) as Hibernating,
	sum(case when customer_segment = 'Lost' then 1 else 0 end) as Lost
from hotel
where TotalRevenue>0
group by 1;


-- Age group analysis


select avg(Age) from hotel where TotalRevenue > 0;
select min(Age) from hotel where TotalRevenue > 0;

with age_segment as (
	select 
		*,
		case 
			WHEN Age <= 17 THEN 'Children/Teens'
			WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults'
			WHEN Age BETWEEN 30 AND 44 THEN 'Early Middle Age'
			WHEN Age BETWEEN 45 AND 59 THEN 'Late Middle Age'
			WHEN Age BETWEEN 60 AND 74 THEN 'Young Seniors'
			WHEN Age >= 75 THEN 'Elderly'
		end as age_segment
	from hotel
)
select 
	age_segment,
    count(*) as total_customers,
    round(sum(TotalRevenue),2) as total_revenue,
    sum(TotalBookings) as total_bookings,
    sum(BookingsCanceled) as bookings_cancelled,
    round(avg(AverageLeadTime)) as avg_lead_time,
    round(avg(DaysSinceCreation)) as days_since_creation,
    sum(SpecialRequests) as special_request,
    sum(SRLowFloor) as low_floor,
    sum(SRHighFloor) as high_floor,
    sum(SRCrib) as crib,
    sum(SRAccessibleRoom) as accessible_room,
    sum(SRQuietRoom) as quiet_room,
    round(avg(DaysSinceLastStay)) as days_since_last_stay
from age_segment
where TotalRevenue>0
group by 1;

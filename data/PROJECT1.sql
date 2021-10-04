--price, genre, content_rating,
--SELECT name, category,rating,price,content_rating,genres
--FROM play_store_apps

--SELECT name, price, rating, content_rating,primary_genre
--FROM app_store_apps

--SELECT name
--FROM app_store_apps INNER JOIN app_store_apps.name 
--ORDER BY name 

--

--SELECT ROUND(SUM(rating *1.5+1),1)
--FROM app_store_apps 
--GROUP BY price

--ANDREW CODE MVP
-- WITH top_potential_apps AS (SELECT DISTINCT play_store_apps.name AS play_store, play_store_apps.rating AS play_store_rating, play_store_apps.price::money AS ps_price,
-- 											app_store_apps.name as app_store, app_store_apps.rating AS app_store_rating, app_store_apps.price::money AS as_price
-- 							FROM play_store_apps
-- 							LEFT JOIN app_store_apps ON play_store_apps.name = app_store_apps.name
-- 							WHERE play_store_apps.name IS NOT null AND app_store_apps.name IS NOT null
--							ORDER BY play_store_rating DESC, app_store_rating DESC, ps_price DESC, as_price DESC)
							
--select *, ((ps_price * 10000)+(as_price * 10000)) as rights, (((play_store_rating * 2)+1)+((app_store_rating * 2)+1))/2 as life_expectancy_yrs
--	CASE WHEN 0 = 0 then '10000'
--from top_potential_apps

--SELECT DISTINCT apple.price::money AS Aprice, droid.price::money AS Dprice, *
--FROM app_store_apps AS apple 
--LEFT JOIN play_store_apps AS droid
--ON apple.name = droid.name
--WHERE apple IS NOT null AND droid IS NOT null
--ORDER BY apple.price DESC;





--  TEST CODE FOR TOTAL PURCHASE
--SELECT *, ((ps_price * 10000)+(as_price * 10000)) as rights,
-- FROM top_potential_apps
--SELECT  content_rating
--FROM app_store_apps AS apple_store LEFT JOIN play_store_app AS droid_store
--ON name




-- **MVP FOR TOP PERFORMING APPS
--  WITH top_potential_apps AS 
--  	(SELECT DISTINCT
--  		play_store_apps.name AS name,
--  		primary_genre,
--  		genres,
--  		app_store_apps.rating + play_store_apps.rating AS app_rating,
--  		10000*(app_store_apps.price::money + play_store_apps.price::money) AS app_price,
--  		CASE
--  			WHEN 	 10000*(app_store_apps.price::money + play_store_apps.price::money) > 0::money
--  				THEN 10000*(app_store_apps.price::money + play_store_apps.price::money)
--  			ELSE 10000::money
--  		END AS rights,
--  	2*(app_store_apps.rating + play_store_apps.rating) + 1 AS life_expectancy_years
--  	FROM play_store_apps
--  	LEFT JOIN app_store_apps ON play_store_apps.name = app_store_apps.name
--  	WHERE play_store_apps.name IS NOT NULL
--  		AND app_store_apps.name IS NOT NULL
--  	ORDER BY app_rating,
--  		app_price DESC)
--  SELECT name,
--  	primary_genre AS App_Store_Genre,
--  	genres AS Play_Store_Genre,
--  	round(life_expectancy_years/2,2) AS life_expectancy,
--  	(60000*life_expectancy_years)::money AS expected_revenue,
--  	(12000*life_expectancy_years)::money AS marketing_cost,
--  	(60000*life_expectancy_years)::money
--  		- rights
--  		- (12000*life_expectancy_years)::money AS expected_profit
--  FROM top_potential_apps
--  ORDER BY expected_profit DESC
--  LIMIT 50


--left JOIN INSTALL
--  SELECT *
--  FROM play_store_apps AS google
--  LEFT JOIN app_store_apps AS apple
--  ON google.name = apple.name
--  WHERE google IS NOT NULL AND apple IS NOT NULL
--  ORDER BY install_count;

-- BREAKdown of OUR APP CHOICES
--SELECT (price * 10000) AS app_buy, name
--FROM app_store_apps AS apple







WITH top_potential_apps AS (
	SELECT DISTINCT
		play_store_apps.name AS name,
		primary_genre,
		genres,
		app_store_apps.rating + play_store_apps.rating AS app_rating,
		10000*(app_store_apps.price::money + play_store_apps.price::money) AS app_price,
		CASE
			WHEN 	 10000*(app_store_apps.price::money + play_store_apps.price::money) > 0::money
				THEN 10000*(app_store_apps.price::money + play_store_apps.price::money)
			ELSE 10000::money
		END AS rights,
	2*(app_store_apps.rating + play_store_apps.rating) + 1 AS life_expectancy_years
	FROM play_store_apps
	LEFT JOIN app_store_apps ON play_store_apps.name = app_store_apps.name
	WHERE play_store_apps.name IS NOT NULL
		AND app_store_apps.name IS NOT NULL
	ORDER BY app_rating,
		app_price DESC
)
SELECT name,
	primary_genre AS App_Store_Genre,
	genres AS Play_Store_Genre,
	round(life_expectancy_years/2,2) as life_expectancy,
	(60000*life_expectancy_years)::money AS expected_revenue,
	(12000*life_expectancy_years)::money AS marketing_cost,
	(60000*life_expectancy_years)::money
		- rights
		- (12000*life_expectancy_years)::money AS expected_profit
FROM top_potential_apps
ORDER BY expected_revenue DESC
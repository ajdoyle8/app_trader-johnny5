-- app_store_apps : 7179 rows
--		avg rating : 3.5269556759761012 / 5
-- play_store_apps : 10840 rows
--		avg rating : 4.1917574204569720 / 5

select distinct play_store_apps.name as play_store, play_store_apps.rating as play_store_rating, play_store_apps.price as pp, app_store_apps.name as app_store, app_store_apps.rating as app_store_rating, app_store_apps.price as ap
from play_store_apps
left join app_store_apps on play_store_apps.name = app_store_apps.name
where play_store_apps.name is not null and app_store_apps.name is not null
order by play_store_rating DESC, app_store_rating DESC
-- 329 rows
(rating * .5)+1 = years of relevancy * 12 * 5000 = app gross - 1000 = total cost of app
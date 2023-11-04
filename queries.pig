---------------------------------------------------------------------------
-- 5 drinks with the lowest calories
---------------------------------------------------------------------------

drinks_calories = LOAD 'output_expanded/part-m-00000' USING PigStorage(',') AS (Beverage_category:chararray, Beverage:chararray, Beverage_prep:chararray, Calories:int);

sorted_data = ORDER drinks_calories BY Calories;

limited_data = LIMIT sorted_data 5;

DUMP limited_data;


---------------------------------------------------------------------------
-- Beverage catergory with the most different beverages
---------------------------------------------------------------------------

grouped_data = GROUP drinks_calories BY Beverage_category;

beverage_counts = FOREACH grouped_data GENERATE group AS Beverage_category, COUNT(drinks_calories) AS Beverage_count; 

ordered_data = ORDER beverage_counts BY Beverage_count DESC;

top_category = LIMIT ordered_data 1;

DUMP top_category;

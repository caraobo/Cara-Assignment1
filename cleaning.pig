---------------------------------------------------------------------------
-- drinks menu
---------------------------------------------------------------------------

cleaned_expanded = LOAD 'starbucks_drinkMenu_modified.csv' USING PigStorage('\t') AS (Beverage_category:chararray, Beverage:chararray, Calories:int, Protein_g:double);

DUMP cleaned_expanded;

data_cleaned = FOREACH cleaned_expanded GENERATE REPLACE(REPLACE(Beverage_category, 'Ã®', ''), 'Ã¨', 'e') AS Beverage_category, REPLACE(REPLACE(Beverage, 'Ã¨', 'e'), 'Ã®', '') AS Beverage, Calories, Protein_g;

DUMP data_cleaned;

STORE data_cleaned INTO 'output_expanded' USING PigStorage(',');


---------------------------------------------------------------------------
-- food menu
---------------------------------------------------------------------------

food_data = LOAD 'starbucks-menu-nutrition-food.csv' USING PigStorage(',') AS (Food:chararray, Calories:int, Fat:int, Carb:int, Fiber:int, Protein:int);

selected_data = FOREACH food_data GENERATE Food, Calories, Protein;

DUMP selected_data;

STORE selected_data INTO 'output_food' USING PigStorage(',');

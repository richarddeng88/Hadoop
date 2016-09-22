############################### pig ############################################
@@ cloudera pig data example
pig -x local  /   pig -x mapreduce

@@ load the data into info. 
info = load '/user/cloudera/data/customer_info/info.csv' using PigStorage(',') as (id:int, name:chararray, gender:chararray, state:chararray, year:int, age:int);
describe info;

b = limit info 100;
dump b;
store b into 'output/cus_info' using PigStorage(',');

@@ data processing -- filter
filter1 = filter info by age == 44;
filter2 = filter info by age in (41,42,44);
filter3 = filter info by $4 > 44;
filter4 = filter info by name matches 'K.*y';

@@ data processing -- split
split info into cus_f if gender == 'Female', cus_m if gender == 'Male';

@@ sampling
sample1 = sample info 0.15;

@@ ordering
order1 = order info by age asc;

@@ grouping
b = limit info 50;
group1 = group b by (year, gender);
dump group1;

#################################################################
@@@ use case 
Pig Latin use cases tend to fall into three separate categories: traditional extract transform load (ETL) data pipelines, research on raw data, and iterative processing.

The largest use case is data pipelines. A common example is web companies bringing in logs from their web servers, cleansing the data, and precomputing common aggregates before loading it into their data warehouse. In this case, the data is loaded onto
the grid, and then Pig is used to clean out records from bots and records with corrupt data. It is also used to join web event data against user databases so that user cookies can be connected with known user information.

Another example of data pipelines is using Pig offline to build behavior prediction models. Pig is used to scan through all the user interactions with a website and split the users into various segments. Then, for each segment, a mathematical model is produced that predicts how members of that segment will respond to types of advertisements or news articles. In this way the website can show ads that are more likely to get clicked on, or offer news stories that are more likely to engage users and keep them coming back to the site.


#################################################################



STOCK_A = LOAD '/user/maria_dev/NYSE_daily_prices_A.csv' USING PigStorage(','); 
DESCRIBE STOCK_A; 

STOCK_A = LOAD '/user/maria_dev/NYSE_daily_prices_A.csv' USING PigStorage(',') 
    AS (exchange:chararray, symbol:chararray, date:chararray,                 
    open:float, high:float, low:float, close:float, volume:int, adj_close:float); 
    DESCRIBE STOCK_A; 


 B = LIMIT STOCK_A 100; 
    DESCRIBE B; 


    STOCK_A = LOAD '/user/maria_dev/NYSE_daily_prices_A.csv' using PigStorage(',') 
    AS (exchange:chararray, symbol:chararray, date:chararray, open:float, 
    high:float, low:float, close:float, volume:int, adj_close:float); 

    B = LIMIT STOCK_A 100; 
    C = FOREACH B GENERATE symbol, date, close; 
    DESCRIBE C; 

   STORE C INTO 'output/C' USING PigStorage(','); 


   STOCK_A = LOAD 'NYSE_daily_prices_A.csv' using PigStorage(',') 
        AS (exchange:chararray, symbol:chararray, date:chararray,
        open:float, high:float, low:float, close:float, volume:int, adj_close:float); 
    DIV_A = LOAD 'NYSE_dividends_A.csv' using PigStorage(',') 
        AS (exchange:chararray, symbol:chararray, date:chararray, dividend:float); 
    C = JOIN STOCK_A BY (symbol, date), DIV_A BY (symbol, date); 
    DESCRIBE C; 






-- 1 Write a query to get Total films released ?
select count(*) as total_films from boxoffice;

-- 2 Write a query to get Total budget ?
select sum(budget) as total_budget from boxoffice;

-- 3 Write a query to get Total worldwide collection ?
SELECT 
    ROUND(SUM(Worldwide_Collection_in_Crores), 2) AS total_collection
FROM
    boxoffice;

-- 4 Write a query to get Total First day collection worldwide ?
SELECT 
    ROUND(SUM(First_Day_Collection_Worldwide), 2) AS fist_day_WW_Collection
FROM
    boxoffice;

-- 5 Write a query to get Total Overseas collection ? 
SELECT 
    SUM(Overseas_Collection) AS Total_Overseas_Collection
FROM
    boxoffice;

-- 6 Write a query to get Total India Gross collection ?
SELECT 
    ROUND(SUM(India_Gross_Collection), 2) AS Total_IND_gross_collction
FROM
    boxoffice;

-- 7 Top 10 filmsbased on world wide collections. Display films,collections
SELECT 
    title, Worldwide_Collection_in_Crores AS total_collection
FROM
    boxoffice
ORDER BY Worldwide_Collection_in_Crores DESC
LIMIT 10;

-- 8 Total Number of films released by year 
SELECT SUBSTR(release_Date, 7, 4) AS Yr, COUNT(*) AS No_of_films
FROM boxoffice GROUP BY Yr
ORDER BY yr;

-- 9 Top 10 filmsbased on india collections.Display films,collections
SELECT title, India_Gross_Collection FROM boxoffice
ORDER BY India_Gross_Collection DESC
LIMIT 10;

-- 10 Top 10 filmsbased on overses collections.Display films,collections 
SELECT title, Overseas_Collection FROM boxoffice
ORDER BY Overseas_Collection DESC
LIMIT 10;

-- 11 Top 10 filmsbased on firstday collections.Display films,collections 
SELECT title,First_Day_Collection_Worldwide FROM boxoffice
ORDER BY First_Day_Collection_Worldwide DESC
LIMIT 10;

-- 12 Weekday wise films released,Display week name and no of films released
select Week_Name,count(*) as No_of_films from boxoffice
group by Week_Name;

-- 13 Write a query to get OTT platofrm wise movies count 
select OTT_PlatDform,count(*) as no_of_films from boxoffice
group by OTT_Platform
order by 2 desc;

-- 14 Top 10 Directors by films released
select d.Director, count(b.DirectorID) count_of_films from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
group by d.Director
order by 2 desc limit 10;

-- 15 Top 10 directors by world wide collection 
select d.Director, sum(b.worldwide_Collection_in_Crores) as WW_Collctions from boxoffice b 
inner join director d on d.DirectorID = b.DirectorID
group by d.Director
order by 2 desc limit 10;

 
-- 16 Top10 lead actors by world wide collection 
select Lead_Actor_Actress, sum(Worldwide_Collection_in_Crores) as WW_collction from boxoffice
group by Lead_Actor_Actress
order by 2 desc limit 10;

-- 17 Top 10 movies by IMDb rating 
select title, IMDb_Rating  from boxoffice
order by IMDb_Rating desc limit 10;

-- 18 Bottom 10 movies by IMDb rating 
select title, IMDb_Rating  from boxoffice
order by IMDb_Rating  limit 10;

-- 19 Write a query to get 5 longest run time movies 
select title, Runtime_mins  from boxoffice
order by Runtime_mins desc limit 5;

-- 20 Write a query to get 5 shortest run time movies
select title, Runtime_mins  from boxoffice
order by Runtime_mins limit 5;

-- 21 Top7 movies by world wide collection in Bollywood
select title,Industry,Worldwide_Collection_in_Crores from boxoffice
where Industry = "Bollywood"
order by Worldwide_Collection_in_Crores desc limit 7; 

-- 22 Top7 movies by world wide collection in Tollywood
select title,Industry,Worldwide_Collection_in_Crores from boxoffice
where Industry = "Tollywood"
order by Worldwide_Collection_in_Crores desc limit 7; 

-- 23 Top7 movies by world wide collection in Kollywood
select title,Industry,Worldwide_Collection_in_Crores from boxoffice
where Industry = "Kollywood"
order by Worldwide_Collection_in_Crores desc limit 7; 

-- 24 Top7 movies by world wide collection in Sandalwood
select title,Industry,Worldwide_Collection_in_Crores from boxoffice
where Industry = "Sandalwood"
order by Worldwide_Collection_in_Crores desc limit 7; 

-- 25 Top7 movies by world wide collection in Mollywood
select title,Industry,Worldwide_Collection_in_Crores from boxoffice
where Industry = "Mollywood"
order by Worldwide_Collection_in_Crores desc limit 7; 

-- 26 Write query to display industry and verdict wise films count
select Verdict, count(*) as no_of_films from boxoffice
group by Verdict 
order by 2 desc;

-- 27 Write query to get films based on budget in Bollowood
select Title, Budget,Industry from boxoffice
where Industry = "Bollywood"
order by Budget desc;

-- 28 Write query to get films based on budget in Tollywood 
select Title, Budget,Industry from boxoffice
where Industry = "Tollywood"
order by Budget desc;

-- 29 Write query to get films based on budget in Kollywood 
select Title, Budget,Industry from boxoffice
where Industry = "Kollywood"
order by Budget desc;

-- 30 Write query to get films based on budget in Sandalwood
select Title, Budget,Industry from boxoffice
where Industry = "Sandalwood"
order by Budget desc;

-- 31 Write query to get films based on budget in Mollywood
select Title, Budget,Industry from boxoffice
where Industry = "Mollywood"
order by Budget desc;

-- 32 Top 5 movies by IMDb rating from Bollowood 
select title, IMDb_Rating from boxoffice
where Industry = "Bollywood"
order by IMDb_Rating desc limit 5;

-- 33 Top 5 movies by IMDb rating from Kollywood 
select title, IMDb_Rating from boxoffice
where Industry = "Kollywood"
order by IMDb_Rating desc limit 5;

-- 34 Top 5 movies by IMDb rating from Tollywood 
select title, IMDb_Rating from boxoffice
where Industry = "Tollywood"
order by IMDb_Rating desc limit 5;

-- 35 Top 5 movies by IMDb rating from Sandalwood
select title, IMDb_Rating from boxoffice
where Industry = "Sandalwood"
order by IMDb_Rating desc limit 5;

-- 36 Top 5 movies by IMDb rating from Mollywood 
select title, IMDb_Rating from boxoffice
where Industry = "Mollywood"
order by IMDb_Rating desc limit 5;

-- 37 Write a query to get language wise budget? 
select l.Language, count(b.LanguageID) as no_of_films,sum(budget) as total_budget from boxoffice b
inner join language l on l.languageID = b.LanguageID
group by l.language;

-- 38 Write a query to get language wise how many directors are there?
select l.language, count(distinct d.director) no_of_directors from boxoffice b 
inner join language l on l.LanguageID = b.LanguageID
inner join director d on d.DirectorID = b.DirectorID
group by l.Language; 

-- 39 Write a query to get language wise worldwide total collection ? 
select l.Language, round(sum(Worldwide_Collection_in_Crores),2) as total_WW_Collcetion from boxoffice b
inner join language l on l.languageID = b.LanguageID
group by l.language
order by 2 desc;

-- 40 Write a query to get language, lead actor/actress wise films they acted? 
select l.Language, b.Lead_Actor_Actress, count(Lead_Actor_Actress) as no_of_fillms from boxoffice b
inner join language l on l.languageID = b.LanguageID
group by b.Lead_Actor_Actress,l.Language
order by 3 desc;

-- 41 Write a query to get language, year wise films released? 
select l.Language, substr(b.Release_Date,7,4) as Yr,count(FilmID) as no_of_films from boxoffice b
inner join language l on l.languageID = b.LanguageID
group by 1,2 order by 3 DESC;

-- 42 Write a query to get films which was not released on overseas?
select title, Overseas_Collection from boxoffice
where Overseas_Collection = 0;

-- 43 Write a query to get language wise top 3 longest runtime moves?
select * from(select l.language, b.Runtime_mins,
row_number() over(partition by l.language order by b.Runtime_mins desc) as rnk 
from boxoffice b inner join language l on l.LanguageID = b.LanguageID
)a where rnk <= 3; 

-- 44 Write a query to get language wise bottom 5 shortest runtime moves? 
select * from (select l.language, b.Runtime_mins, 
row_number() over(partition by l.language order by b.Runtime_mins ) as rnk
from boxoffice b inner join language l on l.LanguageID = b.LanguageID)a 
where rnk <=3;

-- 45 Write a query to get language wise top 5 films based first day collections?
select * from (select title, language,fday_collection, row_number() 
over (partition by language order by fday_collection desc )as rnk from 
(select title,l.language, sum(b.First_Day_Collection_Worldwide) as fday_collection from boxoffice b
inner join language l on l.LanguageID = b.LanguageID
group by l.Language,title
order by 3 desc) a)b where rnk <= 5;

-- 46 Write a query to get language wise top 5 films based India gross collections?
select * from (select title, language, IND_GC, row_number()
over(partition by language order by IND_GC desc) as rnk from 
(select b.title, l.language,sum(b.india_gross_collection) as IND_GC from boxoffice b
inner join language l on l.LanguageID = b.LanguageID
group by language, b.title
order by 3 desc)a ) b where rnk <= 5;

-- 47 Write a query to get language, Director wise films count? 
select l.language, d.Director,count(b.title) as tota_films from boxoffice b
inner join language l on l.LanguageID = b.LanguageID
inner join director d on d.DirectorID = b.DirectorID
group by l.Language, d.Director;

-- 48 Write a query to get language wise OTT platofrm wise fims count? 
select l.language,b.OTT_Platform,count(b.title) as tota_films from boxoffice b
inner join language l on l.LanguageID = b.LanguageID
group by l.Language, b.OTT_Platform order by 3 desc;

-- 49 What are top 10 fimns based language and first day collection?
select * from (select language, title, fd_collection, row_number() 
over(partition by language order by fd_collection desc)as rnk
from (select l.language,b.title, sum(b.First_Day_Collection_Worldwide) as fd_collection from boxoffice b 
inner join language l on l.LanguageID = b.LanguageID
group by l.language,b.title order by 3 desc)a)b where rnk <=10;

-- 50 Write a query to get director wise number of fims released in from year 2017 to 2019
select d.director, count(b.title) as no_of_films_17_19 from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
where substr(b.Release_Date,7,4) in(2017,2019)
group by d.Director order by 2 Desc;

-- 51 Write a query to get director wise world wide collections? 
select d.Director, sum(b.Worldwide_Collection_in_Crores) as WWC from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
group by d.Director order by 2 desc;

-- 52 Write a query to get director wise first day world wide collections? 
select d.Director, sum(b.First_Day_Collection_Worldwide) as FDCW from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
group by d.Director order by 2 desc;

-- 53 Write a query to get director wise India gross collections?
select d.Director, sum(b.India_Gross_Collection) as IGC from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
group by d.Director order by 2 desc;

-- 54 Write a query to get director wise overseas collections? 
select d.Director, sum(b.Overseas_Collection) as OC from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
group by d.Director order by 2 desc;

-- 55 Write a query to get director, lead actor/actress and number of films?
select d.Director, b.Lead_Actor_Actress,count(b.Lead_Actor_Actress) as L_Actor from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
group by d.Director,b.Lead_Actor_Actress order by 3 desc;

-- 56 Write a query to get films which is having budget on between 150 crores and 277 crores? 
select title, budget from boxoffice 
where Budget between 150 and 277 order by 2 desc;

-- 57 Write a query to get director, week name wise films released? 
select d.Director,b.Week_Name, count(b.DirectorID) as no_films from boxoffice b 
inner join director d on d.DirectorID = b.DirectorID
group by d.Director, b.Week_Name order by 3 desc; 

-- 58 Write a query to get OTT platofrm and director wise films released? 
select d.Director,b.OTT_Platform, count(b.DirectorID) as no_films from boxoffice b 
inner join director d on d.DirectorID = b.DirectorID
group by d.Director, b.OTT_Platform order by 3 desc; 

-- 59 Write a query to get director wise films released on Friday only? 
select d.Director,b.Week_Name, count(b.DirectorID) as no_films from boxoffice b 
inner join director d on d.DirectorID = b.DirectorID
where b.Week_Name = "Friday"
group by d.Director, b.Week_Name order by 3 desc;

-- 60 Write a query to get films based on IMDb reating between 6.5 and 7.7?
select title, IMDb_rating from boxoffice
where IMDb_Rating between 6.5 and 7.7 order by 2 desc;

-- 61 Write a query to get director,films and IMDb ratings? 
select d.director,b.title, b.IMDb_rating from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
order by 3 desc;

-- 62 Write a query to get films with highest budget based flop verdict? 
select title,Budget,Verdict from boxoffice
where Verdict = "Flop" order by Budget desc;

-- 63 Write a query to get total number of directors? 
select count(*) total_directors from director; 

-- 64 Write a query to get vedridct wise total films released? 
select Verdict, count(Verdict) as No_of_films from boxoffice
group by Verdict order by 2 desc;

-- 65 Write a query to get top 10 directors based number of films? 
select d.director,count(b.DirectorID) as total_films from boxoffice b 
inner join director d on d.DirectorID = b.DirectorID
group by d.director order by 2 desc;

-- 66 Write a query to get top 5 directors based on world wide collections and also industry wise? 
select * from(select Director,Industry,WWC,row_number() 
over(partition by Industry order by WWC desc) as rnk
from (select d.director,b.Industry, sum(b.Worldwide_Collection_in_Crores) as WWC from boxoffice b 
inner join director d on d.DirectorID = b.DirectorID
group by d.Director,b.Industry order by 3 desc)a)b where rnk <=5;

-- 67 Write a query to get top 3 directors based on India gross collections in Bollowood industry?
select * from(select Director,Industry,IGC,row_number() 
over(partition by Industry order by IGC desc) as rnk 
from (select d.Director,b.industry,sum(b.India_Gross_Collection) as IGC from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
where b.Industry = "Bollywood"
group by d.Director,b.Industry order by 3 desc)a)b where rnk <= 3;

-- 68 Write a query to get top 3 directors based on India gross collections in Tollowood industry? 
select * from(select Director,Industry,IGC,row_number()
over(partition by Industry order by IGC desc) as rnk 
from (select d.Director,b.industry,sum(b.India_Gross_Collection) as IGC from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
where b.Industry = "Tollywood"
group by d.Director,b.Industry order by 3 desc)a)b where rnk <= 3;

-- 69 Write a query to get top 3 directors based on India gross collections in Kollowood industry?
select * from(select Director,Industry,IGC,row_number() 
over(partition by Industry order by IGC desc) as rnk 
from (select d.Director,b.industry,sum(b.India_Gross_Collection) as IGC from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
where b.Industry = "Kollywood"
group by d.Director,b.Industry order by 3 desc)a)b where rnk <= 3;

-- 70 Write a query to get top 3 directors based on India gross collections in Mollowood industry? 
select * from(select Director,Industry,IGC,row_number() 
over(partition by Industry order by IGC desc) as rnk 
from (select d.Director,b.industry,sum(b.India_Gross_Collection) as IGC from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
where b.Industry = "Mollywood"
group by d.Director,b.Industry order by 3 desc)a)b where rnk <= 3;

-- 71 Write a query to get top 3 directors based on India gross collections in Sandalwood industry?
select * from(select Director,Industry,IGC,row_number() 
over(partition by Industry order by IGC desc) as rnk 
from (select d.Director,b.industry,sum(b.India_Gross_Collection) as IGC from boxoffice b
inner join director d on d.DirectorID = b.DirectorID
where b.Industry = "Sandalwood"
group by d.Director,b.Industry order by 3 desc)a)b where rnk <= 3;

-- 72 Write to get total number of generes? 
select count(*) as total_genres from genre;

-- 73 Write query to get director,language,genere films count?
select l.language,d.Director,g.Genre,count(b.filmID) total_films from boxoffice b
inner join language l on l.LanguageID = b.LanguageID
inner join director d on d.DirectorID = b.DirectorID
inner join genre g on g.GenreID = b.GenreID
group by d.Director, l.Language,g.Genre order by 4 desc;

-- 74 Write a query to genere wise budget? 
select g.genre,sum(b.Budget) as Total_Budget from boxoffice b
inner join genre g on g.GenreID = b.GenreID
group by g.Genre order by 2 desc;

-- 75 Write a query to get genere wise first day worldwide collections? 
select g.Genre,sum(b.First_Day_Collection_Worldwide) as FDCWW from boxoffice b
inner join genre g on g.GenreID = b.GenreID
group by g.Genre order by 2 desc;

-- 76 Write a query to get genere wise overseas collections? 
select g.Genre,sum(b.Overseas_Collection) as OC from boxoffice b
inner join genre g on g.GenreID = b.GenreID
group by g.Genre order by 2 desc;

-- 77 Write a query to get genere wise India gross collections?
select g.Genre,sum(b.India_Gross_Collection) as IGC from boxoffice b
inner join genre g on g.GenreID = b.GenreID
group by g.Genre order by 2 desc;

-- 78 Write a query to get genere wise top 2 longest run time movies
select b.title, g.genre,b.Runtime_mins from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
order by Runtime_mins desc limit 2;

-- 79 Write a query to get genere wise bottom shortest runtime movies?
select b.title, g.genre,b.Runtime_mins from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
order by Runtime_mins limit 2;

-- 80 Write a query to get verdict, genere wise films released?
select g.genre,b.Verdict,count(b.Verdict) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
group by g.genre,b.Verdict order by 3 desc;

-- 81 Write a query to get genere, OTT platform wise films count?
select g.genre,b.OTT_Platform,count(b.OTT_Platform) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
group by g.genre,b.OTT_Platform order by 3 desc;

-- 82 Write a query to get genere wise films count?
select g.genre,count(b.FilmID) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
group by g.genre order by 2 desc;

-- 83 Write a query to get genere wise films count in Tollywood Industry? 
select g.genre,b.Industry,count(b.FilmID) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
where Industry = "Tollywood"
group by g.genre,b.Industry order by 3 desc;

-- 84 Write a query to get genere wise films count in Kollowood Industry?
select g.genre,b.Industry,count(b.FilmID) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
where Industry = "Kollywood"
group by g.genre,b.Industry order by 3 desc;

-- 85 Write a query to get genere wise films count in Mollowood Industry?
select g.genre,b.Industry,count(b.FilmID) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
where Industry = "Mollywood"
group by g.genre,b.Industry order by 3 desc;

-- 86 Write a query to get genere wise films count in Bollowood Industry?
select g.genre,b.Industry,count(b.FilmID) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
where Industry = "Bollywood"
group by g.genre,b.Industry order by 3 desc; 

-- 87 Write a query to get genere wise films count in Sandalwood Industry?
select g.genre,b.Industry,count(b.FilmID) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
where Industry = "Sandalwood"
group by g.genre,b.Industry order by 3 desc;

-- 88 Write a query to get lead actors/actress wise,genere and films count?
select b.Lead_Actor_Actress ,g.genre,count(b.FilmID) as total_films from boxoffice b 
inner join genre g on g.GenreID = b.GenreID
group by g.genre,b.Lead_Actor_Actress order by 3 desc;

-- 89 Write a query to get 5th rank movie based on Worldwide total collections? 
with cte as (select title,Worldwide_Collection_in_Crores,
row_number() over(order by Worldwide_Collection_in_Crores desc) as rnk from boxoffice)
select *  from cte where rnk = 3;

-- 90 Write a query to get 5th rank movie by industry wise based on First day worldwide collections?
with cte as (select title,Industry,First_Day_Collection_Worldwide,row_number()
over(partition by Industry order by First_Day_Collection_Worldwide desc) as rnk from boxoffice)
select * from cte where rnk = 1;

-- 91 Write a query to get 3rd rank movie by industry wise based on IMDb Ratings? 
with cte as (select title,industry,IMDb_Rating,row_number() 
over(partition by industry order by IMDb_rating desc) as rnk from boxoffice)
select * from cte where rnk = 3;

-- 92 Write a stored procedure to get top 5 films based on India gross colelctions?
select * from boxoffice; 
drop procedure if exists gettop5filmsOnIGC;
delimiter %% 
create procedure gettop5filmsOnIGC()
begin
select title,India_Gross_Collection from boxoffice
order by India_Gross_Collection desc limit 5;
end;
%%


-- 93 Write a stored procdure to get industry Budget and Worldwide total collections? If
-- we call any industry it will display industry,budget and wordwide total 
delimiter %%
create procedure IndustryBudgetWWC(
in Ind_ty  varchar(25) )
begin
select Industry,sum(Budget) as total_Budget,
sum(Worldwide_Collection_in_Crores) as WWC from boxoffice
where Industry = Ind_ty
group by Industry
order by 2 desc;
end; 
%%
call IndustryBudgetWWC('Tollywood');

-- 94 Calculate YoY% Budget growth?
select Yr,Total_Budget,((Total_Budget-P_Budget)/P_Budget)*100 as YOY_BudgetGrowth from 
(select yr,Total_Budget,lag(Total_Budget) over(order by Yr) as P_Budget from
(select right(release_Date,4) as Yr,sum(Budget) as Total_Budget from boxoffice
group by yr order by yr)a)b;

-- 95 Calculate YoY% Worldwide total collelctions growth? 
select Yr, Total_WWC,round(((Total_WWC-P_Total_WWC)/P_Total_WWC)*100,2)  as YoY_WWC_Growth from
(select Yr,Total_WWC,lag(Total_WWC) over(order by Yr) as P_total_WWC from
(select right(Release_Date,4) as Yr,round(sum(Worldwide_Collection_in_Crores),2) as Total_WWC from boxoffice
group by Yr order by Yr)a)b;


-- 96 Calculate YoY% Indian Gross colelctions growth?
select Yr,Total_IGC,round(((Total_IGC-P_Total_IGC)/P_Total_IGC)*100,2) as YoY_IGC_Growth from 
(select Yr,Total_IGC,lag(Total_IGC) over(Order by Yr) as P_Total_IGC from
(select substr(Release_Date,7,4) as Yr,round(sum(India_Gross_Collection),2) as Total_IGC from boxoffice
group by Yr order by Yr)a)b;

-- 97 Create a stored procedure to get Total films count, world wide total colelctions?
delimiter %% 
create procedure films_totalcollection()
begin
select count(filmID) as Total_films,
sum(Worldwide_Collection_in_Crores) as WWC from boxoffice;
end;
%%
call films_totalcollection();
 

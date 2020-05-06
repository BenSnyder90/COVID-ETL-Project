SELECT * FROM final_covid_stats WHERE state = 'OH';

SELECT date, state, pct_tested FROM final_covid_stats WHERE date = '20200421';

SELECT name, date, positive_tests, death FROM final_covid_stats WHERE state = 'OH' OR state = 'NY';
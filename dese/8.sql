SELECT 
    districts.name AS district_name,
    SUM(expenditures.pupils) AS total_pupils
FROM 
    districts
JOIN 
    expenditures
ON 
    districts.id = expenditures.district_id
GROUP BY 
    districts.name
ORDER BY 
    total_pupils DESC, district_name ASC;

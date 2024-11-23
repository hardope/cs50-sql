WITH AverageValues AS (
    SELECT 
        AVG(expenditures.per_pupil_expenditure) AS avg_per_pupil_expend,
        AVG(CASE 
            WHEN staff_evaluations.evaluated > 0 
            THEN (staff_evaluations.exemplary * 100.0 / staff_evaluations.evaluated)
            ELSE 0 
        END) AS avg_exemplary_percentage
    FROM 
        expenditures
    JOIN 
        staff_evaluations ON expenditures.district_id = staff_evaluations.district_id
),
DistrictStats AS (
    SELECT 
        districts.name AS district_name,
        ROUND(expenditures.per_pupil_expenditure, 2) AS per_pupil_expenditure,
        ROUND(
            CASE 
                WHEN staff_evaluations.evaluated > 0 
                THEN (staff_evaluations.exemplary * 100.0 / staff_evaluations.evaluated)
                ELSE 0 
            END, 1
        ) AS exemplary_percentage
    FROM 
        districts
    JOIN 
        expenditures ON districts.id = expenditures.district_id
    JOIN 
        staff_evaluations ON districts.id = staff_evaluations.district_id
    WHERE 
        districts.state = "MA"
)
SELECT 
    district_name,
    per_pupil_expenditure,
    exemplary_percentage
FROM 
    DistrictStats, AverageValues
WHERE 
    per_pupil_expenditure > AverageValues.avg_per_pupil_expend
    AND exemplary_percentage > AverageValues.avg_exemplary_percentage
ORDER BY 
    exemplary_percentage DESC,
    per_pupil_expenditure DESC;

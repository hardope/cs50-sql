SELECT schools.name AS school_name, expenditures.per_pupil_expenditure as per_pupil_expen, graduation_rates.graduated AS grad_rates FROM schools JOIN expenditures ON schools.district_id = expenditures.district_id JOIN graduation_rates ON schools.id = graduation_rates.school_id ORDER BY per_pupil_expen DESC, school_name
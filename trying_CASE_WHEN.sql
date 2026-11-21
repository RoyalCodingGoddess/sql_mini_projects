SELECT first_name, last_name, date_of_birth,
CASE WHEN date_of_birth > '1990-01-01' THEN 'Born after 1990' 
WHEN date_of_birth > '1960-01-01' THEN 'Born 1960-1990'
ELSE 'Born before 1960'
END AS age_group
FROM patients
ORDER BY date_of_birth DESC;

SELECT r.region_name, sr.rep_name, a.account_name 
FROM regions r
JOIN sales_reps sr ON r.region_id = sr.region_id
JOIN accounts a ON sr.rep_id = a.rep_id
ORDER BY a.account_name ASC;

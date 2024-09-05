SELECT company_name 
FROM companies 
WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
  AND (primary_contact ILIKE '%ana%' OR primary_contact ILIKE '%Ana%')
  AND primary_contact NOT ILIKE '%eana%';

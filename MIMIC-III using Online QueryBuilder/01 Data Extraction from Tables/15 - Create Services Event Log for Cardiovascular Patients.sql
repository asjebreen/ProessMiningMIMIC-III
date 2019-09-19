SELECT
  services.subject_id, 
  services.hadm_id,  
  'services' AS category,
  services.curr_service AS activity, 
  services.transfertime AS charttime
FROM 
  mimiciii.services
  INNER JOIN mimiciii.transfers ON services.hadm_id = transfers.hadm_id
  INNER JOIN mimiciii.diagnoses_icd ON services.hadm_id = diagnoses_icd.hadm_id
WHERE 
  transfertime IS NOT NULL AND
  services.curr_service IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY services.subject_id, services.hadm_id, charttime, category, activity;
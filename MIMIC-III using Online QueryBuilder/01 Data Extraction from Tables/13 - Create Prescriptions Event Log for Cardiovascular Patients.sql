SELECT DISTINCT
  prescriptions.subject_id, 
  prescriptions.hadm_id, 
  prescriptions.icustay_id, 
  prescriptions.drug_type AS category, 
  prescriptions.drug AS activity, 
  prescriptions.startdate AS startdate, 
  prescriptions.enddate AS enddate
FROM 
  mimiciii.prescriptions,
  mimiciii.diagnoses_icd
WHERE 
  startdate IS NOT NULL AND
  prescriptions.hadm_id = diagnoses_icd.hadm_id AND
  prescriptions.drug IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY prescriptions.subject_id, prescriptions.hadm_id, prescriptions.icustay_id, startdate, category, activity;
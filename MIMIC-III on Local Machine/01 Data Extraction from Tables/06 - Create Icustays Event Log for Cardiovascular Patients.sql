CREATE TABLE mimiciii.icustays_event_log AS
(SELECT DISTINCT
  icustays.subject_id, 
  icustays.hadm_id, 
  icustays.icustay_id, 
  'ICU in' AS category,
  'ICU in' AS activity,
  icustays.intime AS charttime
FROM 
  mimiciii.icustays,
  mimiciii.diagnoses_icd  
WHERE 
  icustays.intime IS NOT NULL AND
  icustays.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
UNION ALL
SELECT DISTINCT
  icustays.subject_id, 
  icustays.hadm_id, 
  icustays.icustay_id,
  'ICU out' AS category,
  'ICU out' AS activity, 
  icustays.outtime AS charttime
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.icustays
WHERE 
  icustays.outtime IS NOT NULL AND
  icustays.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%') -- Change the values for different diseases
ORDER BY subject_id, hadm_id, icustay_id, charttime, category, activity;
CREATE TABLE mimiciii.chartevents_event_log AS
SELECT DISTINCT
  chartevents.subject_id, 
  chartevents.hadm_id, 
  chartevents.icustay_id,
  d_items.category AS category, 
  d_items.label AS activity, 
  chartevents.charttime AS charttime,
  caregivers.label AS caregiver
FROM 
  mimiciii.chartevents, 
  mimiciii.d_items, 
  mimiciii.diagnoses_icd,
  mimiciii.caregivers
WHERE 
  chartevents.charttime IS NOT NULL AND
  chartevents.hadm_id = diagnoses_icd.hadm_id AND  
  d_items.itemid = chartevents.itemid AND
  d_items.label IS NOT NULL AND
  caregivers.cgid = chartevents.cgid AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY subject_id, hadm_id, icustay_id, charttime, category, activity;
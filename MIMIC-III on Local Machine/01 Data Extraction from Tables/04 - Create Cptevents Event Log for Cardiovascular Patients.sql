CREATE TABLE mimiciii.cptevents_event_log AS
WITH result_set_raw AS (
SELECT
  cptevents.subject_id, 
  cptevents.hadm_id,
  transfers.icustay_id,
  cptevents.sectionheader AS category, 
  cptevents.subsectionheader AS activity, 
  cptevents.chartdate AS chartdate
FROM 
  mimiciii.cptevents
  INNER JOIN mimiciii.transfers ON cptevents.hadm_id = transfers.hadm_id
  INNER JOIN mimiciii.diagnoses_icd ON cptevents.hadm_id = diagnoses_icd.hadm_id
WHERE 
  cptevents.chartdate IS NOT NULL AND
  cptevents.subsectionheader IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY cptevents.subject_id, cptevents.hadm_id, transfers.icustay_id, chartdate, category, activity
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id, result_set_raw.chartdate, result_set_raw.category, result_set_raw.activity
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id, result_set_unordered.charttime, result_set_unordered.category, result_set_unordered.activity;
CREATE TABLE mimiciii.noteevents_event_log AS
WITH result_set_raw AS (
SELECT
  noteevents.subject_id, 
  noteevents.hadm_id, 
  transfers.icustay_id,
  noteevents.category AS category, 
  noteevents.description AS activity,
  noteevents.charttime AS charttime,
  caregivers.label AS caregiver
FROM 
  mimiciii.caregivers, mimiciii.noteevents
  INNER JOIN mimiciii.transfers ON noteevents.hadm_id = transfers.hadm_id
  INNER JOIN mimiciii.diagnoses_icd ON noteevents.hadm_id = diagnoses_icd.hadm_id
WHERE 
  charttime IS NOT NULL AND
  noteevents.description IS NOT NULL AND
  caregivers.cgid = noteevents.cgid AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY noteevents.subject_id, noteevents.hadm_id, transfers.icustay_id, charttime, category, activity
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.subject_id, result_set_raw.hadm_id, result_set_raw.charttime, result_set_raw.category, result_set_raw.activity)
*
FROM result_set_raw
ORDER BY result_set_raw.subject_id, result_set_raw.hadm_id, result_set_raw.charttime, result_set_raw.category, result_set_raw.activity, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id, result_set_unordered.charttime, result_set_unordered.category, result_set_unordered.activity;
SELECT
  labevents.subject_id, 
  labevents.hadm_id, 
  d_labitems.category AS category, 
  d_labitems.label AS activity,
  labevents.charttime AS charttime
FROM 
  mimiciii.labevents,
  mimiciii.d_labitems, 
  mimiciii.diagnoses_icd 
WHERE 
  charttime IS NOT NULL AND
  labevents.hadm_id = diagnoses_icd.hadm_id AND
  labevents.itemid = d_labitems.itemid AND
  d_labitems.label IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY labevents.subject_id, labevents.hadm_id, charttime, category, activity;
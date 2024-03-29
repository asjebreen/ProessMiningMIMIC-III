SELECT DISTINCT
  outputevents.subject_id, 
  outputevents.hadm_id, 
  outputevents.icustay_id,
  d_items.category AS category, 
  d_items.label AS activity,
  outputevents.charttime AS charttime,
  caregivers.label AS caregiver
FROM 
  mimiciii.outputevents,
  mimiciii.d_items,
  mimiciii.diagnoses_icd,
  mimiciii.caregivers 
WHERE 
  charttime IS NOT NULL AND
  outputevents.hadm_id = diagnoses_icd.hadm_id AND
  outputevents.itemid = d_items.itemid AND
  d_items.label IS NOT NULL AND
  outputevents.cgid = caregivers.cgid AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY outputevents.subject_id, outputevents.hadm_id, outputevents.icustay_id, charttime, category, activity;
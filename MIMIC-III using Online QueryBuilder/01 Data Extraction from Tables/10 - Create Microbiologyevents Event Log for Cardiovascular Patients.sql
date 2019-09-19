SELECT
  microbiologyevents.subject_id, 
  microbiologyevents.hadm_id, 
  d_items.category AS category, 
  d_items.label AS activity,
  microbiologyevents.charttime AS charttime
FROM 
  mimiciii.microbiologyevents,
  mimiciii.d_items,
  mimiciii.diagnoses_icd
WHERE 
  charttime IS NOT NULL AND
  microbiologyevents.hadm_id = diagnoses_icd.hadm_id AND
  microbiologyevents.spec_itemid = d_items.itemid AND
  d_items.label IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY microbiologyevents.subject_id, microbiologyevents.hadm_id, charttime, category, activity;
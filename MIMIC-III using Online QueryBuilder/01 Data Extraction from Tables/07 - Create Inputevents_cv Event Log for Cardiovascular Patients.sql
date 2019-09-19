SELECT DISTINCT 
  inputevents_cv.subject_id, 
  inputevents_cv.hadm_id, 
  inputevents_cv.icustay_id, 
  d_items.category As category, 
  d_items.label AS activity, 
  inputevents_cv.charttime AS charttime, 
  caregivers.label AS caregiver
FROM 
  mimiciii.inputevents_cv,
  mimiciii.d_items,
  mimiciii.diagnoses_icd,
  mimiciii.caregivers
WHERE 
  inputevents_cv.hadm_id = diagnoses_icd.hadm_id AND
  inputevents_cv.itemid = d_items.itemid AND
  inputevents_cv.cgid = caregivers.cgid AND
  d_items.label IS NOT NULL AND
  charttime IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY subject_id, hadm_id, icustay_id, charttime, category, activity;
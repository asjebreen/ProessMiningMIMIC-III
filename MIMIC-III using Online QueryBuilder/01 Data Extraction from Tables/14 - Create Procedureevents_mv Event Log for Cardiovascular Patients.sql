SELECT DISTINCT
  procedureevents_mv.subject_id, 
  procedureevents_mv.hadm_id, 
  procedureevents_mv.icustay_id, 
  d_items.category AS category, 
  d_items.label AS activity,
  procedureevents_mv.starttime AS starttime, 
  procedureevents_mv.endtime AS endtime, 
  caregivers.label AS caregiver
FROM 
  mimiciii.procedureevents_mv,
  mimiciii.d_items,
  mimiciii.diagnoses_icd,
  mimiciii.caregivers 
WHERE 
  starttime IS NOT NULL AND
  procedureevents_mv.hadm_id = diagnoses_icd.hadm_id AND
  procedureevents_mv.itemid = d_items.itemid AND
  d_items.label IS NOT NULL AND
  procedureevents_mv.cgid = caregivers.cgid AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY procedureevents_mv.subject_id, procedureevents_mv.hadm_id, procedureevents_mv.icustay_id, starttime, category, activity;
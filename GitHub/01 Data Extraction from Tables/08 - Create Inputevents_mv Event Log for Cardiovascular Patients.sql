CREATE TABLE mimiciii.inputevents_mv_event_log AS
SELECT DISTINCT 
  inputevents_mv.subject_id, 
  inputevents_mv.hadm_id, 
  inputevents_mv.icustay_id, 
  d_items.category As category, 
  d_items.label AS activity, 
  inputevents_mv.starttime AS starttime, 
  inputevents_mv.endtime AS endtime, 
  caregivers.label AS caregiver
FROM 
  mimiciii.inputevents_mv,
  mimiciii.d_items,
  mimiciii.diagnoses_icd,
  mimiciii.caregivers
WHERE 
  starttime IS NOT NULL AND
  inputevents_mv.hadm_id = diagnoses_icd.hadm_id AND
  inputevents_mv.itemid = d_items.itemid AND
  d_items.label IS NOT NULL AND
  inputevents_mv.cgid = caregivers.cgid AND  
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY subject_id, hadm_id, icustay_id, starttime, endtime, category, activity;
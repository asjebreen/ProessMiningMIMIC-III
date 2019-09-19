SELECT
  noteevents.subject_id, 
  noteevents.hadm_id, 
  noteevents.category AS category, 
  noteevents.description AS activity,
  noteevents.charttime AS charttime,
  caregivers.label AS caregiver
FROM 
  mimiciii.noteevents,
  mimiciii.caregivers, 
  mimiciii.diagnoses_icd
WHERE 
  charttime IS NOT NULL AND
  noteevents.description IS NOT NULL AND
  noteevents.hadm_id = diagnoses_icd.hadm_id AND
  caregivers.cgid = noteevents.cgid AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY noteevents.subject_id, noteevents.hadm_id,  charttime, category, activity;
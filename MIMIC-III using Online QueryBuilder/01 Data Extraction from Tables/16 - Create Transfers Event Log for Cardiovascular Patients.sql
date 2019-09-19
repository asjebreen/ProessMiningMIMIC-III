SELECT DISTINCT
  transfers.subject_id, 
  transfers.hadm_id, 
  transfers.icustay_id, 
  transfers.eventtype AS category, 
  concat('admitted into ', transfers.curr_careunit) AS activity, 
  transfers.intime AS charttime
FROM 
  mimiciii.transfers,
  mimiciii.diagnoses_icd  
WHERE 
  intime IS NOT NULL AND
  curr_careunit IS NOT NULL AND
  transfers.eventtype = 'admit' AND
  transfers.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
UNION ALL
SELECT DISTINCT
  transfers.subject_id, 
  transfers.hadm_id, 
  transfers.icustay_id, 
  transfers.eventtype AS category, 
  'admitted into hospital' AS activity, 
  transfers.intime AS charttime
FROM 
  mimiciii.transfers,
  mimiciii.diagnoses_icd  
WHERE 
  intime IS NOT NULL AND
  transfers.eventtype = 'admit' AND
  curr_careunit IS NULL AND
  transfers.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
UNION ALL
SELECT DISTINCT
  transfers.subject_id, 
  transfers.hadm_id, 
  transfers.icustay_id, 
  transfers.eventtype AS category, 
  concat('transferred to ', transfers.curr_careunit) AS activity, 
  transfers.intime AS charttime
FROM 
  mimiciii.transfers,
  mimiciii.diagnoses_icd  
WHERE 
  intime IS NOT NULL AND
  curr_careunit IS NOT NULL AND
  transfers.eventtype = 'transfer' AND
  transfers.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
UNION ALL
SELECT DISTINCT
  transfers.subject_id, 
  transfers.hadm_id, 
  transfers.icustay_id, 
  transfers.eventtype AS category, 
  'transferred to a ward' AS activity, 
  transfers.intime AS charttime
FROM 
  mimiciii.transfers,
  mimiciii.diagnoses_icd  
WHERE 
  intime IS NOT NULL AND
  curr_careunit IS NULL AND
  transfers.eventtype = 'transfer' AND
  transfers.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
UNION ALL
SELECT DISTINCT
  transfers.subject_id, 
  transfers.hadm_id, 
  transfers.icustay_id, 
  transfers.eventtype AS category, 
  concat('discharged from ', transfers.prev_careunit) AS activity, 
  transfers.intime AS charttime
FROM 
  mimiciii.transfers,
  mimiciii.diagnoses_icd  
WHERE 
  intime IS NOT NULL AND
  prev_careunit IS NOT NULL AND
  transfers.eventtype = 'discharge' AND
  transfers.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
UNION ALL
SELECT DISTINCT
  transfers.subject_id, 
  transfers.hadm_id, 
  transfers.icustay_id, 
  transfers.eventtype AS category, 
  'discharged from hospital' AS activity, 
  transfers.intime AS charttime
FROM 
  mimiciii.transfers,
  mimiciii.diagnoses_icd  
WHERE 
  intime IS NOT NULL AND
  prev_careunit IS NULL AND
  transfers.eventtype = 'discharge' AND
  transfers.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
ORDER BY subject_id, hadm_id, icustay_id, charttime, category, activity;
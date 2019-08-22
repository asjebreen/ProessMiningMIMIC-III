-- Group 1 --

CREATE TABLE mimiciii.CVD_Heart_event_log AS
(SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log, 
  mimiciii.diagnoses_icd
WHERE
  admissions_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '429%'
UNION ALL
SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log, 
  mimiciii.diagnoses_icd
WHERE
  icustays_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '429%'

UNION ALL
SELECT DISTINCT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  procedureevents_mv_event_log.icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log, 
  mimiciii.diagnoses_icd
WHERE
  procedureevents_mv_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '429%')
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity;

-- GROUP 2 --

CREATE TABLE mimiciii.Cerebrovascular_event_log AS
(SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log, 
  mimiciii.diagnoses_icd
WHERE
  admissions_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '430%' AND '438%'
UNION ALL
SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log, 
  mimiciii.diagnoses_icd
WHERE
  icustays_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '430%' AND '438%'
UNION ALL
SELECT DISTINCT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  procedureevents_mv_event_log.icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log, 
  mimiciii.diagnoses_icd
WHERE
  procedureevents_mv_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '430%' AND '438%')
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity;

-- GROUP 3 --

CREATE TABLE mimiciii.CVD_Vessels_event_log AS
(SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log, 
  mimiciii.diagnoses_icd
WHERE
  admissions_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '440%' AND '456%'
UNION ALL
SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log, 
  mimiciii.diagnoses_icd
WHERE
  icustays_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '440%' AND '456%'
UNION ALL
SELECT DISTINCT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  procedureevents_mv_event_log.icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log, 
  mimiciii.diagnoses_icd
WHERE
  procedureevents_mv_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code BETWEEN '440%' AND '456%')
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity;

-- GROUP 4 --

CREATE TABLE mimiciii.Lymphatic_Vessels_event_log AS
(SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log, 
  mimiciii.diagnoses_icd
WHERE
  admissions_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code LIKE'457%'
UNION ALL
SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log, 
  mimiciii.diagnoses_icd
WHERE
  icustays_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code LIKE'457%'
UNION ALL
SELECT DISTINCT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  procedureevents_mv_event_log.icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log, 
  mimiciii.diagnoses_icd
WHERE
  procedureevents_mv_event_log.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code LIKE'457%')
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity;

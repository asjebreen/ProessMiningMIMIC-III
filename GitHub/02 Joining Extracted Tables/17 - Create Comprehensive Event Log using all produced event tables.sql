CREATE TABLE mimiciii.comprehensive_event_log AS
(SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'admissions' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.admissions_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'callout' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.callout_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'chartevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.chartevents_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'cptevents' AS tablename,
  category,
  activity, 
  chartdate
FROM 
  mimiciii.cptevents_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'datetimeevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.datetimeevents_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'icustays' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.icustays_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'inputevents_cv' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.inputevents_cv_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'inputevents_mv' AS tablename,
  category,
  activity, 
  starttime
FROM 
  mimiciii.inputevents_mv_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'labevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.labevents_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'microbiologyevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.microbiologyevents_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'noteevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.noteevents_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'outputevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.outputevents_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'prescriptions' AS tablename,
  category,
  activity, 
  startdate
FROM 
  mimiciii.prescriptions_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'procedureevents_mv' AS tablename,
  category,
  activity, 
  starttime
FROM 
  mimiciii.procedureevents_mv_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'services' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.services_event_log
UNION ALL
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'transfers' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.transfers_event_log)
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity;
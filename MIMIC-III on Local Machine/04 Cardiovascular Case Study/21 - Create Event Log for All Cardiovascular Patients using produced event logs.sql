CREATE TABLE mimiciii.administrative_main_activities_event_log5 AS
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
  'procedureevents_mv' AS tablename,
  category,
  activity, 
  starttime
FROM 
  mimiciii.procedureevents_mv_event_log)
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity;
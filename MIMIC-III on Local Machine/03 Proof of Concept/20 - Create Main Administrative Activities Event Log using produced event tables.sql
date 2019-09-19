CREATE TABLE mimiciii.administrative_main_activities_event_log1 AS
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
  mimiciii.icustays_event_log)
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity;
CREATE TABLE mimiciii.administrative_activities_event_log AS
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
  mimiciii.transfers_event_log
WHERE
  category = 'transfer')
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity;
CREATE TABLE mimiciii.callout_event_log_create AS
WITH result_set_raw AS (
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      transfers.icustay_id,
      'create callout' AS category,
      'create callout' AS activity,
      callout.createtime AS charttime
    FROM 
      mimiciii.callout
    INNER JOIN mimiciii.transfers ON callout.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON callout.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      callout.createtime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY callout.subject_id, callout.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.callout_event_log_update AS
WITH result_set_raw AS (
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      transfers.icustay_id,
      'update callout' AS category,
      'update callout' AS activity,
      callout.updatetime AS charttime
    FROM 
      mimiciii.callout
    INNER JOIN mimiciii.transfers ON callout.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON callout.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      callout.updatetime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY callout.subject_id, callout.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.callout_event_log_acknowledge  AS
WITH result_set_raw AS (
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      transfers.icustay_id,
      'acknowledge callout' AS category,
      'acknowledge callout' AS activity,
      callout.acknowledgetime AS charttime
    FROM 
      mimiciii.callout
    INNER JOIN mimiciii.transfers ON callout.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON callout.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      callout.acknowledgetime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY callout.subject_id, callout.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.callout_event_log_outcome AS
WITH result_set_raw AS (
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      transfers.icustay_id,
      'outcome callout' AS category,
      'outcome callout' AS activity,
      callout.outcometime AS charttime
    FROM 
      mimiciii.callout
    INNER JOIN mimiciii.transfers ON callout.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON callout.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      callout.outcometime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY callout.subject_id, callout.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.callout_event_log_first_reservation AS
WITH result_set_raw AS (
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      transfers.icustay_id,
      'first reservation' AS category,
      'first reservation' AS activity,
      callout.firstreservationtime AS charttime
    FROM 
      mimiciii.callout
    INNER JOIN mimiciii.transfers ON callout.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON callout.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      callout.firstreservationtime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY callout.subject_id, callout.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.callout_event_log_current_reservation AS
WITH result_set_raw AS (
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      transfers.icustay_id,
      'current reservation' AS category,
      'current reservation' AS activity,
      callout.currentreservationtime AS charttime
    FROM 
      mimiciii.callout
    INNER JOIN mimiciii.transfers ON callout.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON callout.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      callout.currentreservationtime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY callout.subject_id, callout.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

-- joining produced independent admission event tables in one admission event table

CREATE TABLE mimiciii.callout_event_log AS
(SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.callout_event_log_create
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.callout_event_log_update
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.callout_event_log_acknowledge
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.callout_event_log_outcome
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.callout_event_log_first_reservation
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.callout_event_log_current_reservation

 GROUP BY
  subject_id, 
  hadm_id, 
  icustay_id,
  category,
  activity,
  charttime)
 ORDER BY subject_id, hadm_id, icustay_id, charttime, category, activity;

-- delete temporary used independent admission event tables after joining them in one event table

DROP TABLE mimiciii.callout_event_log_create;
DROP TABLE mimiciii.callout_event_log_update;
DROP TABLE mimiciii.callout_event_log_acknowledge;
DROP TABLE mimiciii.callout_event_log_outcome;
DROP TABLE mimiciii.callout_event_log_first_reservation;
DROP TABLE mimiciii.callout_event_log_current_reservation;
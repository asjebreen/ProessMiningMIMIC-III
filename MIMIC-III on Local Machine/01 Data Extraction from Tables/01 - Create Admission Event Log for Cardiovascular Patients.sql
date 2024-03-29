CREATE TABLE mimiciii.admissions_event_log_admission AS
WITH result_set_raw AS (
    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'admission' AS category,
      'admission' AS activity,
      admissions.admittime AS charttime
    FROM 
      mimiciii.admissions
    INNER JOIN mimiciii.transfers ON admissions.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON admissions.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      admissions.admittime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY admissions.subject_id, admissions.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.admissions_event_log_discharge AS
WITH result_set_raw AS (
    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'discharge' AS category,
      'discharge' AS activity,
      admissions.dischtime AS charttime
    FROM 
      mimiciii.admissions
    INNER JOIN mimiciii.transfers ON admissions.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON admissions.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      admissions.dischtime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY admissions.subject_id, admissions.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.admissions_event_log_death AS
WITH result_set_raw AS (
    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'death' AS category,
      'death' AS activity,
      admissions.deathtime AS charttime
    FROM 
      mimiciii.admissions
    INNER JOIN mimiciii.transfers ON admissions.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON admissions.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      admissions.deathtime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY admissions.subject_id, admissions.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.admissions_event_log_edreg AS
WITH result_set_raw AS (
    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'ED Registration' AS category,
      'ED Registration' AS activity,
      admissions.edregtime AS charttime
    FROM 
      mimiciii.admissions
    INNER JOIN mimiciii.transfers ON admissions.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON admissions.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      admissions.edregtime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY admissions.subject_id, admissions.hadm_id, transfers.icustay_id
),
result_set_unordered AS (
SELECT DISTINCT ON (result_set_raw.hadm_id)
*
FROM result_set_raw
ORDER BY  result_set_raw.hadm_id, result_set_raw.subject_id, result_set_raw.icustay_id
)
SELECT * FROM result_set_unordered
ORDER BY  result_set_unordered.subject_id, result_set_unordered.hadm_id, result_set_unordered.icustay_id;

CREATE TABLE mimiciii.admissions_event_log_edout AS
WITH result_set_raw AS (
    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'ED Out' AS category,
      'ED Out' AS activity,
      admissions.edouttime AS charttime
    FROM 
      mimiciii.admissions
    INNER JOIN mimiciii.transfers ON admissions.hadm_id = transfers.hadm_id
    INNER JOIN mimiciii.diagnoses_icd ON admissions.hadm_id = diagnoses_icd.hadm_id
    WHERE 
      admissions.edouttime IS NOT NULL 
      AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
    ORDER BY admissions.subject_id, admissions.hadm_id, transfers.icustay_id
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

CREATE TABLE mimiciii.admissions_event_log AS
(SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.admissions_event_log_admission
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.admissions_event_log_discharge
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.admissions_event_log_death
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.admissions_event_log_edreg
 
 UNION ALL
 SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM
 mimiciii.admissions_event_log_edout
 
 GROUP BY
  subject_id, 
  hadm_id, 
  icustay_id,
  category,
  activity,
  charttime)
 ORDER BY subject_id, hadm_id, icustay_id, charttime, category, activity;

-- delete temporary used independent admission event tables after joining them in one event table

DROP TABLE mimiciii.admissions_event_log_admission;
DROP TABLE mimiciii.admissions_event_log_discharge;
DROP TABLE mimiciii.admissions_event_log_death;
DROP TABLE mimiciii.admissions_event_log_edreg;
DROP TABLE mimiciii.admissions_event_log_edout;

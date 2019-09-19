-- Admissions
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime)
  FROM mimiciii.admissions_event_log;

-- callout
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime)
  FROM mimiciii.callout_event_log;

-- chartevents
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime),
count(distinct caregiver)
  FROM mimiciii.chartevents_event_log;

-- cptevents
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct chartdate)
  FROM mimiciii.cptevents_event_log;

-- datetimeevents
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime),
count(distinct caregiver)
  FROM mimiciii.datetimeevents_event_log;

-- icustays
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime)
  FROM mimiciii.icustays_event_log;

-- inputevents_cv
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime),
count(distinct caregiver)
  FROM mimiciii.inputevents_cv_event_log;

-- inputevents_mv
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct starttime),
count(distinct endtime), count(distinct caregiver)
  FROM mimiciii.inputevents_mv_event_log;

-- labevents
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime)
  FROM mimiciii.labevents_event_log;

-- microbiologyevents
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime)
  FROM mimiciii.microbiologyevents_event_log;

-- noteevents
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime),
count(distinct caregiver)
  FROM mimiciii.noteevents_event_log;

-- outputevents
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime),
count(distinct caregiver)
  FROM mimiciii.outputevents_event_log;

-- prescriptions
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct startdate),
count(distinct enddate)
  FROM mimiciii.prescriptions_event_log;

-- procedureevents_mv
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct starttime),
count(distinct endtime), count(distinct caregiver)
  FROM mimiciii.procedureevents_mv_event_log;

-- services
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime)
  FROM mimiciii.services_event_log;

-- transfers
SELECT count(distinct subject_id), count(distinct hadm_id), count(distinct icustay_id), count(distinct category), count(distinct activity), count(distinct charttime)
  FROM mimiciii.transfers_event_log;
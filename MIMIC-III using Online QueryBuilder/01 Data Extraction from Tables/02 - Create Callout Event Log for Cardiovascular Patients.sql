    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      'create callout' AS category,
      'create callout' AS activity,
      callout.createtime AS charttime
    FROM 
      mimiciii.callout,
	  mimiciii.diagnoses_icd 
    WHERE 
      callout.createtime IS NOT NULL AND
	  callout.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases

UNION ALL

    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      'update callout' AS category,
      'update callout' AS activity,
      callout.updatetime AS charttime
    FROM 
      mimiciii.callout,
	  mimiciii.diagnoses_icd 
    WHERE 
      callout.updatetime IS NOT NULL AND
	  callout.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
	  
UNION ALL
	  
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      'acknowledge callout' AS category,
      'acknowledge callout' AS activity,
      callout.acknowledgetime AS charttime
    FROM 
      mimiciii.callout,
	  mimiciii.diagnoses_icd 
    WHERE 
      callout.acknowledgetime IS NOT NULL AND
	  callout.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
	  
UNION ALL	  
	  
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      'outcome callout' AS category,
      'outcome callout' AS activity,
      callout.outcometime AS charttime
     FROM 
      mimiciii.callout,
	  mimiciii.diagnoses_icd 
    WHERE 
      callout.outcometime IS NOT NULL AND
	  callout.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
	  
UNION ALL	  
	  
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      'first reservation' AS category,
      'first reservation' AS activity,
      callout.firstreservationtime AS charttime
    FROM 
      mimiciii.callout,
	  mimiciii.diagnoses_icd 
    WHERE 
      callout.firstreservationtime IS NOT NULL AND
	  callout.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
	  
UNION ALL	  
	  
    SELECT DISTINCT
      callout.subject_id, 
      callout.hadm_id, 
      'current reservation' AS category,
      'current reservation' AS activity,
      callout.currentreservationtime AS charttime
    FROM 
      mimiciii.callout,
	  mimiciii.diagnoses_icd 
    WHERE  
      callout.currentreservationtime IS NOT NULL AND
	  callout.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '460%' -- Change the values for different diseases
 ORDER BY subject_id, hadm_id, charttime, category, activity;

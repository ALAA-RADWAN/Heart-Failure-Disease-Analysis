SELECT [Age] As Patient_Age /** Years**/

      ,/**Gender M: Male, F: Female**/
	  CASE 
	      WHEN [Sex] = 'M' THEN REPLACE(Sex,'M','Male')
		  ELSE REPLACE(Sex,'F', 'Female') 
	   END As Gender
	   
      ,[ChestPainType] As Chest_Pain_Type
	  /**TA: Typical Angina, ATA: Atypical Angina, NAP: Non-Anginal Pain, ASY: Asymptomatic**/
      
	  ,[RestingBP] As Resting_Blood_Pressure
     
	  ,/**Replace any 0 Value in Cholestrol Column with the AVG of the Column**/
	  -- [Cholestrol]
	  CASE 
	      WHEN [Cholesterol] = 0 THEN 198
		  ELSE Cholesterol
		  END As Cholestrol
	  
	  , /**1: if FastingBS > 120 mg/dl, 0: otherwise**/
	  CASE 
	      WHEN FastingBS = '0' THEN REPLACE(FastingBS,'0','Normal')
		  ELSE REPLACE(FastingBS,'1', 'Diabetic') 
	   END As Fasting_Blood_Suger
		 
	  ,[RestingECG] As Resting_ECG
	  /**ST: having ST-T wave abnormality (T wave inversions and/or ST elevation or depression of > 0.05 mV),
	   LVH: showing probable or definite left ventricular hypertrophy by Estes' criteria**/
      
	  ,[MaxHR] As Maximum_Heart_Rate
	  /**Normal between 60-100**/

      ,/**Exercise_Induced_Angina Y: yes, N: No**/
	  CASE 
	  WHEN[ExerciseAngina]='Y' THEN REPLACE(ExerciseAngina, 'Y', 'Yes')
	  ELSE REPLACE(ExerciseAngina,'N','No') 
	  END As Exercise_Induced_Angina

      ,[Oldpeak]
	  /**= ST [Numeric value measured in depression]**/
      ,[ST_Slope]
      ,CASE 
	      WHEN [HeartDisease] = '0' THEN REPLACE(HeartDisease,'0','Normal')
		  ELSE REPLACE(HeartDisease,'1', 'Patient') 
	   END As Heart_Disease
	 
  FROM [Heart_df].[dbo].[heart]
  ------------------------------------
 /**Here We will Start Studing the relation between Every Feature and Patient with Heart Disease**/
 SELECT
       MAX(Gender) As The_Most_Patients_Gender
      ,AVG(Patient_Age) As The_Average_Patients_Age
	  ,MAX(Chest_Pain_Type) AS The_Most_Chest_Pain_Type
	  ,COUNT(Chest_Pain_Type)  AS the_Count_Chest_Pain_Type
	  
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient'
  GROUP BY Chest_Pain_Type
  ORDER BY The_Average_Patients_Age DESC

  ----------------------------------------------------
  SELECT
	  COUNT(Heart_Disease)  AS the_Count_Patients
	  ,MAX(Fasting_Blood_Suger) AS The_Types_Fasting_Blood_Suger
	  ---,COUNT(Fasting_Blood_Suger)  AS the_Count_Types_Fasting_Blood_Suger
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient' 
  Group By Fasting_Blood_Suger
  ------------------------------------------------------
   SELECT
       COUNT(Heart_Disease)  AS the_Count_Patients
	   ,MAX(ST_Slope) AS The_Most_ST_SLOP_Type
	  ---,COUNT(ST_Slope)  AS the_Count_ST_SLOP_Type
	  
  FROM [Heart_df].[dbo].[Calculationfile]
   WHERE Heart_Disease = 'Patient'
  Group BY ST_Slope
  ORDER BY The_Count_Patients DESC
  
  ------------------------------------------------------
   SELECT
       COUNT(Heart_Disease)  AS The_Count_Patients
	   ,MAX(Oldpeak) AS The_Most_Oldpeak_Number
	 ---,COUNT(Oldpeak)  AS the_Count_Oldpeak_Number
	  
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient'
  Group BY Oldpeak
  ORDER BY The_Count_Patients DESC
   ------------------------------------------------------
   SELECT
       COUNT(Heart_Disease)  AS The_Count_Patients
	   ,MAX(Exercise_induced_Angina) AS The_Most_Exercise_induced_Angina
	   --,COUNT(Exercise_induced_Angina)  AS the_Count_Exercise_induced_Angina
	  
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient' 
  Group BY Exercise_induced_Angina
  ORDER BY The_Count_Patients DESC
    ------------------------------------------------------
   SELECT
        COUNT(Heart_Disease)  AS The_Count_Patients
	   ,MAX(Maximum_Heart_Rate) AS The_Most_Maximum_Heart_Rate
	   --,COUNT(Maximum_Heart_Rate)  AS the_Count_Maximum_Heart_Rate
	  
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient' 
  Group BY Maximum_Heart_Rate
  ORDER BY The_Count_Patients DESC
  ------------------------------------------------------
   SELECT
        COUNT(Heart_Disease)  AS The_Count_Patients
	   ,MAX(Resting_ECG) AS The_Most_Resting_ECG
	   --,COUNT(Resting_ECG)  AS the_Count_Resting_ECG
	  
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient' 
  Group BY Resting_ECG
  ORDER BY The_Count_Patients DESC
   ------------------------------------------------------
   SELECT
        COUNT(Heart_Disease)  AS The_Count_Patients
	   ,MAX(Resting_Blood_Pressure) AS The_Maximum_Resting_Blood_Pressure
	   --,COUNT(Resting_Blood_Pressure)  AS the_Count_Resting_Blood_Pressure
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient' 
  Group BY Resting_Blood_Pressure
  ORDER BY The_Count_Patients DESC
   ------------------------------------------------------
   SELECT
        COUNT(Heart_Disease)  AS The_Count_Patients
	   ,MAX(Patient_Age) AS The_Average_Patient_Age
	   --,COUNT(Patient_Age)  AS the_Patient_Age
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient' 
  Group BY Patient_Age
  ORDER BY The_Count_Patients DESC
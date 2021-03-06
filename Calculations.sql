
SELECT
       MAX(Gender) As The_Most_Patients_Gender
      ,AVG(Patient_Age) As The_Average_Patients_Age
	  ,MAX(Chest_Pain_Type) AS The_Most_Chest_Pain_Type
	  ,COUNT(Chest_Pain_Type)  AS the_Count_Chest_Pain_Type
	  
  FROM [Heart_df].[dbo].[Calculationfile]
  GROUP BY Chest_Pain_Type
  ORDER BY The_Average_Patients_Age DESC

  ----------------------------------------------------
  SELECT
	  COUNT(Heart_Disease)  AS the_Count_Patients
	  ,COUNT(Fasting_Blood_Suger) AS The_Number_OFDiabetic
  FROM [Heart_df].[dbo].[Calculationfile]
  WHERE Heart_Disease = 'Patient' AND Fasting_Blood_Suger = 'Diabetic'

  ------------------------------------------------------


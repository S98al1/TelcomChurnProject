SELECT TOP (8000) [customerID]
      ,[gender]
      ,[SeniorCitizen]
      ,[Partner]
      ,[Dependents]
      ,[tenure]
      ,[PhoneService]
      ,[MultipleLines]
      ,[InternetService]
      ,[OnlineSecurity]
      ,[OnlineBackup]
      ,[DeviceProtection]
      ,[TechSupport]
      ,[StreamingTV]
      ,[StreamingMovies]
      ,[Contract]
      ,[PaperlessBilling]
      ,[PaymentMethod]
      ,[MonthlyCharges]
      ,[TotalCharges]
      ,[Churn]
  FROM [telcomchurn].[dbo].[TelcoCustomerChurn];


  USE telcomchurn;
GO


  DROP VIEW IF EXISTS churn_cleaned;
GO




CREATE OR ALTER VIEW churn_cleaned AS
SELECT
    CustomerID,
    Gender,

    
    CASE 
        WHEN SeniorCitizen = 1 THEN 'Yes'
        ELSE 'No'
    END AS IsSenior,

    Partner,
    Dependents,
    Tenure,
    PhoneService,
    InternetService,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,

    
    CASE 
        WHEN LTRIM(RTRIM(TotalCharges)) = '' THEN NULL
        ELSE TRY_CAST(TotalCharges AS DECIMAL(10, 2))
    END AS TotalChargesCleaned,

   
    Churn

FROM TelcoCustomerChurn;

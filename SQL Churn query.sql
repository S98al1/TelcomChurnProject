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
  FROM [telcomchurn].[dbo].[TelcoCustomerChurn]






  CREATE OR ALTER VIEW churn_cleaned AS
SELECT
    CustomerID,
    Gender,

    -- Convert SeniorCitizen to 1/0 (Boolean-like)
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

    -- Clean TotalCharges (may be empty strings or whitespace)
    CASE 
        WHEN LTRIM(RTRIM(TotalCharges)) = '' THEN NULL
        ELSE TRY_CAST(TotalCharges AS DECIMAL(10, 2))
    END AS TotalChargesCleaned

FROM TelcoCustomerChurn;

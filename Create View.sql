-- Make sure you're in the correct database context
USE [Datamart]; 
GO

-- Cleaned and transformed view creation
ALTER VIEW [dbo].[SAP_AFFW_Cleaned_View] AS
SELECT 
    IDX,
    WEBLNR,
    WEBLPOS,
    CONVERT(VARCHAR(10), ERSDA, 105) AS ERSDA_Formatted,  -- Converts to dd-mm-yyyy
    ISNULL(ERNAM, 'N/A') AS ERNAM,  -- Replaces NULLs with 'N/A'
    ISNULL(MATNR, 'N/A') AS MATNR,  -- Replaces NULLs with 'N/A'
    LTRIM(RTRIM(ISNULL(MAKTX, 'N/A'))) AS MAKTX,  -- Cleans up string field
    WERKS,
    NAME1,
    LGORT,
    LGOBE,
    ISNULL(CHARG, 'N/A') AS CHARG,
    BWART,
    SOBKZ,
    KDAUF,
    KDPOS,
    KDEIN,
    SHKZG,
    ERFMG,
    ERFME,
    AUFNR,
    RSNUM,
    RSPOS,
    AUFPS,
    MSGID,
    STEXT,
    MSGNO,
    TEXT,
    MSGTY,
    MSGV1,
    MSGV2,
    MSGV3,
    MSGV4,
    DISPO,
    CONVERT(VARCHAR(10), FWDAT, 105) AS FWDAT_Formatted,  -- Converts to dd-mm-yyyy
    CONVERT(VARCHAR(10), BUDAT, 105) AS BUDAT_Formatted,  -- Converts to dd-mm-yyyy
    CONVERT(VARCHAR(10), BLDAT, 105) AS BLDAT_Formatted,  -- Converts to dd-mm-yyyy
    ISNULL(BATCH_TYPE, 'N/A') AS BATCH_TYPE,
    ISNULL(LICHA, 'N/A') AS LICHA,
    CONVERT(VARCHAR(8), ERZET, 108) AS ERZET_Clean,  -- Converts time to HH:mm:ss
    CONVERT(VARCHAR(8), FWZET, 108) AS FWZET_Clean,  -- Converts time to HH:mm:ss
    CONVERT(VARCHAR(19), upddte, 120) AS upddte_Formatted -- Format date to yyyy-mm-dd hh:mm:ss
FROM dbo.SAP_AFFW_STG
WHERE [IDX] IS NOT NULL;

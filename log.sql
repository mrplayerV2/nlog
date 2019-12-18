USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_PageList]
	@pgNow INT,
	@pgSize INT 
	
AS
BEGIN
	 SET NOCOUNT ON;
	 
	 SELECT * FROM 
	 (
		SELECT ROW_NUMBER() OVER (ORDER BY ID DESC) AS 'SID',* 
		FROM dbo.N_Nlog WITH (NOLOCK)

	 )t WHERE sid between (@pgNow-1)*@pgSize+1 and @pgNow*@pgSize

	 SELECT count(1) AS 'rdCount',@pgNow AS 'pgNow',@pgSize AS 'pgSize' FROM 
	 (
		SELECT * FROM dbo.N_Nlog WITH (NOLOCK)
	 )t
END

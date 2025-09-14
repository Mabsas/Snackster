
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE ContactSp 
	@Action VARCHAR(10),
	@ContactId INT=NULL,
	@Name VARCHAR(50)=NULL,
	@Email VARCHAR(50)=NULL,
	@Subject VARCHAR(200)=NULL,
	@Message VARCHAR(MAX)=NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	--INSERT
	BEGIN 
	INSERT INTO dbo.Contact(Name, Email,Subject,Message,CreatedDate)
	VALUES (@Name,@Email,@Subject,@Message,GETDATE())
	END

	IF @Action = 'SELECT'
	BEGIN
	  SELECT ROW_NUMBER() OVER(ORDER BY(SELECT 1)) AS [SrNo], * FROM dbo.Contact
	  END

   IF @Action='DELETE'
     BEGIN
	   DELETE FROM dbo.Contact WHERE ContactId=@ContactId
	   END
    

END
GO

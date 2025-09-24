SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE FoodieDB;
GO


IF OBJECT_ID('dbo.Category_Crud', 'P') IS NOT NULL
    DROP PROCEDURE dbo.Category_Crud;
GO

CREATE PROCEDURE dbo.Category_Crud
    @Action VARCHAR(10),
    @CategoryId INT = NULL,
    @Name VARCHAR(100) = NULL,
    @IsActive BIT = 0,
    @ImageUrl VARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- SELECT
    IF @Action = 'SELECT'
    BEGIN
        SELECT * FROM dbo.Categories ORDER BY CreatedDate DESC;
    END

    -- INSERT
    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO dbo.Categories (Name, ImageUrl, IsActive, CreatedDate)
        VALUES (@Name, @ImageUrl, @IsActive, GETDATE());
    END

    -- UPDATE
    IF @Action = 'UPDATE'
    BEGIN
        IF @ImageUrl IS NULL
        BEGIN
            UPDATE dbo.Categories
            SET Name = @Name, IsActive = @IsActive
            WHERE CategoryId = @CategoryId;
        END
        ELSE
        BEGIN
            UPDATE dbo.Categories
            SET Name = @Name, ImageUrl = @ImageUrl, IsActive = @IsActive
            WHERE CategoryId = @CategoryId;
        END
    END

    -- DELETE
    IF @Action = 'DELETE'
    BEGIN
        DELETE FROM dbo.Categories WHERE CategoryId = @CategoryId;
    END

    -- GETBYID
    IF @Action = 'GETBYID'
    BEGIN
        SELECT * FROM dbo.Categories WHERE CategoryId = @CategoryId;
    END
END
GO

CREATE PROCEDURE usp_write_watermark
    @TableName NVARCHAR(100),
    @LastModifiedtime DATETIME
AS
BEGIN
    DELETE FROM watermarktable WHERE TableName = @TableName;
    INSERT INTO watermarktable VALUES (@TableName, @LastModifiedtime);
END
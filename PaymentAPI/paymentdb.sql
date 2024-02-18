IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240218043136_initial')
BEGIN
    CREATE TABLE [PaymentDetails] (
        [PaymentDetailId] int NOT NULL IDENTITY,
        [CardOwnerName] nvarchar(100) NOT NULL,
        [CardNumber] nvarchar(16) NOT NULL,
        [ExpirationDate] nvarchar(5) NOT NULL,
        [SecurityCode] nvarchar(3) NOT NULL,
        CONSTRAINT [PK_PaymentDetails] PRIMARY KEY ([PaymentDetailId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240218043136_initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240218043136_initial', N'7.0.5');
END;
GO

COMMIT;
GO


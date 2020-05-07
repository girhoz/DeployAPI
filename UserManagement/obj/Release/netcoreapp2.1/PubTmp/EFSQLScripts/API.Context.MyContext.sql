IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430223938_addUserApplicationModel')
BEGIN
    CREATE TABLE [TB_M_Application] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_TB_M_Application] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430223938_addUserApplicationModel')
BEGIN
    CREATE TABLE [TB_M_User] (
        [Id] int NOT NULL IDENTITY,
        [Email] nvarchar(max) NULL,
        [Password] nvarchar(max) NULL,
        [App_Type] int NOT NULL,
        CONSTRAINT [PK_TB_M_User] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_TB_M_User_TB_M_Application_App_Type] FOREIGN KEY ([App_Type]) REFERENCES [TB_M_Application] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430223938_addUserApplicationModel')
BEGIN
    CREATE INDEX [IX_TB_M_User_App_Type] ON [TB_M_User] ([App_Type]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430223938_addUserApplicationModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200430223938_addUserApplicationModel', N'2.1.14-servicing-32113');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224021_addRoleModel')
BEGIN
    CREATE TABLE [TB_M_Role] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_TB_M_Role] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224021_addRoleModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200430224021_addRoleModel', N'2.1.14-servicing-32113');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224051_addReligionModel')
BEGIN
    CREATE TABLE [TB_M_Religion] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_TB_M_Religion] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224051_addReligionModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200430224051_addReligionModel', N'2.1.14-servicing-32113');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224117_addBatchModel')
BEGIN
    CREATE TABLE [TB_M_Batch] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_TB_M_Batch] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224117_addBatchModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200430224117_addBatchModel', N'2.1.14-servicing-32113');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224142_addClassModel')
BEGIN
    CREATE TABLE [TB_M_Class] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_TB_M_Class] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224142_addClassModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200430224142_addClassModel', N'2.1.14-servicing-32113');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224220_addUserDetailsModel')
BEGIN
    CREATE TABLE [TB_T_UserDetails] (
        [Id] int NOT NULL,
        [FullName] nvarchar(max) NULL,
        [FirstName] nvarchar(max) NULL,
        [LastName] nvarchar(max) NULL,
        [Address] nvarchar(max) NULL,
        [BirthDate] datetime2 NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [ReligionId] int NULL,
        [BatchId] int NULL,
        [ClassId] int NULL,
        [WorkStatus] bit NOT NULL,
        CONSTRAINT [PK_TB_T_UserDetails] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_TB_T_UserDetails_TB_M_Batch_BatchId] FOREIGN KEY ([BatchId]) REFERENCES [TB_M_Batch] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TB_T_UserDetails_TB_M_Class_ClassId] FOREIGN KEY ([ClassId]) REFERENCES [TB_M_Class] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TB_T_UserDetails_TB_M_User_Id] FOREIGN KEY ([Id]) REFERENCES [TB_M_User] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_TB_T_UserDetails_TB_M_Religion_ReligionId] FOREIGN KEY ([ReligionId]) REFERENCES [TB_M_Religion] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224220_addUserDetailsModel')
BEGIN
    CREATE INDEX [IX_TB_T_UserDetails_BatchId] ON [TB_T_UserDetails] ([BatchId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224220_addUserDetailsModel')
BEGIN
    CREATE INDEX [IX_TB_T_UserDetails_ClassId] ON [TB_T_UserDetails] ([ClassId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224220_addUserDetailsModel')
BEGIN
    CREATE INDEX [IX_TB_T_UserDetails_ReligionId] ON [TB_T_UserDetails] ([ReligionId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224220_addUserDetailsModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200430224220_addUserDetailsModel', N'2.1.14-servicing-32113');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224321_addUserRolesModel')
BEGIN
    CREATE TABLE [TB_T_UserRoles] (
        [User_Id] int NOT NULL,
        [Role_Id] int NOT NULL,
        CONSTRAINT [PK_TB_T_UserRoles] PRIMARY KEY ([User_Id], [Role_Id]),
        CONSTRAINT [FK_TB_T_UserRoles_TB_M_Role_Role_Id] FOREIGN KEY ([Role_Id]) REFERENCES [TB_M_Role] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_TB_T_UserRoles_TB_M_User_User_Id] FOREIGN KEY ([User_Id]) REFERENCES [TB_M_User] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224321_addUserRolesModel')
BEGIN
    CREATE INDEX [IX_TB_T_UserRoles_Role_Id] ON [TB_T_UserRoles] ([Role_Id]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200430224321_addUserRolesModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200430224321_addUserRolesModel', N'2.1.14-servicing-32113');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200504053947_updateUserModel')
BEGIN
    ALTER TABLE [TB_M_User] ADD [FailCount] int NOT NULL DEFAULT 0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200504053947_updateUserModel')
BEGIN
    ALTER TABLE [TB_M_User] ADD [LockoutEnd] datetime2 NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20200504053947_updateUserModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20200504053947_updateUserModel', N'2.1.14-servicing-32113');
END;

GO


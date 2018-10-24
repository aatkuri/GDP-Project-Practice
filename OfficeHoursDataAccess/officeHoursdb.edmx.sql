
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/03/2018 08:39:56
-- Generated from EDMX file: C:\Users\s530490\Desktop\GDP\GDP-Project-Practice\OfficeHoursDataAccess\officeHoursdb.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [OfficeHours];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[officehours_Admin_Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[officehours_Admin_Users];
GO
IF OBJECT_ID(N'[dbo].[officehours_faculty]', 'U') IS NOT NULL
    DROP TABLE [dbo].[officehours_faculty];
GO
IF OBJECT_ID(N'[dbo].[officehours_messages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[officehours_messages];
GO
IF OBJECT_ID(N'[dbo].[officehours_schedule]', 'U') IS NOT NULL
    DROP TABLE [dbo].[officehours_schedule];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'officehours_Admin_Users'
CREATE TABLE [dbo].[officehours_Admin_Users] (
    [Admin_User_Id] int IDENTITY(1,1) NOT NULL,
    [User_Name] nvarchar(50)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [Date_Created] datetime  NULL
);
GO

-- Creating table 'officehours_faculty'
CREATE TABLE [dbo].[officehours_faculty] (
    [member_id] int IDENTITY(1,1) NOT NULL,
    [first_Name] nvarchar(50)  NULL,
    [last_Name] nvarchar(50)  NULL,
    [Password] nvarchar(50)  NULL,
    [Email] nvarchar(50)  NULL,
    [create_date] datetime  NULL,
    [account_status] int  NULL,
    [auth_code] nvarchar(50)  NULL,
    [phone_number] nchar(15)  NULL
);
GO

-- Creating table 'officehours_schedule'
CREATE TABLE [dbo].[officehours_schedule] (
    [schedule_id] bigint IDENTITY(1,1) NOT NULL,
    [faculty_email] varchar(50)  NOT NULL,
    [schedule_note] varchar(2000)  NULL,
    [schedule_start] datetime  NOT NULL,
    [schedule_end] datetime  NOT NULL,
    [schedule_color] varchar(50)  NULL,
    [schedule_group] nvarchar(50)  NULL
);
GO

-- Creating table 'officehours_messages'
CREATE TABLE [dbo].[officehours_messages] (
    [message_id] bigint IDENTITY(1,1) NOT NULL,
    [faculty_mail] nvarchar(50)  NULL,
    [student_id] nvarchar(50)  NULL,
    [student_Name] nvarchar(50)  NULL,
    [message] nvarchar(max)  NULL,
    [Date_Created] datetime  NULL,
    [is_archived] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Admin_User_Id] in table 'officehours_Admin_Users'
ALTER TABLE [dbo].[officehours_Admin_Users]
ADD CONSTRAINT [PK_officehours_Admin_Users]
    PRIMARY KEY CLUSTERED ([Admin_User_Id] ASC);
GO

-- Creating primary key on [member_id] in table 'officehours_faculty'
ALTER TABLE [dbo].[officehours_faculty]
ADD CONSTRAINT [PK_officehours_faculty]
    PRIMARY KEY CLUSTERED ([member_id] ASC);
GO

-- Creating primary key on [schedule_id] in table 'officehours_schedule'
ALTER TABLE [dbo].[officehours_schedule]
ADD CONSTRAINT [PK_officehours_schedule]
    PRIMARY KEY CLUSTERED ([schedule_id] ASC);
GO

-- Creating primary key on [message_id] in table 'officehours_messages'
ALTER TABLE [dbo].[officehours_messages]
ADD CONSTRAINT [PK_officehours_messages]
    PRIMARY KEY CLUSTERED ([message_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
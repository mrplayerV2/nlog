USE [Log]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ThreadID] [int] NOT NULL,
	[MachineName] [varchar](255) NOT NULL,
	[LogName] [varchar](255) NOT NULL,
	[LogLevel] [varchar](5) NOT NULL,
	[LogMessage] [varchar](max) NOT NULL,
	[CallSite] [varchar](1024) NOT NULL,
	[Exception] [varchar](1024) NOT NULL,
	[Stacktrace] [varchar](1024) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[NLog] ADD  DEFAULT (getdate()) FOR [CreateDateTime]
GO



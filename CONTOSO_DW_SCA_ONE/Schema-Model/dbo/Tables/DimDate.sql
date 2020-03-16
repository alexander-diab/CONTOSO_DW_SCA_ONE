CREATE TABLE [dbo].[DimDate]
(
[Datekey] [datetime] NOT NULL,
[FullDateLabel] [nvarchar] (20) NOT NULL,
[DateDescription] [nvarchar] (20) NOT NULL,
[CalendarYear] [int] NOT NULL,
[CalendarYearLabel] [nvarchar] (20) NOT NULL,
[CalendarHalfYear] [int] NOT NULL,
[CalendarHalfYearLabel] [nvarchar] (20) NOT NULL,
[CalendarQuarter] [int] NOT NULL,
[CalendarQuarterLabel] [nvarchar] (20) NULL,
[CalendarMonth] [int] NOT NULL,
[CalendarMonthLabel] [nvarchar] (20) NOT NULL,
[CalendarWeek] [int] NOT NULL,
[CalendarWeekLabel] [nvarchar] (20) NOT NULL,
[CalendarDayOfWeek] [int] NOT NULL,
[CalendarDayOfWeekLabel] [nvarchar] (10) NOT NULL,
[FiscalYear] [int] NOT NULL,
[FiscalYearLabel] [nvarchar] (20) NOT NULL,
[FiscalHalfYear] [int] NOT NULL,
[FiscalHalfYearLabel] [nvarchar] (20) NOT NULL,
[FiscalQuarter] [int] NOT NULL,
[FiscalQuarterLabel] [nvarchar] (20) NOT NULL,
[FiscalMonth] [int] NOT NULL,
[FiscalMonthLabel] [nvarchar] (20) NOT NULL,
[IsWorkDay] [nvarchar] (20) NOT NULL,
[IsHoliday] [int] NOT NULL,
[HolidayName] [nvarchar] (20) NOT NULL,
[EuropeSeason] [nvarchar] (50) NULL,
[NorthAmericaSeason] [nvarchar] (50) NULL,
[AsiaSeason] [nvarchar] (50) NULL
)
GO
ALTER TABLE [dbo].[DimDate] ADD CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY CLUSTERED  ([Datekey])
GO

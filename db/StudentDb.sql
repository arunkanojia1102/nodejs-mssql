CREATE DATABASE [StudentDb]

USE [StudentDb]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 29-08-2023 18:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 29-08-2023 18:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[DisciplineId] [int] IDENTITY(1,1) NOT NULL,
	[DisciplineName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[DisciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 29-08-2023 18:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[FathersName] [nvarchar](200) NOT NULL,
	[MotherName] [nvarchar](200) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[CourseId] [int] NOT NULL,
	[DisciplineId] [int] NOT NULL,
	[EnrollmentNo] [nvarchar](100) NOT NULL,
	[AdmissionDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwStudent]    Script Date: 29-08-2023 18:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwStudent]
AS
SELECT        dbo.Student.StudentId, dbo.Student.FirstName, dbo.Student.LastName, dbo.Student.FathersName, dbo.Student.MotherName, dbo.Student.DateOfBirth, dbo.Course.CourseId, dbo.Course.CourseName, dbo.Discipline.DisciplineId, 
                         dbo.Discipline.DisciplineName, dbo.Student.EnrollmentNo, dbo.Student.AdmissionDate, dbo.Student.IsActive
FROM            dbo.Course INNER JOIN
                         dbo.Student ON dbo.Course.CourseId = dbo.Student.CourseId INNER JOIN
                         dbo.Discipline ON dbo.Student.DisciplineId = dbo.Discipline.DisciplineId
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (1, N'BCA')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (2, N'B.SC.(IT)')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (3, N'B.Tech')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (4, N'B.Pharma')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (5, N'Diploma')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (6, N'MCA')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (7, N'M.Sc.(IT)')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (8, N'M.Tech')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (9, N'M.Pharma')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName]) VALUES (10, N'PGDCA')
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Discipline] ON 
GO
INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName]) VALUES (1, N'CS')
GO
INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName]) VALUES (2, N'IT')
GO
INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName]) VALUES (3, N'Civil')
GO
INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName]) VALUES (4, N'Mechanical')
GO
INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName]) VALUES (5, N'Electronics')
GO
INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName]) VALUES (6, N'Electrical')
GO
INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName]) VALUES (7, N'Others')
GO
SET IDENTITY_INSERT [dbo].[Discipline] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [FathersName], [MotherName], [DateOfBirth], [CourseId], [DisciplineId], [EnrollmentNo], [AdmissionDate], [IsActive]) VALUES (1, N'Amar', N'Kumar', N'Mr. Ajay Kumar', N'Mrs. Sushila', CAST(N'1999-01-01' AS Date), 1, 1, N'100001', CAST(N'2023-06-21' AS Date), 1)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [FathersName], [MotherName], [DateOfBirth], [CourseId], [DisciplineId], [EnrollmentNo], [AdmissionDate], [IsActive]) VALUES (3, N'Babli', N'Bahuguna', N'Mr. Ram Bahuguna', N'Mrs. Komal Bahuguna', CAST(N'2000-05-05' AS Date), 3, 2, N'100002', CAST(N'2023-06-22' AS Date), 1)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [FathersName], [MotherName], [DateOfBirth], [CourseId], [DisciplineId], [EnrollmentNo], [AdmissionDate], [IsActive]) VALUES (4, N'Chandra', N'Prakash', N'Mr. Ram Prakash', N'Mrs. Kamal Prakash', CAST(N'2000-07-05' AS Date), 3, 3, N'100003', CAST(N'2023-07-25' AS Date), 1)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [FathersName], [MotherName], [DateOfBirth], [CourseId], [DisciplineId], [EnrollmentNo], [AdmissionDate], [IsActive]) VALUES (5, N'Deepak', N'Kumar', N'Mrs. Neeraj Kumar', N'Mrs. Reeta Devi', CAST(N'2001-06-05' AS Date), 2, 2, N'100004', CAST(N'2023-08-01' AS Date), 0)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [FathersName], [MotherName], [DateOfBirth], [CourseId], [DisciplineId], [EnrollmentNo], [AdmissionDate], [IsActive]) VALUES (6, N'Farhan', N'Qureshi', N'Mr. Aziz Qureshi', N'Mrs. Nagma Qureshi', CAST(N'2001-12-08' AS Date), 1, 7, N'100005', CAST(N'2021-05-08' AS Date), 0)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [FathersName], [MotherName], [DateOfBirth], [CourseId], [DisciplineId], [EnrollmentNo], [AdmissionDate], [IsActive]) VALUES (7, N'Arun Kumar', N'Kanojia', N'Mr. Hukam Chand Kanojia', N'Mrs Kamlesh Kanojia', CAST(N'1985-02-11' AS Date), 3, 1, N'100006', CAST(N'2022-07-07' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Discipline] FOREIGN KEY([DisciplineId])
REFERENCES [dbo].[Discipline] ([DisciplineId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Discipline]
GO
/****** Object:  StoredProcedure [dbo].[GetStudents]    Script Date: 29-08-2023 18:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudents](
@FirstName nvarchar(200),
@LastName nvarchar(200),
@FathersName nvarchar(200),
@MotherName nvarchar(200),
@CourseId int,
@DisciplineId int,
@EnrollmentNo nvarchar(100),
@DateOfBirthFrom date,
@DateOfBirthUpto date,
@AdmissionDateFrom date,
@AdmissionDateUpto date
)
WITH RECOMPILE
AS
SET NOCOUNT ON
SELECT * FROM vwStudent
WHERE (@FirstName IS NULL OR FirstName LIKE '%' + @FirstName + '%')
AND (@LastName IS NULL OR LastName LIKE '%' +  @LastName + '%')
AND (@FathersName IS NULL OR FathersName LIKE '%' + @FathersName + '%')
AND (@MotherName IS NULL OR MotherName LIKE '%' + @MotherName + '%')
AND (@CourseId IS NULL OR CourseId = @CourseId)
AND (@DisciplineId IS NULL OR DisciplineId = @DisciplineId)
AND (@EnrollmentNo IS NULL OR EnrollmentNo LIKE '%' + @EnrollmentNo + '%')
AND (@DateOfBirthFrom IS NULL OR DateOfBirth >= @DateOfBirthFrom)
AND (@DateOfBirthUpto IS NULL OR DateOfBirth <= @DateOfBirthUpto)
AND (@AdmissionDateFrom IS NULL OR AdmissionDate >= @AdmissionDateFrom)
AND (@AdmissionDateUpto IS NULL OR AdmissionDate <= @AdmissionDateUpto)
ORDER BY EnrollmentNo
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 11
               Left = 335
               Bottom = 122
               Right = 505
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Discipline"
            Begin Extent = 
               Top = 42
               Left = 598
               Bottom = 234
               Right = 770
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 16
               Left = 76
               Bottom = 245
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStudent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStudent'
GO

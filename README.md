# DataBaseAssignement
#First intall a MicroSoft.EntityFrameworkCore.Tools
#Second install a MicroSoft.EntityFrameworkCore.SqlServer
#Third create a data base on your Sql Server Manager and name it like my example "DatabaseFirstAssignment"
#4th open nuget console and write first line
PM> Scaffold-DbContext "Server=DESKTOP-8FGUNU9;Database=DatabaseFirstAssignment;Trusted_Connection=true" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models

if you want to updata a database and models like you do in migration in but in opposit side add flag -Force
PM>Scaffold-DbContext "Server=DESKTOP-8FGUNU9;Database=DatabaseFirstAssignment;Trusted_Connection=true" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -Force

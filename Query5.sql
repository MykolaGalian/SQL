-- 5.���������� ������������ ���������� ������� �������


select sub.ProjectName, DATEDIFF(day, ProjectCreationDate, ProjectFinishDate) as 'Day_DurationOfProject' 
from 
	 (select ProjectName, ProjectCreationDate, ProjectFinishDate
	 from Project 
	 where ProjectFinishDate IS NOT NULL
	 )sub
	 


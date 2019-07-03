create table Position
(
	PositionId int identity(1,1) not null PRIMARY KEY,
	PositionName varchar(50) not null  
);

create table Employee
(
	EmployeeId int identity(1,1) not null PRIMARY KEY,
	EmployeeName varchar(50) not null  
);

create table PositionEmployee
(
	PositionEmployeeId int identity(1,1) not null PRIMARY KEY,
	PositionId  int not null references Position(PositionId ),
	EmployeeId  int not null references Employee(EmployeeId ),
	
);

create table Project
(
	ProjectId int identity(1,1) not null PRIMARY KEY,
	ProjectName varchar(50) not null, 
	ProjectCreationDate date not null,
	ProjectFinishDate date  null,
	ProjectStatus VARCHAR(10) NOT NULL CHECK (ProjectStatus IN('Open', 'Closed'))
	
);

create table TaskStatus
(
	TaskStatusId int identity(1,1) not null PRIMARY KEY,		
	TaskStatusVariant  VARCHAR(10) NOT NULL CHECK (TaskStatusVariant IN('Open', 'Closed','Completed', 'Rework')),
	StatusChangeDate date not null,
	EmployeeId  int not null references Employee(EmployeeId ),
);


create table Task
(
	TaskId int identity(1,1) not null PRIMARY KEY,
	TaskName varchar(50) not null, 
	DeadlineDate date not null,
	ProjectId  int not null references Project(ProjectId ),
	PositionEmployeeId  int not null references PositionEmployee(PositionEmployeeId ),
	TaskStatusId  int not null unique references TaskStatus(TaskStatusId)	
);





use master;
Create Database SummitAI;
drop Database SummitAI;
use SummitAI;

Create Table Account(
	id int identity(1,1) Primary key,
	accountName varchar(100) not null,
	createdDate DateTime not null default(getdate())
);

Insert into Account(accountName) values('SummitAI');
select * from Account;

Create Table Project(
	id int identity(1,1) Primary key,
	projectCode varchar(60) not null Unique,
	projectName varchar(100) not null,
	accountId int not null references Account(Id),
	createdDate DateTime not null default(getdate())
);

Insert into Project(ProjectCode, projectName, accountId) values('Summit_123','Summit_NTP1', 1);
Insert into Project(ProjectCode, projectName, accountId) values('Summit_456','Summit_NTP2', 1);

select * from Project;

Drop table Project;

Create Table TechnicalTrack(
	id int identity(1,1) Primary key,
	name varchar(60) not null,
	projectId int not null references Project(Id),
	createdDate DateTime not null default(getdate())
);

Insert into TechnicalTrack(Name, projectId) values('.NetFullstack',1);
Insert into TechnicalTrack(Name, projectId) values('Angular',1);
Insert into TechnicalTrack(Name, projectId) values('.netCore,SQL',1);

select * from TechnicalTrack;

Create Table ResourceRequirement(
	id int identity(1,1) Primary key,
	requirement int not null,
	trackId int not null references TechnicalTrack(Id),
	projectId int not null references Project(Id),
	createdDate DateTime not null default(getdate())
);

Insert into ResourceRequirement(requirement, TrackId, projectId) values(10,1,1);
Insert into ResourceRequirement(requirement, TrackId, projectId) values(5,2,1);
Insert into ResourceRequirement(requirement, TrackId, projectId) values(4,3,1);

select * from ResourceRequirement;

Create Table InterviewDetails(
	id int identity(1,1) Primary key,
	projectId int not null references Project(Id),
	interviewType varchar(30),
	interviewDate datetime,
	panel varchar(60),
	interviewStatus varchar(30),
	remarks varchar(max),
	createdBy varchar(60) not null,
	createdDate DateTime not null default(getdate()),
	updatedDate DateTime default(null), 
	updatedBy varchar(60),
	updateComments varchar(max)
);

Insert into InterviewDetails(projectId, InterviewType, InterviewDate, interviewStatus, panel, Remarks, CreatedBy) values(1,
	'Client','3/23/2023', 'Selected', 'Kausha', 'Good Knowledge', 'Dwarka Role');
Insert into InterviewDetails(projectId, InterviewType, InterviewDate, interviewStatus, panel, Remarks, CreatedBy) values(1,
	'Client','3/25/2023', 'Rejected', 'Snehal', 'No experience', 'Dwarka Role');
Insert into InterviewDetails(projectId, InterviewType, InterviewDate, interviewStatus, panel, Remarks, CreatedBy) values(1,
	'Client','4/1/2023', 'Selected', 'Ravi', 'Meets the requirement', 'Dwarka Role');
Insert into InterviewDetails(projectId, InterviewType, InterviewDate, interviewStatus, panel, Remarks, CreatedBy) values(1,
	'Client','5/7/2023', 'Rejected', 'Amit', 'No experience', 'Dwarka Role');
Insert into InterviewDetails(projectId, InterviewType, InterviewDate, interviewStatus, panel, Remarks, CreatedBy) values(1,
	'Client','6/10/2023', 'Selected', 'Dwarka', 'Experienced', 'Dwarka Role');
Insert into InterviewDetails(projectId, InterviewType, InterviewDate, interviewStatus, panel, Remarks, CreatedBy) values(1,
	'Client','20/10/2023', 'Rejected', 'Dwarka', 'No working experience', 'Dwarka Role');

Select * from InterviewDetails;

Create Table Candidate(
	id int identity(1,1) Primary key,
	isInternal Bit not null, ---Internal(1) ...External(0)
	employeeId int,
	firstName varchar(30) not null,
	lastName varchar(30) not null,
	email varchar(50) not null,
	mobileNumber varchar(20) not null,
	techTrackId int not null references TechnicalTrack(Id),
	jobTitle varchar(30),
	grade Decimal,
	baseLocation varchar(30),
	skill varchar(max) not null,
	experience Decimal not null,
	lwd Datetime default(null),
	interviewDetailsId int references InterviewDetails(Id),
	createdDate DateTime not null default(getdate()),
	updatedDate DateTime default(null), --update
	isActive Bit default(1), -----For record active(1) or inactive(0)
	createdBy varchar(60) not null,
	updatedBy varchar(60),	--update
	updateComments varchar(max)
);

insert into Candidate(isInternal,employeeId, firstName, lastName, email, mobileNumber, techTrackId, jobTitle, grade, baseLocation,skill, experience, InterviewDetailsId, CreatedBy)
values (1,'12345', 'Joydeep', 'Rana', 'joydeep_rana@abc.com','7615243178', 1,'Software Engineer', '3.1','Pune','.net, Angular',1,1,'Dwarka Role');
insert into Candidate(isInternal,employeeId, firstName, lastName, email, mobileNumber, techTrackId, jobTitle, grade, baseLocation,skill, experience, InterviewDetailsId, CreatedBy)
values (1,'12346', 'Suharta', 'Banerjee', 'suharta@abc.com','7615243179', 2,'Software Engineer', '3.1','Pune','.net, Angular',1,2,'Dwarka Role');
insert into Candidate(isInternal,employeeId, firstName, lastName, email, mobileNumber, techTrackId, jobTitle, grade, baseLocation,skill, experience, InterviewDetailsId, CreatedBy)
values (1,'12347', 'Garima', 'Srivastava', 'garima@abc.com','7615243175', 3,'Software Engineer', '3.1','Pune','.net, Angular',1,3,'Dwarka Role');
insert into Candidate(isInternal,employeeId, firstName, lastName, email, mobileNumber, techTrackId, jobTitle, grade, baseLocation,skill, experience, InterviewDetailsId, CreatedBy)
values (1,'12348', 'Honey', '.', 'honey@abc.com','7615243178', 1,'Software Engineer', '3.1','Pune','.net, Angular',1,4,'Dwarka Role');
insert into Candidate(isInternal,employeeId, firstName, lastName, email, mobileNumber, techTrackId, jobTitle, grade, baseLocation,skill, experience, InterviewDetailsId, CreatedBy)
values (1,'12349', 'Shreyash', 'Pawar', 'shreyash@abc.com','7615243172', 1,'Software Engineer', '3.1','Pune','.net, Angular',1,5,'Dwarka Role');
insert into Candidate(isInternal,employeeId, firstName, lastName, email, mobileNumber, techTrackId, jobTitle, grade, baseLocation,skill, experience, InterviewDetailsId, CreatedBy)
values (1,'12340', 'Tanishq', 'Valyal', 'tanishq@abc.com','7615243171', 1,'Software Engineer', '3.1','Pune','.net, Angular',1,6,'Dwarka Role');

select * from Candidate;


#Database Assingment

##Online Maintenance management database

The database is made up of 6 tables

1. Student table which contains the student_id and details.
2. maintenance_user table which contains the list of maintenance users their role_id and their job_id.
3. work_request table which contains list of work_requests raised by students about a problem, the status of the work request, if it has been assigned to and the maintenance_user id who has been assigned to it.
4. role table contains information about the maintenance user roles (administrator, normal-level staff). The role determines what they have access to if the front-end application is designed with this DB as a store.
5. job table contains information on the the type of job a maintenance user can do (carpenter, plumber, electrician e.t.c). The problem category of the work_request determines who is listed as potential msintenance users to be assigned it through this table.
6. problem_category table contains information on the type of problem in the work request (carpentry, electrical, plumbing).

##Situations and their queries
1. Get all the capentry work_requests with their assigned maintenance user	
	assuming the job table is as below
	
	| job_id   | job_category   |
	|----------|-----------------|
	
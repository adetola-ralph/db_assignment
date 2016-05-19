#Database Assignment

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
	|---------------------------|
	| 1        | carpentry      |
	| 2        | electrical     |
	| 3        | plumbing       |

	`SQL: SELECT student.fullname, work_request.work_id, problem_category.problem_category, maintenance_users.fullname, work_request.problem_description, work_request.problem_location, work_request.date_opened, work_request.status, work_request.student_id, work_request.staff_id FROM work_request Inner Join student ON work_request.student_id = student.student_id Inner Join problem_category ON work_request.problem_category_id = problem_category.problem_category_id Inner Join maintenance_users ON work_request.staff_id = maintenance_users.staff_id WHERE work_request.problem_category_id =  '1'`

2. Another Query
	`select`
3. Another Query
	`insert`
4. Another Query
	`update`
5. Delete an entry from the work_request table based on the work id
	`delete`

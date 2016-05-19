CREATE TABLE `job`
(
  `job_id` integer NOT NULL,
  `job_category` varbinary(255) NOT NULL,
  CONSTRAINT job_id PRIMARY KEY (`job_id`)
)
;

CREATE TABLE `maintenance_users`
(
  `staff_id` integer NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varbinary(255) NOT NULL,
  `email` varbinary(255) NOT NULL,
  `role_id` integer NOT NULL,
  `job_id` integer NOT NULL,
  CONSTRAINT staff_id PRIMARY KEY (`staff_id`)
)
;

CREATE TABLE `problem_category`
(
  `problem_category_id` integer NOT NULL,
  `problem_category` varbinary(255) NOT NULL,
  `job_id` integer NOT NULL,
  CONSTRAINT problem_category_id PRIMARY KEY (`problem_category_id`)
)
;

CREATE TABLE `role`
(
  `role_id` integer NOT NULL,
  `role` varchar(255) NOT NULL,
  CONSTRAINT role_id PRIMARY KEY (`role_id`)
)
;

CREATE TABLE `student`
(
  `student_id` integer NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `program` varbinary(255) NOT NULL,
  `hall` varchar(255) NOT NULL,
  `room` varchar(4) NOT NULL,
  CONSTRAINT student_id PRIMARY KEY (`student_id`)
)
;

CREATE TABLE `work_request`
(
  `work_id` integer NOT NULL,
  `problem_category_id` integer NOT NULL,
  `problem_description` varbinary(255) NOT NULL,
  `problem_location` varchar(255) NOT NULL,
  `date_opened` date NOT NULL,
  `status` varbinary(10) NOT NULL,
  `student_id` integer NOT NULL,
  `staff_id` integer,
  CONSTRAINT work_id PRIMARY KEY (`work_id`)
)
;

ALTER TABLE `maintenance_users` ADD CONSTRAINT `fk_maintenance_users_`
  FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
;

ALTER TABLE `maintenance_users` ADD CONSTRAINT `fk_maintenance_users_role_id`
  FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
;

ALTER TABLE `problem_category` ADD CONSTRAINT `fk_problem_category_`
  FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
;

ALTER TABLE `work_request` ADD CONSTRAINT `fk_work_request_`
  FOREIGN KEY (`problem_category_id`) REFERENCES `problem_category` (`problem_category_id`)
;

ALTER TABLE `work_request` ADD CONSTRAINT `fk_work_request_srudent_id`
  FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `work_request` ADD CONSTRAINT `fk_work_request_staff_id`
  FOREIGN KEY (`staff_id`) REFERENCES `maintenance_users` (`staff_id`)
;


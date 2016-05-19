-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'maintenance_users'
-- maintenance users in the database
-- ---

DROP TABLE IF EXISTS `maintenance_users`;
		
CREATE TABLE `maintenance_users` (
  `staff_id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `fullname` VARCHAR NOT NULL DEFAULT 'NULL',
  `username` VARCHAR NOT NULL DEFAULT 'NULL',
  `password` VARCHAR NOT NULL DEFAULT 'NULL',
  `email` VARCHAR NOT NULL DEFAULT 'NULL',
  `role_id` INTEGER NOT NULL DEFAULT NULL,
  `job_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
KEY (`role_id`)
) COMMENT 'maintenance users in the database';

-- ---
-- Table 'role'
-- shows the user roles
-- ---

DROP TABLE IF EXISTS `role`;
		
CREATE TABLE `role` (
  `role_id` INTEGER NOT NULL DEFAULT NULL,
  `role` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`role_id`)
) COMMENT 'shows the user roles';

-- ---
-- Table 'job'
-- 
-- ---

DROP TABLE IF EXISTS `job`;
		
CREATE TABLE `job` (
  `job_id` INTEGER NOT NULL DEFAULT NULL,
  `job_description` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`job_id`)
);

-- ---
-- Table 'student'
-- 
-- ---

DROP TABLE IF EXISTS `student`;
		
CREATE TABLE `student` (
  `student_id` INTEGER NOT NULL DEFAULT NULL,
  `fullname` VARCHAR NOT NULL DEFAULT 'NULL',
  `password` VARCHAR NOT NULL DEFAULT 'NULL',
  `program` VARCHAR NOT NULL DEFAULT 'NULL',
  `hall` VARCHAR NOT NULL DEFAULT 'NULL',
  `room` VARCHAR(4) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`student_id`)
);

-- ---
-- Table 'work_request'
-- 
-- ---

DROP TABLE IF EXISTS `work_request`;
		
CREATE TABLE `work_request` (
  `work_id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `problem_category_id` INTEGER NOT NULL DEFAULT NULL,
  `problem_description` VARCHAR NOT NULL DEFAULT 'NULL',
  `problem_location` VARCHAR NOT NULL DEFAULT 'NULL',
  `date_opened` DATE NOT NULL DEFAULT 'NULL',
  `status` VARCHAR NOT NULL DEFAULT 'NULL',
  `staff_id` INTEGER NULL DEFAULT NULL COMMENT 'Staff assigned to the job',
  `student_id` INTEGER NOT NULL DEFAULT NULL COMMENT 'student who opened the request',
  PRIMARY KEY (`work_id`)
);

-- ---
-- Table 'problem_category'
-- 
-- ---

DROP TABLE IF EXISTS `problem_category`;
		
CREATE TABLE `problem_category` (
  `problem_category_id` INTEGER NOT NULL DEFAULT NULL,
  `problem_category` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`problem_category_id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `maintenance_users` ADD FOREIGN KEY (role_id) REFERENCES `role` (`role_id`);
ALTER TABLE `maintenance_users` ADD FOREIGN KEY (job_id) REFERENCES `job` (`job_id`);
ALTER TABLE `work_request` ADD FOREIGN KEY (problem_category_id) REFERENCES `problem_category` (`problem_category_id`);
ALTER TABLE `work_request` ADD FOREIGN KEY (staff_id) REFERENCES `maintenance_users` (`staff_id`);
ALTER TABLE `work_request` ADD FOREIGN KEY (student_id) REFERENCES `student` (`student_id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `maintenance_users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `role` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `job` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `student` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `work_request` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `problem_category` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `maintenance_users` (`staff_id`,`fullname`,`username`,`password`,`email`,`role_id`,`job_id`) VALUES
-- ('','','','','','','');
-- INSERT INTO `role` (`role_id`,`role`) VALUES
-- ('','');
-- INSERT INTO `job` (`job_id`,`job_description`) VALUES
-- ('','');
-- INSERT INTO `student` (`student_id`,`fullname`,`password`,`program`,`hall`,`room`) VALUES
-- ('','','','','','');
-- INSERT INTO `work_request` (`work_id`,`problem_category_id`,`problem_description`,`problem_location`,`date_opened`,`status`,`staff_id`,`student_id`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `problem_category` (`problem_category_id`,`problem_category`) VALUES
-- ('','');
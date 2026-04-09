ALTER TABLE `student_supervision_registration` 
ADD COLUMN `is_subscribed_oa_notify` tinyint(1) NOT NULL DEFAULT 0;

ALTER TABLE `student_supervision_registration` 
ADD COLUMN `total_scored_subjects` int(11) NOT NULL DEFAULT 0;


ALTER TABLE `handbook` ADD COLUMN `handbook_type` VARCHAR(20) NOT NULL DEFAULT 'cam_nang';

ALTER TABLE `handbook` ADD COLUMN `pages` JSON DEFAULT NULL;

INSERT INTO `django_migrations` (`app`, `name`, `applied`) VALUES
('bduSuport', '0007_handbook_handbook_type', NOW()),
('bduSuport', '0008_handbook_pages', NOW());

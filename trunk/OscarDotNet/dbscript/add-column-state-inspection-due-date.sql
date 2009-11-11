START TRANSACTION;

ALTER TABLE `vehicle`
 ADD COLUMN `dmv_inspection_due` DATE,
 ADD INDEX `purchase_price`(`purchase_price`),
 ADD INDEX `recent_mileage`(`recent_mileage`),
 ADD INDEX `target_pm_mileage`(`target_pm_mileage`),
 ADD INDEX `dmv_inspection_due`(`dmv_inspection_due`);

COMMIT
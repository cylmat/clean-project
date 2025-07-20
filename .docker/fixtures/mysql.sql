USE `mydb`;

--
-- TABLE
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='user';

--
-- DATA
--
INSERT INTO `user` (`name`, `email`, `phone`) VALUES 
    ('Michael Johnson', 'michael.johnson@exemple.fr', '0612345678'),
    ('Jennifer Robinson', 'jennifer.robinson@exemple.fr', '0623456789'),
    ('Martin Lewis', 'martin.lewis@exemple.fr', '0634567890')
;

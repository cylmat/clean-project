--
-- TABLE
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `office` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `age` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='describe user';

--
-- DATA
--
INSERT INTO `user` (`name`, `office`, `age`) VALUES 
    ('Mr. Michael Johnson DDS', 'collection', 72),
    ('Jennifer Robinson', 'job', 46),
    ('Martin Lewis', 'voice', 26),
    ('Dr. Kristen Hays', 'return', 68),
    ('Maria Williams', 'hotel', 66),
    ('Jennifer Blair', 'increase', 34),
    ('Michelle Hamilton', 'play', 41),
    ('Hunter Brown', 'campaign', 70),
    ('Billy Tate', 'thought', 52),
    ('James Lopez', 'defense', 58)

DROP DATABASE IF EXISTS `1asix.m2.g01`;

DROP USER IF EXISTS `1asix.userA`@`%`;

CREATE DATABASE IF NOT EXISTS `1asix.m2.g01` CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE USER IF NOT EXISTS `1asix.userA`@`%` IDENTIFIED by "userA2021-ERA!";

GRANT ALL PRIVILEGES ON `1asix.m2.g01`.* TO `1asix.userA`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g01\_%`.* TO `1asix.userA`@`%`;

DROP USER IF EXISTS `1asix.userB`@`%`;

CREATE USER IF NOT EXISTS `1asix.userB`@`%` IDENTIFIED by "userB2021-ERB!";

GRANT ALL PRIVILEGES ON `1asix.m2.g01`.* TO `1asix.userB`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g01\_%`.* TO `1asix.userB`@`%`;

DROP USER IF EXISTS `1asix.userC`@`%`;

CREATE USER IF NOT EXISTS `1asix.userC`@`%` IDENTIFIED by "userC2021-ERC!";

GRANT ALL PRIVILEGES ON `1asix.m2.g01`.* TO `1asix.userC`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g01\_%`.* TO `1asix.userC`@`%`;

DROP DATABASE IF EXISTS `1asix.m2.g02`;

DROP USER IF EXISTS `1asix.userD`@`%`;

CREATE DATABASE IF NOT EXISTS `1asix.m2.g02` CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE USER IF NOT EXISTS `1asix.userD`@`%` IDENTIFIED by "userD2021-ERD!";

GRANT ALL PRIVILEGES ON `1asix.m2.g02`.* TO `1asix.userD`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g02\_%`.* TO `1asix.userD`@`%`;

DROP USER IF EXISTS `1asix.userE`@`%`;

CREATE USER IF NOT EXISTS `1asix.userE`@`%` IDENTIFIED by "userE2021-ERE!";

GRANT ALL PRIVILEGES ON `1asix.m2.g02`.* TO `1asix.userE`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g02\_%`.* TO `1asix.userE`@`%`;

DROP USER IF EXISTS `1asix.userF`@`%`;

CREATE USER IF NOT EXISTS `1asix.userF`@`%` IDENTIFIED by "userF2021-ERF!";

GRANT ALL PRIVILEGES ON `1asix.m2.g02`.* TO `1asix.userF`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g02\_%`.* TO `1asix.userF`@`%`;

DROP DATABASE IF EXISTS `1asix.m2.g03`;

DROP USER IF EXISTS `1asix.userG`@`%`;

CREATE DATABASE IF NOT EXISTS `1asix.m2.g03` CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE USER IF NOT EXISTS `1asix.userG`@`%` IDENTIFIED by "userG2021-ERG!";

GRANT ALL PRIVILEGES ON `1asix.m2.g03`.* TO `1asix.userG`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g03\_%`.* TO `1asix.userG`@`%`;

DROP USER IF EXISTS `1asix.userH`@`%`;

CREATE USER IF NOT EXISTS `1asix.userH`@`%` IDENTIFIED by "userH2021-ERH!";

GRANT ALL PRIVILEGES ON `1asix.m2.g03`.* TO `1asix.userH`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g03\_%`.* TO `1asix.userH`@`%`;

DROP USER IF EXISTS `1asix.userI`@`%`;

CREATE USER IF NOT EXISTS `1asix.userI`@`%` IDENTIFIED by "userI2021-ERI!";

GRANT ALL PRIVILEGES ON `1asix.m2.g03`.* TO `1asix.userI`@`%`;
GRANT ALL PRIVILEGES ON `1asix.m2.g03\_%`.* TO `1asix.userI`@`%`;

DROP DATABASE IF EXISTS `1daw.m2.g01`;

DROP USER IF EXISTS `1daw.userJ`@`%`;

CREATE DATABASE IF NOT EXISTS `1daw.m2.g01` CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE USER IF NOT EXISTS `1daw.userJ`@`%` IDENTIFIED by "userJ2021-ERJ!";

GRANT ALL PRIVILEGES ON `1daw.m2.g01`.* TO `1daw.userJ`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g01\_%`.* TO `1daw.userJ`@`%`;

DROP USER IF EXISTS `1daw.userK`@`%`;

CREATE USER IF NOT EXISTS `1daw.userK`@`%` IDENTIFIED by "userK2021-ERK!";

GRANT ALL PRIVILEGES ON `1daw.m2.g01`.* TO `1daw.userK`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g01\_%`.* TO `1daw.userK`@`%`;

DROP USER IF EXISTS `1daw.userL`@`%`;

CREATE USER IF NOT EXISTS `1daw.userL`@`%` IDENTIFIED by "userL2021-ERL!";

GRANT ALL PRIVILEGES ON `1daw.m2.g01`.* TO `1daw.userL`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g01\_%`.* TO `1daw.userL`@`%`;

DROP DATABASE IF EXISTS `1daw.m2.g02`;

DROP USER IF EXISTS `1daw.userM`@`%`;

CREATE DATABASE IF NOT EXISTS `1daw.m2.g02` CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE USER IF NOT EXISTS `1daw.userM`@`%` IDENTIFIED by "userM2021-ERM!";

GRANT ALL PRIVILEGES ON `1daw.m2.g02`.* TO `1daw.userM`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g02\_%`.* TO `1daw.userM`@`%`;

DROP USER IF EXISTS `1daw.userN`@`%`;

CREATE USER IF NOT EXISTS `1daw.userN`@`%` IDENTIFIED by "userN2021-ERN!";

GRANT ALL PRIVILEGES ON `1daw.m2.g02`.* TO `1daw.userN`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g02\_%`.* TO `1daw.userN`@`%`;

DROP USER IF EXISTS `1daw.userO`@`%`;

CREATE USER IF NOT EXISTS `1daw.userO`@`%` IDENTIFIED by "userO2021-ERO!";

GRANT ALL PRIVILEGES ON `1daw.m2.g02`.* TO `1daw.userO`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g02\_%`.* TO `1daw.userO`@`%`;

DROP USER IF EXISTS `1daw.userP`@`%`;

CREATE USER IF NOT EXISTS `1daw.userP`@`%` IDENTIFIED by "userP2021-ERP!";

GRANT ALL PRIVILEGES ON `1daw.m2.g02`.* TO `1daw.userP`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g02\_%`.* TO `1daw.userP`@`%`;

DROP DATABASE IF EXISTS `1daw.m2.g03`;

DROP USER IF EXISTS `1daw.userQ`@`%`;

CREATE DATABASE IF NOT EXISTS `1daw.m2.g03` CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE USER IF NOT EXISTS `1daw.userQ`@`%` IDENTIFIED by "userQ2021-ERQ!";

GRANT ALL PRIVILEGES ON `1daw.m2.g03`.* TO `1daw.userQ`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g03\_%`.* TO `1daw.userQ`@`%`;

DROP USER IF EXISTS `1daw.userR`@`%`;

CREATE USER IF NOT EXISTS `1daw.userR`@`%` IDENTIFIED by "userR2021-ERR!";

GRANT ALL PRIVILEGES ON `1daw.m2.g03`.* TO `1daw.userR`@`%`;
GRANT ALL PRIVILEGES ON `1daw.m2.g03\_%`.* TO `1daw.userR`@`%`;


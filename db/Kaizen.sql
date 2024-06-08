-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para kaizen
CREATE DATABASE
IF NOT EXISTS `kaizen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `kaizen`;

-- Copiando estrutura para tabela kaizen.users
CREATE TABLE
IF NOT EXISTS `users`
(
  `id` int
(11) NOT NULL AUTO_INCREMENT,
  `name` varchar
(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `gender` char
(1) DEFAULT NULL,
  `email` varchar
(50) DEFAULT NULL,
  `imc` float DEFAULT NULL,
  `telefone` varchar
(50) DEFAULT NULL,
  `senha` varchar
(50) DEFAULT NULL,
  PRIMARY KEY
(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando estrutura para tabela kaizen.exercises
CREATE TABLE
IF NOT EXISTS `exercises`
(
  `id` int
(11) NOT NULL AUTO_INCREMENT,
  `name` varchar
(50) DEFAULT NULL,
  `target_muscle` varchar
(50) DEFAULT NULL,
  `type` varchar
(50) DEFAULT NULL,
  `fk_users_id` int
(11) DEFAULT NULL,
  PRIMARY KEY
(`id`),
  KEY `FK_exercises_2`
(`fk_users_id`),
  CONSTRAINT `FK_exercises_2` FOREIGN KEY
(`fk_users_id`) REFERENCES `users`
(`id`) ON
DELETE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.exercises: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.foods
CREATE TABLE
IF NOT EXISTS `foods`
(
  `id` int
(11) NOT NULL AUTO_INCREMENT,
  `kcal` float DEFAULT NULL,
  `carbo` float DEFAULT NULL,
  `proteins` float DEFAULT NULL,
  `name` varchar
(50) DEFAULT NULL,
  PRIMARY KEY
(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.foods: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.meals
CREATE TABLE
IF NOT EXISTS `meals`
(
  `id` int
(11) NOT NULL AUTO_INCREMENT,
  `name` varchar
(50) DEFAULT NULL,
  `fk_users_id` int
(11) DEFAULT NULL,
  PRIMARY KEY
(`id`),
  KEY `FK_meals_2`
(`fk_users_id`),
  CONSTRAINT `FK_meals_2` FOREIGN KEY
(`fk_users_id`) REFERENCES `users`
(`id`) ON
DELETE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.meals: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.meal_foods
CREATE TABLE
IF NOT EXISTS `meal_foods`
(
  `id` int
(11) NOT NULL AUTO_INCREMENT,
  `quantity` int
(11) DEFAULT NULL,
  `fk_meals_id` int
(11) DEFAULT NULL,
  `fk_foods_id` int
(11) DEFAULT NULL,
  PRIMARY KEY
(`id`),
  KEY `FK_meal_foods_2`
(`fk_meals_id`),
  KEY `FK_meal_foods_3`
(`fk_foods_id`),
  CONSTRAINT `FK_meal_foods_2` FOREIGN KEY
(`fk_meals_id`) REFERENCES `meals`
(`id`),
  CONSTRAINT `FK_meal_foods_3` FOREIGN KEY
(`fk_foods_id`) REFERENCES `foods`
(`id`) ON
DELETE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.meal_foods: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.timers
CREATE TABLE
IF NOT EXISTS `timers`
(
  `work` int
(11) DEFAULT NULL,
  `rest` int
(11) DEFAULT NULL,
  `rounds` int
(11) DEFAULT NULL,
  `sets` int
(11) DEFAULT NULL,
  `sets_rest` int
(11) DEFAULT NULL,
  `id` int
(11) NOT NULL AUTO_INCREMENT,
  `name` varchar
(50) DEFAULT NULL,
  `fk_users_id` int
(11) DEFAULT NULL,
  PRIMARY KEY
(`id`),
  KEY `FK_timers_2`
(`fk_users_id`),
  CONSTRAINT `FK_timers_2` FOREIGN KEY
(`fk_users_id`) REFERENCES `users`
(`id`) ON
DELETE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando estrutura para tabela kaizen.workouts
CREATE TABLE
IF NOT EXISTS `workouts`
(
  `id` int
(11) NOT NULL AUTO_INCREMENT,
  `name` varchar
(50) DEFAULT NULL,
  `fk_users_id` int
(11) DEFAULT NULL,
  PRIMARY KEY
(`id`),
  KEY `FK_workouts_2`
(`fk_users_id`),
  CONSTRAINT `FK_workouts_2` FOREIGN KEY
(`fk_users_id`) REFERENCES `users`
(`id`) ON
DELETE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.workouts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.workout_exercises
CREATE TABLE
IF NOT EXISTS `workout_exercises`
(
  `quantity` int
(11) DEFAULT NULL,
  `type` varchar
(50) DEFAULT NULL,
  `id` int
(11) NOT NULL AUTO_INCREMENT,
  `fk_workouts_id` int
(11) DEFAULT NULL,
  `fk_exercises_id` int
(11) DEFAULT NULL,
  PRIMARY KEY
(`id`),
  KEY `FK_workout_exercises_2`
(`fk_workouts_id`),
  KEY `FK_workout_exercises_3`
(`fk_exercises_id`),
  CONSTRAINT `FK_workout_exercises_2` FOREIGN KEY
(`fk_workouts_id`) REFERENCES `workouts`
(`id`),
  CONSTRAINT `FK_workout_exercises_3` FOREIGN KEY
(`fk_exercises_id`) REFERENCES `exercises`
(`id`) ON
DELETE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('1','123,5348925','25,80975','2,58825','Arroz, integral, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('2','359,678002032609','77,4507141304348','7,32328586956522','Arroz, integral, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('3','128,258485666667','28,05985','2,52081666666667','Arroz, tipo 1, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('4','357,789273115942','78,7595434782609','7,15853985507246','Arroz, tipo 1, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('5','130,119648333333','28,1925833333333','2,56841666666667','Arroz, tipo 2, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('6','358,116761456522','78,8814503623188','7,24188297101449','Arroz, tipo 2, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('7','393,822689449275','66,6356405797102','13,9210260869565','Aveia, flocos, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('8','442,819390144928','75,2341449275362','8,07252173913043','Biscoito, doce, maisena');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('9','471,824779710145','70,5494492753623','6,39721739130435','Biscoito, doce, recheado com chocolate');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('10','471,174736231884','71,0135072463768','5,71982608695652','Biscoito, doce, recheado com morango');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('11','502,456857971014','67,5354782608696','5,56452173913044','Biscoito, doce, wafer, recheado de chocolate');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('12','513,446182608696','67,3529565217391','4,51704347826087','Biscoito, doce, wafer, recheado de morango');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('13','431,73228115942','68,731536231884','10,0551304347826','Biscoito, salgado, cream cracker');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('14','418,633333333333','84,7139130434783','6,15942028985507','Bolo, mistura para');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('15','323,851666666667','47,864','4,41666666666667','Bolo, pronto, aipim');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('16','410,013666666667','54,71775','6,22291666666667','Bolo, pronto, chocolate');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('17','333,437666666667','52,276','5,66666666666667','Bolo, pronto, coco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('18','311,387','45,1088333333333','4,80416666666667','Bolo, pronto, milho');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('19','357,60259','78,061','7,2','Canjica, branca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('20','112,456777220465','23,6277332909902','2,36060004234314','Canjica, com leite integral');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('21','369,59975','80,835','7,29166666666667','Cereais, milho, flocos, com sal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('22','363,338316666667','80,4483333333333','6,875','Cereais, milho, flocos, sem sal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('23','394,42752173913','87,2655072463768','6,43115942028986','Cereais, mingau, milho, infantil');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('24','381,133333333333','81,6175','8,89583333333333','Cereais, mistura para vitamina, trigo, cevada e aveia');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('25','365,354163768116','83,8242028985507','7,15579710144928','Cereal matinal, milho');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('26','376,555253623188','88,8405797101449','4,74275362318841','Cereal matinal, milho, açúcar');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('27','386,001190336398','83,8693835585912','7,02694977474213','Creme de arroz, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('28','333,034192670544','86,1485','4,82083333333333','Creme de milho, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('29','78,4338183136558','13,9443999576569','2,36060004234314','Curau, milho verde');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('30','402,286577435315','79,8164166666667','2,22291666666667','Curau, milho verde, mistura para');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('31','363,056480181223','85,5040000406901','1,26933329264323','Farinha, de arroz, enriquecida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('32','335,777662799327','73,2982668304443','12,515066502889','Farinha, de centeio, integral');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('33','350,58693322738','79,0791666666667','7,1875','Farinha, de milho, amarela');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('34','370,578096666667','75,7856666666667','11,3809996191661','Farinha, de rosca');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('35','360,472978550725','75,0925507246377','9,79078260869565','Farinha, de trigo');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('36','414,850517391304','77,7708695652174','11,8791304347826','Farinha, láctea, de cereais');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('37','163,763666666667','32,5221666666667','5,8125','Lasanha, massa fresca, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('38','220,305666666667','45,0583333333333','7,00833333333333','Lasanha, massa fresca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('39','435,864780533333','62,4316533333333','8,79168','Macarrão, instantâneo');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('40','371,122613043478','77,944347826087','9,99565217391304','Macarrão, trigo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('41','370,567113333333','76,6225333333334','10,3208','Macarrão, trigo, cru, com ovos');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('42','361,366823878261','87,1488439130435','0,597826086956522','Milho, amido, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('43','353,482268115942','78,8728985507246','7,21376811594203','Milho, fubá, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('44','138,166565','28,55575','6,58958333333333','Milho, verde, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('45','97,5648942028985','17,1350724637681','3,22826086956522','Milho, verde, enlatado, drenado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('46','373,421466666667','89,3366666666667','0,583333333333333','Mingau tradicional, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('47','171,219111666667','30,6849166666667','2,55208333333333','Pamonha, barra para cozimento, pré-cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('48','343,085366666667','59,5666666666667','12,35','Pão, aveia, forma');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('49','308,726323333333','56,5103333333333','11,343','Pão, de soja');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('50','252,99403','44,119','11,9509996000926','Pão, glúten, forma');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('51','292,01349','56,397','8,303','Pão, milho, forma');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('52','253,193618333333','49,9415','9,42516666666667','Pão, trigo, forma, integral');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('53','299,810150434783','58,6464347826087','7,9535652173913','Pão, trigo, francês');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('54','310,96494','61,452','8,398','Pão, trigo, sovado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('55','288,70207151599','42,0166336927414','10,7406996405919','Pastel, de carne, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('56','388,374651624968','43,7678003381093','10,1041996618907','Pastel, de carne, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('57','308,474433887374','45,9479336630503','9,853399670283','Pastel, de queijo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('58','422,112080039319','48,1327336247762','8,70959970855713','Pastel, de queijo, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('59','310,202514333333','57,3796333333333','6,9027','Pastel, massa, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('60','569,672459333333','49,3431333333333','6,0192','Pastel, massa, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('61','448,334261847198','70,3125833333333','9,92708333333334','Pipoca, com óleo de soja, sem sal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('62','102,741166666667','23,3116666666667','2,29166666666667','Polenta, pré-cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('63','377,422283','74,5559','10,5241','Torrada, pão francês');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('64','48,0437425','10,7609166666667','1,44375','Abóbora, cabotian, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('65','38,5992942028986','8,36028985507247','1,7463768115942','Abóbora, cabotian, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('66','13,6056739130435','3,30130434782609','0,608695652173913','Abóbora, menina brasileira, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('67','12,364436231884','2,66652173913043','0,960144927536232','Abóbora, moranga, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('68','29,0038220317562','5,98191666666666','0,39375','Abóbora, moranga, refogada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('69','24,4662679497004','6,12283333333334','0,670833333333333','Abóbora, pescoço, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('70','15,03852','2,97700000000001','1,125','Abobrinha, italiana, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('71','19,2791260869565','4,29202898550724','1,14130434782609','Abobrinha, italiana, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('72','24,4296021876534','4,18691666666666','1,06875','Abobrinha, italiana, refogada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('73','30,8107022288163','7,86742','0,639583333333333','Abobrinha, paulista, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('74','20,9423424999999','4,63091666666666','1,44375','Acelga, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('75','16,5788014492753','2,25159420289854','2,68840579710145','Agrião, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('76','19,0914566449706','4,27233333333334','0,758333333333333','Aipo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('77','8,79490323686605','1,74533333333335','0,608333333333333','Alface, americana, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('78','10,6808565217392','1,69550724637683','1,34782608695652','Alface, crespa, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('79','13,8209014492753','2,42826086956522','1,68840579710145','Alface, lisa, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('80','12,716997363468','2,49341666666666','0,90625','Alface, roxa, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('81','29,1836130810579','5,241','2,65833333333333','Alfavaca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('82','113,12987826087','23,9057971014493','7,01086956521739','Alho, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('83','31,5079193532467','6,87816666666667','1,4125','Alho-poró, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('84','18,0344289855072','3,33521739130435','1,76811594202899','Almeirão, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('85','65,0819108288685','5,70149999999999','1,70416666666667','Almeirão, refogado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('86','80,1197625','18,9475833333333','0,852083333333333','Batata, baroa, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('87','100,984923188406','23,9828985507246','1,04710144927536','Batata, baroa, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('88','76,7596105034352','18,4223333333333','0,641666666666667','Batata, doce, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('89','118,241375362319','28,1960869565217','1,25724637681159','Batata, doce, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('90','542,73467338419','51,2223333333333','5,58333333333333','Batata, frita, tipo chips, industrializada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('91','51,5884766362707','11,94375','1,16458333333333','Batata, inglesa, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('92','64,3702260869565','14,6882608695652','1,77173913043478','Batata, inglesa, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('93','267,157422502041','35,6403333333333','4,96666666666667','Batata, inglesa, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('94','67,8879361506303','14,093','1,29166666666667','Batata, inglesa, sauté');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('95','18,8452855568131','4,46824999999999','0,677083333333333','Berinjela, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('96','19,6277536231884','4,42898550724637','1,22101449275362','Berinjela, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('97','32,1543243314028','7,23491666666666','1,29375','Beterraba, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('98','48,8285086956521','11,1110144927536','1,94565217391304','Beterraba, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('99','437,549','80,5353333333333','1,29166666666667','Biscoito, polvilho doce');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('100','24,6361631113688','4,36666666666666','2,13333333333333','Brócolis, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('101','25,495131884058','4,02507246376812','3,64492753623188','Brócolis, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('102','77,5849133333334','18,8525','1,52916666666667','Cará, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('103','95,6331347826087','22,9540579710145','2,28260869565217','Cará, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('104','34,03162971735','5,97399999999999','3,2','Caruru, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('105','23,8884122573733','4,75224999999999','1,86875','Catalonha, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('106','63,4492691488266','4,80933333333334','1,95','Catalonha, refogada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('107','39,4200463768116','8,8531884057971','1,71014492753623','Cebola, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('108','19,5158855072464','3,37072463768116','1,86594202898551','Cebolinha, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('109','29,8617777101596','6,68674999999999','0,847916666666667','Cenoura, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('110','34,1353884057971','7,66','1,32246376811594','Cenoura, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('111','13,8371202898551','2,85333333333334','1,13768115942029','Chicória, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('112','18,539790531377','4,79341666666667','0,414583333333333','Chuchu, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('113','16,9789188405797','4,13739130434783','0,699275362318841','Chuchu, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('114','309,070746804476','47,955','20,875','Coentro, folhas desidratadas');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('115','27,0566971014493','4,33347826086956','2,8731884057971','Couve, manteiga, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('116','90,3448154261112','8,70766666666667','1,66666666666667','Couve, manteiga, refogada ');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('117','22,5633492753623','4,51753623188406','1,90579710144928','Couve-flor, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('118','19,1141406147282','3,87541666666668','1,23958333333333','Couve-flor, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('119','16,0956942028985','2,5736231884058','1,9963768115942','Espinafre, Nova Zelândia, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('120','67,2536517506639','4,23858333333334','2,71875','Espinafre, Nova Zelândia, refogado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('121','360,869698550725','87,8989855072464','1,55434782608696','Farinha, de mandioca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('122','365,268975','89,1941666666667','1,22916666666667','Farinha, de mandioca, torrada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('123','360,179774879932','87,2853333333333','1,61666666666667','Farinha, de puba');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('124','330,850558333333','81,1491666666667','0,520833333333333','Fécula, de mandioca');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('125','38,7232363754113','7,75833333333333','4,16666666666667','Feijão, broto, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('126','96,699831884058','23,2326086956522','2,05072463768116','Inhame, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('127','27,3651434782609','6,19115942028986','1,40217391304348','Jiló, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('128','125,811635','23,0591666666667','4,4125','Jurubeba, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('129','125,35825','30,09','0,575','Mandioca, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('130','151,416956521739','36,1695652173913','1,1304347826087','Mandioca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('131','405,693941666667','80,3041666666667','2,0625','Mandioca, farofa, temperada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('132','300,055243389149','50,2514166666667','1,38125','Mandioca, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('133','21,1476768115942','3,64449275362319','1,98550724637681','Manjericão, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('134','13,7472360869565','2,72869565217391','1,39130434782609','Maxixe, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('135','18,1073890521725','3,23658333333333','2,11041666666667','Mostarda, folha, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('136','180,775273993413','36,78','5,85833333333333','Nhoque, batata, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('137','18,1866246376812','4,14710144927538','1,20289855072464','Nabo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('138','23,1997164340813','4,32833333333333','1,79166666666667','Palmito, juçara, em conserva');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('139','29,4319633333333','5,509','2,45833333333333','Palmito, pupunha, em conserva');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('140','363,077913333333','34,2415','5,12083333333333','Pão, de queijo, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('141','294,538','38,512','3,648','Pão, de queijo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('142','9,53369130434782','2,03710144927535','0,869565217391304','Pepino, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('143','27,9274594202898','5,96202898550725','1,22463768115942','Pimentão, amarelo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('144','21,2858811594203','4,89260869565218','1,05072463768116','Pimentão, verde, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('145','23,281363768116','5,46681159420291','1,03985507246377','Pimentão, vermelho, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('146','351,226733333333','86,7733333333333','0,43','Polvilho, doce');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('147','29,9392621500691','6,37391666666667','1,91875','Quiabo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('148','13,7381260869565','2,72536231884058','1,39130434782609','Rabanete, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('149','17,1188028985507','3,85985507246377','0,876811594202899','Repolho, branco, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('150','30,9075029543241','7,204','1,90833333333333','Repolho, roxo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('151','41,7735252897143','7,56158333333333','1,80208333333333','Repolho, roxo, refogado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('152','13,1332566072941','2,21966666666666','1,76666666666667','Rúcula, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('153','33,4241115942029','5,70608695652173','3,25724637681159','Salsa, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('154','56,5337724637681','12,6697101449275','3,42028985507246','Seleta de legumes, enlatada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('155','30,3979341666666','4,94675','2,67291666666667','Serralha, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('156','34,2089183333333','5,43049999999999','2,89583333333333','Taioba, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('157','15,3351565217392','3,13884057971015','1,09782608695652','Tomate, com semente, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('158','60,9334336521739','14,9586173913043','2,43478260869565','Tomate, extrato');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('159','38,4465494604906','7,71166666666668','1,375','Tomate, molho industrializado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('160','27,9368797101449','6,89434782608695','1,36231884057971','Tomate, purê');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('161','20,5469091666666','5,11791666666666','0,810416666666667','Tomate, salada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('162','24,8983579710145','5,34710144927536','1,78623188405797','Vagem, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('163','96,1547086956522','6,0308695652174','1,23913043478261','Abacate, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('164','48,3222130434782','12,3346376811594','0,858695652173913','Abacaxi, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('165','30,5917991943359','7,79866666666666','0,466666666666667','Abacaxi, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('166','62,4240984085401','14,927','0,833333333333333','Abiu, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('167','110,29759','21,4551666666667','0,720833333333333','Açaí, polpa, com xarope de guaraná e glucose');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('168','58,0453688728213','6,20841666666667','0,797916666666667','Açaí, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('169','33,46227','7,96641666666667','0,90625','Acerola, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('170','21,9368','5,54133333333333','0,591666666666667','Acerola, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('171','182,84662','46,8926666666667','0,408333333333333','Ameixa, calda, enlatada ');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('172','52,5424826086957','13,8515942028986','0,771739130434783','Ameixa, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('173','177,359185315371','47,658','1,025','Ameixa, em calda, enlatada, drenada ');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('174','96,9715874479214','25,3321666666667','0,970833333333333','Atemóia, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('175','128,024452173913','33,6652173913044','1,43478260869565','Banana, da terra, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('176','280,105192550639','75,6665833333333','2,16875','Banana, doce em barra');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('177','105,08265','27,8044166666667','1,13125','Banana, figo, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('178','86,8053304347826','22,3363768115942','1,7536231884058','Banana, maçã, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('179','91,528847826087','23,848115942029','1,39855072463768','Banana, nanica, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('180','112,366047826087','29,3414492753623','1,48188405797101','Banana, ouro, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('181','77,9095279250741','20,3125833333333','1,22708333333333','Banana, pacova, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('182','98,2497021739131','25,956884057971','1,26811594202899','Banana, prata, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('183','74,29148','19,4111666666667','0,954166666666666','Cacau, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('184','45,5809687737227','11,4341666666667','1,27916666666667','Cajá-Manga, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('185','26,3322693110506','6,37441666666666','0,589583333333333','Cajá, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('186','43,0650685217391','10,2889888405797','0,971014492753623','Caju, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('187','36,56868','9,35074999999999','0,48125','Caju, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('188','45,1086266666667','10,7338333333333','0,404166666666667','Caju, suco concentrado, envasado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('189','71,3500181116462','19,32575','0,35625','Caqui, chocolate, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('190','45,7408887934287','11,4815','0,870833333333333','Carambola, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('191','75,59411','18,8574166666667','1,39791666666667','Ciriguela, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('192','49,4225587743719','10,4335833333333','1,16041666666667','Cupuaçu, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('193','48,79689','11,3869166666667','0,84375','Cupuaçu, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('194','41,4471260869565','10,2459420289855','0,967391304347826','Figo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('195','184,360717391304','50,3384057971015','0,561594202898551','Figo, enlatado, em calda');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('196','67,04562','17,1744166666667','1,08125','Fruta-pão, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('197','51,737747826087','12,4014492753623','0,898550724637681','Goiaba, branca, com casca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('198','268,959826086957','74,1236231884058','0,579710144927536','Goiaba, doce em pasta');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('199','285,587792439004','78,70275','0,414583333333333','Goiaba, doce, cascão');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('200','54,1699304347826','13,0097101449275','1,08695652173913','Goiaba, vermelha, com casca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('201','61,6218983766636','15,8395','0,845833333333333','Graviola, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('202','38,27387','9,78266666666666','0,566666666666667','Graviola, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('203','58,05315','15,2558333333333','0,6125','Jabuticaba, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('204','87,92035','22,4975833333333','1,40208333333333','Jaca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('205','26,9123','6,49425','0,885416666666667','Jambo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('206','41,0097089167039','10,6271666666667','0,545833333333333','Jamelão, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('207','51,1363304347826','11,4997101449275','1,33695652173913','Kiwi, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('208','45,4381173913043','11,4684057971015','0,978260869565218','Laranja, baía, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('209','36,6494826086956','8,69782608695652','0,652173913043478','Laranja, baía, suco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('210','51,4711286392808','12,8605833333333','1,07708333333333','Laranja, da terra, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('211','40,9560073108673','9,57333333333334','0,666666666666667','Laranja, da terra, suco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('212','45,7010387806296','11,53375','1,05625','Laranja, lima, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('213','39,3360939441324','9,16741666666668','0,714583333333333','Laranja, lima, suco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('214','36,7737652173913','8,94652173913044','1,04347826086957','Laranja, pêra, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('215','32,7097536231884','7,55420289855072','0,739130434782609','Laranja, pêra, suco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('216','46,109628783385','11,723','0,766666666666667','Laranja, valência, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('217','36,1963505876859','8,554','0,483333333333333','Laranja, valência, suco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('218','14,1037333993117','5,24666666666666','0,325','Limão, cravo, suco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('219','22,2250434782609','7,32144927536232','0,565217391304348','Limão, galego, suco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('220','31,8181534301639','11,0844166666667','0,939583333333333','Limão, tahiti, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('221','62,5318183662891','16,588','0,225','Maçã, Argentina, com casca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('222','55,5152','15,1533333333333','0,286666666666667','Maçã, Fuji, com casca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('223','404,281876666667','13,9454333333333','2,0829','Macaúba, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('224','195,627474821786','54,0035833333333','0,19375','Mamão, doce em calda, drenado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('225','45,3407478260869','11,5547826086956','0,815217391304348','Mamão, Formosa, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('226','40,1567689422966','10,43975','0,45625','Mamão, Papaia, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('227','209,376254458904','57,6366666666667','0,316666666666667','Mamão verde, doce em calda, drenado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('228','63,5003183387915','16,6626666666667','0,408333333333333','Manga, Haden, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('229','72,4867380916873','19,35225','0,410416666666667','Manga, Palmer, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('230','48,30588','12,5184166666667','0,38125','Manga, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('231','50,6921826086956','12,7715942028985','0,855072463768116','Manga, Tommy Atkins, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('232','68,4395086956521','12,2642028985507','1,98913043478261','Maracujá, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('233','38,7597','9,59749999999999','0,8125','Maracujá, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('234','41,96732','9,63599999999999','0,766666666666667','Maracujá, suco concentrado, envasado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('235','32,6066260869565','8,13927536231884','0,884057971014493','Melancia, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('236','29,3693913043478','7,52579710144927','0,677536231884058','Melão, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('237','57,5927784746488','14,862','0,883333333333333','Mexerica, Murcote, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('238','36,8713500000001','9,33700000000001','0,65','Mexerica, Rio, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('239','30,1479173913044','6,81840579710146','0,894927536231884','Morango, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('240','42,5391988681952','11,5286666666667','0,308333333333333','Nêspera, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('241','204,96677','12,9729166666667','2,33541666666667','Pequi, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('242','60,58859','16,0749166666667','0,235416666666667','Pêra, Park, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('243','53,3090478260869','14,0247826086956','0,565217391304348','Pêra, Williams, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('244','36,3275990245342','9,32100000000001','0,825','Pêssego, Aurora, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('245','63,1424347826087','16,8801449275362','0,706521739130435','Pêssego, enlatado, em calda');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('246','88,4735276668668','22,4479166666667','1,48541666666667','Pinha, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('247','41,41553','10,2441666666667','0,929166666666666','Pitanga, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('248','19,1054595023592','4,75858333333333','0,285416666666667','Pitanga, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('249','55,739','15,1058333333333','0,404166666666667','Romã, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('250','275,695642694414','72,53175','3,20625','Tamarindo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('251','37,8305999999999','9,60999999999999','0,847826086956522','Tangerina, Poncã, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('252','36,1088','8,8','0,521739130434783','Tangerina, Poncã, suco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('253','262,015195072393','26,4745833333333','2,09375','Tucumã, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('254','37,01669','9,39533333333333','0,841666666666667','Umbu, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('255','33,94329','8,78683333333333','0,5125','Umbu, polpa, congelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('256','52,8731000000001','13,5733333333333','0,746376811594203','Uva, Itália, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('257','49,06129','12,6953333333333','0,608333333333333','Uva, Rubi, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('258','57,65536','14,708','Tr','Uva, suco concentrado, envasado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('259','884','NA','NA','Azeite, de dendê');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('260','884','NA','NA','Azeite, de oliva, extra virgem');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('261','725,968926845999','0,0632999925613329','0,41470000743866','Manteiga, com sal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('262','757,540460725997','0','0,395560007095337','Manteiga, sem sal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('263','596,119516956329','0','Tr','Margarina, com óleo hidrogenado, com sal (65% de lipídeos)');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('264','722,525625804901','0','Tr','Margarina, com óleo hidrogenado, sem sal (80% de lipídeos)');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('265','594,451693333333','0','Tr','Margarina, com óleo interesterificado, com sal (65%de lipídeos)');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('266','593,13749023819','0','Tr','Margarina, com óleo interesterificado, sem sal (65% de lipídeos)');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('267','884','NA','NA','Óleo, de babaçu');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('268','884','NA','NA','Óleo, de canola');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('269','884','NA','NA','Óleo, de girassol');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('270','884','NA','NA','Óleo, de milho');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('271','884','NA','NA','Óleo, de pequi');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('272','884','NA','NA','Óleo, de soja');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('273','111,615503451188','0','23,525','Abadejo, filé, congelado, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('274','91,1035483955542','0','19,3458333333333','Abadejo, filé, congelado,cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('275','59,1130332485835','0','13,0833333333333','Abadejo, filé, congelado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('276','129,643525902867','0','27,6104166666667','Abadejo, filé, congelado, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('277','165,910560578903','0','26,1875','Atum, conserva em óleo');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('278','117,501','0','25,68','Atum, fresco, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('279','135,892966666667','0','29,0366666666667','Bacalhau, salgado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('280','139,66070105354','1,22416666666668','23,9791666666667','Bacalhau, salgado, refogado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('281','208,332743725975','3,10058333333333','24,9520833333333','Cação, posta, com farinha de trigo, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('282','116,014480687658','0','25,5895833333333','Cação, posta, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('283','83,3330250195662','0','17,8541666666667','Cação, posta, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('284','90,0136800963084','0','18,9666666666667','Camarão, Rio Grande, grande, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('285','47,1834367054304','0','9,99166666666667','Camarão, Rio Grande, grande, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('286','231,246153850873','2,87983333333333','18,3875','Camarão, Sete Barbas, sem cabeça, com casca, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('287','82,7215015078386','0','18,4791666666667','Caranguejo, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('288','128,1554','-0,0266666666666662','17,3666666666667','Corimba, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('289','261,452439410567','0','19,8979166666667','Corimbatá, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('290','238,696104867339','0','20,13125','Corimbatá, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('291','101,009033333333','0','18,9166666666667','Corvina de água doce, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('292','94','0','18,57','Corvina do mar, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('293','146,528141125361','0','26,7666666666667','Corvina grande, assada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('294','100,078124552965','0','23,4375','Corvina grande, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('295','131,20831472377','0','18,8104166666667','Dourada de água doce, fresca');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('296','130,840311009487','0','16,8125','Lambari, congelado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('297','326,868399886608','0','28,425','Lambari, congelado, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('298','151,598346503218','0','15,6520833333333','Lambari, fresco, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('299','343,550458723068','10,2403333333333','23,45','Manjuba, com farinha de trigo, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('300','349,325231455366','0','30,1395833333333','Manjuba, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('301','121,910218333333','0','26,6041666666667','Merluza, filé, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('302','89,1308666666666','0','16,6066666666667','Merluza, filé, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('303','191,627478375832','0','26,9291666666667','Merluza, filé, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('304','110,8763','0','16,2633333333333','Pescada, branca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('305','223,039732369304','0','27,35625','Pescada, branca, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('306','283,425214431961','5,03325000000001','21,4354166666667','Pescada, filé, com farinha de trigo, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('307','107,205566666667','0','16,65','Pescada, filé, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('308','154,270025','0','28,5875','Pescada, filé, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('309','141,958322875023','5,01533333333334','11,75','Pescada, filé, molho escabeche');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('310','76,4089083333333','0','15,4791666666667','Pescadinha, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('311','191,559141127586','0','36,45','Pintado, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('312','91,0832333333333','0','18,5566666666667','Pintado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('313','152,190088333333','0','30,7958333333333','Pintado, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('314','93,0245666666667','0','20,49','Porquinho, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('315','228,731775135318','0','23,91875','Salmão, filé, com pele, fresco,  grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('316','169,781579910556','0','19,2520833333333','Salmão, sem pele, fresco, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('317','242,706569487095','0','26,1416666666667','Salmão, sem pele, fresco, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('318','164,350788333333','0','32,1791666666667','Sardinha, assada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('319','284,981004871249','0','15,9395833333333','Sardinha, conserva em óleo');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('320','257,0407','0','33,3833333333333','Sardinha, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('321','113,900366666667','0','21,0766666666667','Sardinha, inteira, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('322','87,686483549277','-0,0450000000000079','17,9583333333333','Tucunaré, filé, congelado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('323','128,857255812009','2,862','13,45','Apresuntado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('324','240,623333333333','15,0533333333333','7,82','Caldo de carne, tablete');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('325','251,445666666667','10,6455','6,27916666666667','Caldo de galinha, tablete');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('326','212,4204','0','26,6866666666667','Carne, bovina, acém, moído, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('327','136,562333333333','0','19,42','Carne, bovina, acém, moído, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('328','214,610566666667','0','27,27','Carne, bovina, acém, sem gordura, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('329','144,029433333333','0','20,8166666666667','Carne, bovina, acém, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('330','189,256666666667','9,79416666666665','12,3125','Carne, bovina, almôndegas, cruas');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('331','271,813','14,28675','18,15625','Carne, bovina, almôndegas, fritas');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('332','133,022866666667','0','21,64','Carne, bovina, bucho, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('333','137,303166666667','0','20,53','Carne, bovina, bucho, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('334','216,908966666667','0','19,1966666666667','Carne, bovina, capa de contra-filé, com gordura, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('335','311,702666666667','0','30,6866666666667','Carne, bovina, capa de contra-filé, com gordura, grelhada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('336','131,062466666667','0','21,54','Carne, bovina, capa de contra-filé, sem gordura, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('337','239,443633333333','-0,00666666666667481','35,0633333333333','Carne, bovina, capa de contra-filé, sem gordura, grelhada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('338','262,780142262181','0','36,3645833333333','Carne, bovina, charque, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('339','248,861018107454','0','22,7145833333333','Carne, bovina, charque, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('340','351,592659198999','12,1745','20,6125','Carne, bovina, contra-filé, à milanesa');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('341','202,4374','0','19,8','Carne, bovina, contra-filé de costela, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('342','274,914266666667','0','29,88','Carne, bovina, contra-filé de costela, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('343','205,8567','0','21,15','Carne, bovina, contra-filé, com gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('344','278,053566666667','0','32,3966666666667','Carne, bovina, contra-filé, com gordura, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('345','156,615833333333','0','23,9966666666667','Carne, bovina, contra-filé, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('346','193,691566666667','0','35,8833333333333','Carne, bovina, contra-filé, sem gordura, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('347','373,038866666667','0','28,8066666666667','Carne, bovina, costela, assada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('348','357,722466666667','0','16,7066666666667','Carne, bovina, costela, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('349','216,616066666667','0','31,88','Carne, bovina, coxão duro, sem gordura, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('350','147,966333333333','0','21,5133333333333','Carne, bovina, coxão duro, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('351','218,6751','0','32,3833333333333','Carne, bovina, coxão mole, sem gordura, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('352','169,065966666667','0','21,23','Carne, bovina, coxão mole, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('353','330,100290833333','0','28,63125','Carne, bovina, cupim, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('354','221,3975','0','19,5366666666667','Carne, bovina, cupim, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('355','141,045866666667','1,10666666666667','20,7133333333333','Carne, bovina, fígado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('356','225,0264','4,2','29,86','Carne, bovina, fígado, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('357','142,864266666667','0','21,6','Carne, bovina, filé mingnon, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('358','219,7026','0','32,8','Carne, bovina, filé mingnon, sem gordura, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('359','195,575366666667','0','29,3766666666667','Carne, bovina, flanco, sem gordura, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('360','141,4601','0','19,9966666666667','Carne, bovina, flanco, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('361','338,445733333333','0','24,24','Carne, bovina, fraldinha, com gordura, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('362','220,723766666667','0','17,5833333333333','Carne, bovina, fraldinha, com gordura, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('363','222,468566666667','0','32,8633333333333','Carne, bovina, lagarto, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('364','134,864566666667','0','20,5433333333333','Carne, bovina, lagarto, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('365','314,9016','0','21,3666666666667','Carne, bovina, língua, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('366','215,249766666667','0','17,09','Carne, bovina, língua, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('367','152,765866666667','0','20,9333333333333','Carne, bovina, maminha, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('368','153,089675833333','0','30,7354166666667','Carne, bovina, maminha, grelhada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('369','162,871233333333','0','21,61','Carne, bovina, miolo de alcatra, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('370','241,363966666667','0','31,93','Carne, bovina, miolo de alcatra, sem gordura, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('371','193,800333333333','0','31,2333333333333','Carne, bovina, músculo, sem gordura, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('372','141,581','0','21,56','Carne, bovina, músculo, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('373','158,7099','0','21,41','Carne, bovina, paleta, com gordura, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('374','193,6524','0','29,72','Carne, bovina, paleta, sem gordura, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('375','140,9415','0','21,03','Carne, bovina, paleta, sem gordura, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('376','133,4689','0','21,7233333333333','Carne, bovina, patinho, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('377','219,259266666667','0','35,9','Carne, bovina, patinho, sem gordura, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('378','338,473133333333','0','22,2466666666667','Carne, bovina, peito, sem gordura, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('379','259,275633333333','0','17,5566666666667','Carne, bovina, peito, sem gordura, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('380','212,879433333333','0','18,8233333333333','Carne, bovina, picanha, com gordura, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('381','288,767091666667','0','26,4208333333333','Carne, bovina, picanha, com gordura, grelhada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('382','133,522366666667','0','21,25','Carne, bovina, picanha, sem gordura, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('383','238,468133333333','0','31,9066666666667','Carne, bovina, picanha, sem gordura, grelhada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('384','312,799033691446','0','26,93125','Carne, bovina, seca, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('385','312,748427903652','0','19,6583333333333','Carne, bovina, seca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('386','283,048','34,5205833333333','9,61041666666667','Coxinha de frango, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('387','245,771925297141','13,9495833333333','12,04375','Croquete, de carne, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('388','346,742014647404','18,1461666666667','16,8625','Croquete, de carne, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('389','358,191666666667','47,4929166666667','6,94375','Empada de frango, pré-cozida, assada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('390','377,479666666667','35,5289166666667','7,34375','Empada, de frango, pré-cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('391','213,188333333333','0','18,1','Frango, asa, com pele, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('392','242,889326666667','0','23,8833333333333','Frango, caipira, inteiro, com pele, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('393','195,760296666667','0','29,575','Frango, caipira, inteiro, sem pele, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('394','221,502833333333','0','12,5833333333333','Frango, coração, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('395','207,273643333333','0,607416666666658','22,4395833333333','Frango, coração, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('396','215,11864753294','0,05833333333334','28,4916666666667','Frango, coxa, com pele, assada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('397','161,474733333333','0','17,0933333333333','Frango, coxa, com pele, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('398','167,428032164415','0','26,8583333333333','Frango, coxa, sem pele, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('399','119,947466666667','0,019999999999997','17,8133333333333','Frango, coxa, sem pele, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('400','106,484566666667','-0,0233333333333381','17,5866666666667','Frango, fígado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('401','220,87278','7,51291666666666','28,4604166666667','Frango, filé, à milanesa');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('402','226,319166666667','0','16,4433333333333','Frango, inteiro, com pele, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('403','187,337796666667','0','28,025','Frango, inteiro, sem pele, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('404','170,389975833333','0','24,9854166666667','Frango, inteiro, sem pele, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('405','129,0964','0','20,5866666666667','Frango, inteiro, sem pele, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('406','211,683149530729','0','33,4166666666667','Frango, peito, com pele, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('407','149,465266666667','0','20,78','Frango, peito, com pele, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('408','162,874763346314','0','31,46875','Frango, peito, sem pele, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('409','119,159266666667','0','21,5266666666667','Frango, peito, sem pele, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('410','159,185007192612','0','32,0333333333333','Frango, peito, sem pele, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('411','259,604769166667','0','28,7020833333333','Frango, sobrecoxa, com pele, assada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('412','254,5322','0','15,46','Frango, sobrecoxa, com pele, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('413','232,883396666667','0','29,175','Frango, sobrecoxa, sem pele, assada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('414','161,7963','0','17,57','Frango, sobrecoxa, sem pele, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('415','214,836','4,15375','13,15625','Hambúrguer, bovino, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('416','258,283','6,32008333333333','19,9729166666667','Hambúrguer, bovino, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('417','209,831666666667','11,3334166666667','13,15625','Hambúrguer, bovino, grelhado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('418','218,108814166667','0','14,2395833333333','Lingüiça, frango, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('419','245,461006666667','0','18,3166666666667','Lingüiça, frango, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('420','243,6585675','0','18,1895833333333','Lingüiça, frango, grelhada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('421','227,203450833333','0','16,0645833333333','Lingüiça, porco, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('422','279,543589166667','0','20,4520833333333','Lingüiça, porco, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('423','296,489609166667','0','23,16875','Lingüiça, porco, grelhada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('424','268,819989016732','5,81591666666666','11,9520833333333','Mortadela');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('425','163,071397931377','0','26,2020833333333','Peru, congelado, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('426','93,7224338261286','0','18,0833333333333','Peru, congelado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('427','164,115336592992','0','21,5','Porco, bisteca, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('428','311,169045334856','0','33,7479166666667','Porco, bisteca, frita');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('429','280,084034902771','0','28,8895833333333','Porco, bisteca, grelhada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('430','402,168447450837','0','30,2229166666667','Porco, costela, assada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('431','255,606342061361','0','18','Porco, costela, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('432','210,234665579637','0','35,725','Porco, lombo, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('433','175,625195250114','0','22,6041666666667','Porco, lombo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('434','258,491758333333','0','18,5208333333333','Porco, orelha, salgada, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('435','262,259606666667','0','32,1333333333333','Porco, pernil, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('436','186,05575','0','20,125','Porco, pernil, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('437','377,4152575','0','15,58125','Porco, rabo, salgado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('438','127,849212665637','1,3975','14,3708333333333','Presunto, com capa de gordura');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('439','93,7432807208697','2,14566666666667','14,2916666666667','Presunto, sem capa de gordura');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('440','136,228876141588','12,86125','14,59375','Quibe, assado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('441','109,490669294755','10,7741666666667','12,3541666666667','Quibe, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('442','253,83130886964','12,3374166666667','14,8895833333333','Quibe, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('443','397,842506534934','2,90625000000001','25,8104166666667','Salame');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('444','592,531175','0','11,4791666666667','Toucinho, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('445','696,564006666667','0','27,2833333333333','Toucinho, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('446','55,1648333333333','7,57000000000001','2,13333333333333','Bebida láctea, pêssego');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('447','221,483541275133','4,50952663962046','1,50780669371287','Creme de Leite');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('448','51,4895333333333','1,91666666666666','4,06333333333333','Iogurte, natural');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('449','41,4927112815583','5,77395333333333','3,83438006877899','Iogurte, natural, desnatado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('450','*','*','*','Iogurte, sabor abacaxi');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('451','69,5656','9,69333333333334','2,71','Iogurte, sabor morango');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('452','67,8494','9,43333333333334','2,53','Iogurte, sabor pêssego');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('453','312,5726','56,9966666666667','7,67','Leite, condensado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('454','66,4157418865433','5,24609333333333','3,0709067217509','Leite, de cabra');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('455','82,8209962719936','14,1583133333333','2,09902003765106','Leite, de vaca, achocolatado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('456','361,608','53,0433333333333','34,69','Leite, de vaca, desnatado, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('457','*','*','*','Leite, de vaca, desnatado, UHT');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('458','*','*','*','Leite, de vaca, integral');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('459','496,6503','39,18','25,42','Leite, de vaca, integral, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('460','69,621474','15,6744733333333','1,89486','Leite, fermentado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('461','264,273128','3,24031333333333','17,41102','Queijo, minas, frescal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('462','320,72181773326','3,57295961952209','21,2113737138112','Queijo, minas, meia cura');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('463','329,870718420887','3,04933292706807','22,6490004062653','Queijo, mozarela');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('464','452,963755333333','1,66072','35,5536133333333','Queijo, parmesão');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('465','303,079803333333','5,67633333333333','9,35733333333333','Queijo, pasteurizado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('466','121,105954','18,4620066666667','5,78666','Queijo, petit suisse, morango');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('467','359,880462405055','1,87857292683919','22,6617604064941','Queijo, prato');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('468','256,578148666667','2,43245333333333','9,62954666666667','Queijo, requeijão, cremoso');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('469','139,73178','3,78616666666667','12,6005','Queijo, ricota');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('470','25,6133333333333','6,40333333333334','0','Bebida isotônica, sabores variados');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('471','9,07086859961352','1,47866666666667','0,7125','Café, infusão 10%');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('472','215,6616','','','Cana, aguardente 1');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('473','65,3435982689857','18,151','Tr','Cana, caldo de');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('474','40,7201885506287','3,3175','0,5625','Cerveja, pilsen 2');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('475','1,39705997387564','0,391333333333321','0','Chá, erva-doce, infusão 5%');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('476','2,73074995112414','0,642999999999993','0','Chá, mate, infusão 5%');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('477','2,24790995796521','0,629666666666665','0','Chá, preto, infusão 5%');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('478','21,5085942405065','5,28466666666667','0','Coco, água de');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('479','30,7794','7,95333333333334','0','Refrigerante, tipo água tônica');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('480','33,5142','8,66000000000001','0','Refrigerante, tipo cola');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('481','38,7','10','0','Refrigerante, tipo guaraná');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('482','45,6273','11,79','0','Refrigerante, tipo laranja');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('483','39,7191','10,2633333333333','0','Refrigerante, tipo limão');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('484','268,006772182425','0,437166666666668','15,5708333333333','Omelete, de queijo');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('485','176,8939','0,772499999999999','13,6875','Ovo, de codorna, inteiro, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('486','59,4356966666667','0','13,4479166666667','Ovo, de galinha, clara, cozida/10minutos');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('487','352,67334','1,56000000000001','15,9','Ovo, de galinha, gema, cozida/10minutos');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('488','145,70017','0,614916666666674','13,29375','Ovo, de galinha, inteiro, cozido/10minutos');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('489','143,111733333333','1,63666666666667','13,03','Ovo, de galinha, inteiro, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('490','240,187224009117','1,19366666666666','15,6166666666667','Ovo, de galinha, inteiro, frito');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('491','401,02','91,1766666666667','4,20333333333333','Achocolatado, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('492','386,845724','99,61','0,32','Açúcar, cristal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('493','368,554822524389','94,45','0,758333333333333','Açúcar, mascavo');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('494','386,574824','99,54','0,32','Açúcar, refinado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('495','539,586666666667','59,5766666666667','7,22','Chocolate, ao leite');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('496','558,876333333333','55,3768333333333','7,4125','Chocolate, ao leite, com castanha do Pará');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('497','556,824333333333','56,3234166666667','6,89791666666667','Chocolate, ao leite, dietético');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('498','474,917769973274','62,4228899011612','4,86244343217214','Chocolate, meio amargo');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('499','448,84545242331','81,3831666262945','1,12183337370555','Cocada branca');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('500','198,936063049634','54,6133333333333','0,916666666666667','Doce, de abóbora, cremoso');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('501','306,310130231059','59,4933732350667','5,47829343159994','Doce, de leite, cremoso');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('502','106,086666666667','24,2316666666667','2,125','Geléia, mocotó, natural');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('503','292,118405299187','79,38','0','Glicose de milho');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('504','301,235887537','73,5534832022985','3,81285013103485','Maria mole');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('505','306,631896997018','75,0593831981023','3,93495013523102','Maria mole, coco queimado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('506','257,241473193804','70,7633333333333','0,4','Marmelada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('507','309,242666666667','84,0333333333333','0','Mel, de abelha');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('508','296,506491231918','76,6166666666667','0','Melado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('509','411,348721570849','46,2988333333333','4,7375','Quindim');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('510','351,958122101545','90,7924166666667','0,989583333333333','Rapadura');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('511','418,618666666667','65,7533333333333','14,7','Café, pó, torrado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('512','417,406666666667','73,6141666666666','11,3125','Capuccino, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('513','89,7220666511218','43,9113333479563','0,475333318710327','Fermento em pó, químico');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('514','89,7948670305888','7,69866718832652','16,9569994783401','Fermento, biológico, levedura, tablete');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('515','380,2229','89,2233333333333','8,88666666666667','Gelatina, sabores variados, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('516','NA','NA','NA','Sal, dietético');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('517','NA','NA','NA','Sal, grosso');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('518','60,9277498753866','11,6475','3,3125','Shoyu');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('519','21,33','2,07333333333334','2,66666666666667','Tempero a base de sal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('520','194,153847020984','5,5445','1,1625','Azeitona, preta, conserva');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('521','136,93643','4,10175','0,947916666666667','Azeitona, verde, conserva');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('522','314,956000266667','16,8550000666667','0,525','Chantilly, spray, com gordura vegetal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('523','166,160301615546','2,19459996350605','1,0140667031606','Leite, de coco');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('524','302,152677687824','7,89975','0,58125','Maionese, tradicional com ovos');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('525','289,211666666667','19,1138333333333','8,34583333333333','Acarajé');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('526','153,772','11,5848333333333','10,8291666666667','Arroz carreteiro');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('527','135,681333333333','20,41775','6,23958333333333','Baião de dois, arroz e feijão-de-corda');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('528','164,975234047413','0,23625','18,26875','Barreado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('529','291,229509244959','0','23,6604166666667','Bife à cavalo, com contra filé');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('530','273,514333333333','41,68275','8,03958333333333','Bolinho de arroz');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('531','100,783043004036','3,17366666666667','7,94166666666667','Camarão à baiana');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('532','78,2347292222182','10,1331666666667','6,77916666666667','Charuto, de repolho');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('533','113,459481666667','25,2814166666667','2,15625','Cuscuz, de milho, cozido com sal');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('534','142,123','22,5136666666667','2,55833333333333','Cuscuz, paulista');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('535','80,0916156365077','5,73891666666667','5,64375','Cuxá, molho');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('536','124,500200833333','0','19,7729166666667','Dobradinha');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('537','173,141364318013','2,97541666666667','15,03125','Estrogonofe de carne');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('538','156,806103013237','2,59391666666666','17,5520833333333','Estrogonofe de frango');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('539','151,561856830955','19,5818333333333','10,1708333333333','Feijão tropeiro mineiro');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('540','116,933457311034','11,6418333333333','8,67083333333333','L');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('541','112,783768841227','4,06208333333332','9,69791666666667','Frango, com açafrão');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('542','119,53177144556','22,5223668317795','4,93429983488719','Macarrão, molho bolognesa');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('543','134,222893400987','3,41933333333333','9,95833333333333','Maniçoba');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('544','86,349230299592','6,64408333333332','8,55625','Quibebe');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('545','96,1035883984566','8,92399999999999','1,05','Salada, de legumes, com maionese');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('546','35,4081042984724','7,08908333333333','2,00625','Salada, de legumes, cozida no vapor');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('547','147,864596134027','4,56899999999999','13,925','Salpicão, de frango');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('548','122,981858212431','1,09408333333334','18,4729166666667','Sarapatel');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('549','57,4534766884806','10,5810033601125','2,04632997322082','Tabule');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('550','46,8891771512032','3,39','6,95833333333333','Tacacá');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('551','347,826556257824','63,59175','0,0895833333333333','Tapioca, com manteiga');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('552','27,1837984027266','4,73774999999999','2,05625','Tucupi, com pimenta-de-cheiro');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('553','144,89697968479','10,0614166666667','5,12291666666667','Vaca atolada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('554','254,893285724155','9,74849978415171','5,99783354918162','Vatapá');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('555','306,94678645132','14,1090833333333','10,18125','Virado à paulista');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('556','112,802041253408','18,2513333333333','7,51666666666667','Yakisoba');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('557','544,052655799433','20,3135333333333','27,1908001899719','Amendoim, grão, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('558','605,781092917019','18,702486509641','22,4751801570257','Amendoim, torrado, salgado');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('559','88,0935819997785','14,2275833333333','7,45208333333333','Ervilha, em vagem');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('560','73,8447043478261','13,4421739130435','4,59782608695652','Ervilha, enlatada, drenada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('561','76,4240856666667','13,5910333333333','4,775','Feijão, carioca, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('562','329,026736231884','61,2214492753623','19,981884057971','Feijão, carioca, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('563','78,0088966666667','13,4995833333333','5,09375','Feijão, fradinho, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('564','339,164766666667','61,24','20,2083333333333','Feijão, fradinho, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('565','92,73992','16,49525','6,14375','Feijão, jalo, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('566','327,905266666667','61,4791666666667','20,1041666666667','Feijão, jalo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('567','77,0272666666667','14,0051666666667','4,47916666666667','Feijão, preto, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('568','323,565711594203','58,752463768116','21,3442028985507','Feijão, preto, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('569','84,7018527334929','15,2675','5,5375','Feijão, rajado, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('570','325,844411162734','62,9291666666667','17,2708333333333','Feijão, rajado, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('571','67,8662287714283','11,82275','4,53958333333333','Feijão, rosinha, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('572','336,961911127567','62,2233333333333','20,9166666666667','Feijão, rosinha, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('573','76,8933823179006','12,9081666666667','5,72083333333333','Feijão, roxo, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('574','331,414977456729','59,9866666666667','22,1666666666667','Feijão, roxo, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('575','354,7028765891','57,8841666666667','21,2291666666667','Grão-de-bico, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('576','344,133651284993','64,0004166666667','18,9645833333333','Guandu, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('577','92,6387662522991','16,30225','6,31041666666667','Lentilha, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('578','339,141240203553','62,0044927536232','23,1521739130435','Lentilha, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('579','486,927086464524','52,3761666666667','15,9958333333333','Paçoca, amendoim');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('580','503,190365839956','54,730426574707','13,1622400919596','Pé-de-moleque, amendoim');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('581','403,955845810399','38,4398997592926','36,0301002407074','Soja, farinha');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('582','39,1048552753508','4,27526333333334','2,38107001590729','Soja, extrato solúvel, natural, fluido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('583','458,895729437868','28,4828333333333','35,6875002384186','Soja, extrato solúvel, pó');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('584','64,4850940738902','2,12682333333333','6,55317671044668','Soja, queijo (tofu)');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('585','381,278173960129','43,7863333333333','33,575','Tremoço, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('586','120,642585344871','12,3893333333333','11,1083333333333','Tremoço, em conserva');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('587','580,74695455607','29,54724','18,5547593851089','Amêndoa, torrada, salgada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('588','570,167626501619','29,134966000557','18,5093673327764','Castanha-de-caju, torrada, salgada');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('589','642,963071681069','15,07865989844','14,53634010156','Castanha-do-Brasil, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('590','406,48735310781','10,401665876893','3,69183412310697','Coco, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('591','*','*','*','Coco,  verde, cru');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('592','328,771400244834','79,1730666160583','1,40626671727498','Farinha, de mesocarpo de babaçu, crua');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('593','583,546714754549','21,6176659049988','21,1646674283346','Gergelim, semente');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('594','495,096113843651','43,3121994931539','14,0838671735128','Linhaça, semente');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('595','174,369902','43,9176333333333','2,98036666666667','Pinhão, cozido');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('596','218,533880876601','29,5694166666667','2,52291666666667','Pupunha, cozida');
INSERT INTO `foods`(`
id`,
`kcal
`, `carbo`, `proteins`, `name`) VALUES
('597','620,060019790567','18,3638661638896','13,9708005027771','Noz, crua');
-- Copiando dados para a tabela kaizen.workout_exercises: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

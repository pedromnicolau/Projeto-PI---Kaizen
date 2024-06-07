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
CREATE DATABASE IF NOT EXISTS `kaizen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `kaizen`;

-- Copiando estrutura para tabela kaizen.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `imc` float DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando estrutura para tabela kaizen.exercises
CREATE TABLE IF NOT EXISTS `exercises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `target_muscle` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `fk_users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_exercises_2` (`fk_users_id`),
  CONSTRAINT `FK_exercises_2` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.exercises: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.foods
CREATE TABLE IF NOT EXISTS `foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kcal` float DEFAULT NULL,
  `carbo` float DEFAULT NULL,
  `proteins` float DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.foods: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.meals
CREATE TABLE IF NOT EXISTS `meals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `fk_users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_meals_2` (`fk_users_id`),
  CONSTRAINT `FK_meals_2` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.meals: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.meal_foods
CREATE TABLE IF NOT EXISTS `meal_foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `fk_meals_id` int(11) DEFAULT NULL,
  `fk_foods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_meal_foods_2` (`fk_meals_id`),
  KEY `FK_meal_foods_3` (`fk_foods_id`),
  CONSTRAINT `FK_meal_foods_2` FOREIGN KEY (`fk_meals_id`) REFERENCES `meals` (`id`),
  CONSTRAINT `FK_meal_foods_3` FOREIGN KEY (`fk_foods_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.meal_foods: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.timers
CREATE TABLE IF NOT EXISTS `timers` (
  `work` int(11) DEFAULT NULL,
  `rest` int(11) DEFAULT NULL,
  `rounds` int(11) DEFAULT NULL,
  `sets` int(11) DEFAULT NULL,
  `sets_rest` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `fk_users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_timers_2` (`fk_users_id`),
  CONSTRAINT `FK_timers_2` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.timers: ~0 rows (aproximadamente)


-- Copiando dados para a tabela kaizen.users: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.workouts
CREATE TABLE IF NOT EXISTS `workouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `fk_users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_workouts_2` (`fk_users_id`),
  CONSTRAINT `FK_workouts_2` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.workouts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaizen.workout_exercises
CREATE TABLE IF NOT EXISTS `workout_exercises` (
  `quantity` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_workouts_id` int(11) DEFAULT NULL,
  `fk_exercises_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_workout_exercises_2` (`fk_workouts_id`),
  KEY `FK_workout_exercises_3` (`fk_exercises_id`),
  CONSTRAINT `FK_workout_exercises_2` FOREIGN KEY (`fk_workouts_id`) REFERENCES `workouts` (`id`),
  CONSTRAINT `FK_workout_exercises_3` FOREIGN KEY (`fk_exercises_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaizen.workout_exercises: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

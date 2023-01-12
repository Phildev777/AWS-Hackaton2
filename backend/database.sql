-- MySQL Script generated by MySQL Workbench
-- Thu Jan 12 10:18:49 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aws
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aws
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aws` DEFAULT CHARACTER SET utf8 ;
USE `aws` ;

-- -----------------------------------------------------
-- Table `aws`.`Destination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aws`.`Destination` (
  `idGarage` INT NOT NULL AUTO_INCREMENT,
  `nom_destination` VARCHAR(124) NOT NULL,
  `distance` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGarage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aws`.`Mission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aws`.`Mission` (
  `idMission` INT NOT NULL AUTO_INCREMENT,
  `nom_mission` VARCHAR(45) NOT NULL,
  `duree` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMission`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aws`.`Utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aws`.`Utilisateur` (
  `idUtilisateur` INT NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` VARCHAR(45) NOT NULL,
  `admin` TINYINT NOT NULL,
  `compagnie` TINYINT NOT NULL,
  `salarie` TINYINT NOT NULL,
  PRIMARY KEY (`idUtilisateur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aws`.`Voiture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aws`.`Voiture` (
  `idVoiture` INT NOT NULL AUTO_INCREMENT,
  `immatriculation` VARCHAR(45) NOT NULL,
  `maintenance` TINYINT NOT NULL,
  `marque` VARCHAR(45) NOT NULL,
  `modele` VARCHAR(45) NOT NULL,
  `type` VARCHAR(124) NOT NULL,
  `image_voiture` VARCHAR(1024) NOT NULL,
  `date` DATE NOT NULL,
  `disponible` TINYINT NOT NULL,
  `autonomie` VARCHAR(45) NOT NULL,
  `Destination_idGarage` INT NOT NULL,
  `Mission_idMission` INT NOT NULL,
  `Utilisateur_idUtilisateur` INT NOT NULL,
  PRIMARY KEY (`idVoiture`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`),
  INDEX `fk_Voiture_Destination_idx` (`Destination_idGarage` ASC) VISIBLE,
  INDEX `fk_Voiture_Mission1_idx` (`Mission_idMission` ASC) VISIBLE,
  INDEX `fk_Voiture_Utilisateur1_idx` (`Utilisateur_idUtilisateur` ASC) VISIBLE,
  CONSTRAINT `fk_Voiture_Destination`
    FOREIGN KEY (`Destination_idGarage`)
    REFERENCES `aws`.`Destination` (`idGarage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voiture_Mission1`
    FOREIGN KEY (`Mission_idMission`)
    REFERENCES `aws`.`Mission` (`idMission`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voiture_Utilisateur1`
    FOREIGN KEY (`Utilisateur_idUtilisateur`)
    REFERENCES `aws`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `aws`.`Destination`
-- -----------------------------------------------------
START TRANSACTION;
USE `aws`;
INSERT INTO `aws`.`Destination` (`idGarage`, `nom_destination`, `distance`) VALUES (1, 'Parc machine', '0');
INSERT INTO `aws`.`Destination` (`idGarage`, `nom_destination`, `distance`) VALUES (3, 'Paris', '100');
INSERT INTO `aws`.`Destination` (`idGarage`, `nom_destination`, `distance`) VALUES (4, 'Nord', '500');
INSERT INTO `aws`.`Destination` (`idGarage`, `nom_destination`, `distance`) VALUES (5, 'Ouest', '700');
INSERT INTO `aws`.`Destination` (`idGarage`, `nom_destination`, `distance`) VALUES (6, 'Est', '900');
INSERT INTO `aws`.`Destination` (`idGarage`, `nom_destination`, `distance`) VALUES (7, 'Sud', '1100');
INSERT INTO `aws`.`Destination` (`idGarage`, `nom_destination`, `distance`) VALUES (2, 'Garage', '50');

COMMIT;


-- -----------------------------------------------------
-- Data for table `aws`.`Mission`
-- -----------------------------------------------------
START TRANSACTION;
USE `aws`;
INSERT INTO `aws`.`Mission` (`idMission`, `nom_mission`, `duree`) VALUES (4, 'Demarchage', '7');
INSERT INTO `aws`.`Mission` (`idMission`, `nom_mission`, `duree`) VALUES (3, 'Livraison', '1');
INSERT INTO `aws`.`Mission` (`idMission`, `nom_mission`, `duree`) VALUES (2, 'Reparation', '3');
INSERT INTO `aws`.`Mission` (`idMission`, `nom_mission`, `duree`) VALUES (1, 'Libre', '0');

COMMIT;


-- -----------------------------------------------------
-- Data for table `aws`.`Utilisateur`
-- -----------------------------------------------------
START TRANSACTION;
USE `aws`;
INSERT INTO `aws`.`Utilisateur` (`idUtilisateur`, `nom_utilisateur`, `admin`, `compagnie`, `salarie`) VALUES (1, 'Administrateur', 1, 0, 0);
INSERT INTO `aws`.`Utilisateur` (`idUtilisateur`, `nom_utilisateur`, `admin`, `compagnie`, `salarie`) VALUES (2, 'Compagnie', 0, 1, 0);
INSERT INTO `aws`.`Utilisateur` (`idUtilisateur`, `nom_utilisateur`, `admin`, `compagnie`, `salarie`) VALUES (3, 'Livreur', 0, 0, 1);
INSERT INTO `aws`.`Utilisateur` (`idUtilisateur`, `nom_utilisateur`, `admin`, `compagnie`, `salarie`) VALUES (4, 'Commercial', 0, 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `aws`.`Voiture`
-- -----------------------------------------------------
START TRANSACTION;
USE `aws`;
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (1, 'ES-991-RL', 0, 'RENAULT', 'Clio', 'coupe', 'https://cdn.pixabay.com/photo/2015/01/19/13/51/car-604019_1280.jpg', '2020-11-12', 1, '500', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (2, 'RT-123-YA', 1, 'RENAULT', 'Megane', 'berline', 'https://cdn.pixabay.com/photo/2016/12/03/18/57/car-1880381_1280.jpg', '2021-12-20', 0, '850', 2, 2, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (3, 'SD-588-CV', 0, 'PEUGEOT', '308', 'utilitaire', 'https://cdn.pixabay.com/photo/2014/09/07/17/09/car-438030_1280.jpg', '2019-05-05', 0, '1050', 6, 3, 3);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (4, 'RF-147-UJ', 0, 'FIAT', 'Panda', 'coupe', 'https://images.pexels.com/photos/4391470/pexels-photo-4391470.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2010-02-01', 0, '600', 7, 4, 4);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (5, 'UO-247-NG', 1, 'RENAULT', 'K2021', 'Camion', 'https://images.unsplash.com/photo-1638236816117-4a5a1ae65914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', '2016-06-08', 0, '1600', 2, 2, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (6, 'PL-875-OP', 0, 'OPEL', 'Corsa', 'SUV', 'https://cdn.pixabay.com/photo/2014/09/07/17/09/car-438029_1280.jpg', '2018-04-23', 0, '650', 5, 4, 4);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (7, 'XD-924-KL', 0, 'CITROEN', 'C4', 'SUV', 'https://images.pexels.com/photos/119435/pexels-photo-119435.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2017-03-21', 1, '900', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (8, 'FR-257-pl', 0, 'FORD', 'Mustang', 'cabriolet', 'https://images.pexels.com/photos/4839260/pexels-photo-4839260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2016-04-13', 0, '550', 6, 4, 4);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (9, 'DK-567-GB', 1, 'NISSAN', 'Micra', 'coupe', 'https://images.pexels.com/photos/892522/pexels-photo-892522.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2015-06-25', 0, '900', 2, 2, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (10, 'SC-738-YU', 0, 'PEUGEOT', '407', 'SUV', 'https://cdn.pixabay.com/photo/2014/09/07/17/09/car-438029_1280.jpg', '2012-05-19', 1, '750', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (11, 'KJ-198-HJ', 0, 'CITROEN', 'C5', 'berline', 'https://images.pexels.com/photos/794435/pexels-photo-794435.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2016-11-03', 1, '700', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (12, 'JS-483-RG', 0, 'RENAULT', 'Kadjar', 'SUV', 'https://images.pexels.com/photos/14776590/pexels-photo-14776590.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2017-11-24', 1, '1000', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (13, 'GL-537-SP', 1, 'PEUGEOT', '307', 'coupe', 'https://images.pexels.com/photos/5976660/pexels-photo-5976660.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2018-09-11', 0, '850', 2, 2, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (14, 'FM-537-XN', 0, 'CITROEN', 'BX', 'berline', 'https://images.pexels.com/photos/100656/pexels-photo-100656.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2012-05-17', 0, '700', 7, 3, 3);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (15, 'LS-531-MS', 0, 'RENAULT', 'Clio', 'coupe', 'https://images.pexels.com/photos/1005633/pexels-photo-1005633.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2013-04-12', 0, '950', 5, 3, 3);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (16, 'JS-861-CE', 0, 'RENAULT', 'Megane', 'coupe', 'https://images.pexels.com/photos/100653/pexels-photo-100653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2014-05-25', 0, '900', 6, 4, 4);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (17, 'HZ-448-FC', 1, 'PEUGEOT', '206', 'coupe', 'https://images.unsplash.com/photo-1541899481282-d53bffe3c35d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', '2015-04-05', 0, '700', 2, 2, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (18, 'BY-735-TL', 0, 'RENAULT', 'Captur', 'coupe', 'https://images.unsplash.com/photo-1541443131876-44b03de101c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', '2016-07-24', 1, '800', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (19, 'LM-438-ED', 0, 'AUDI', 'TT', 'coupe', 'https://images.unsplash.com/photo-1504215680853-026ed2a45def?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', '2018-06-14', 1, '450', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (20, 'DP-864-OP', 0, 'Porshe', 'Carerra', 'coupe', 'https://images.unsplash.com/photo-1542362567-b07e54358753?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', '2017-12-08', 0, '500', 6, 4, 4);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (21, 'FG-421-AM', 1, 'BMW', 'S3', 'berline', 'https://images.unsplash.com/photo-1546614042-7df3c24c9e5d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', '2016-10-05', 0, '600', 2, 2, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (22, 'JS-457-WO', 0, 'AUDI', 'TT', 'coupe', 'https://images.unsplash.com/photo-1532974297617-c0f05fe48bff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80', '2015-03-15', 1, '700', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (23, 'GI-193-HR', 1, 'AUDI', 'Quadro', 'SUV', 'https://images.unsplash.com/photo-1592840062661-a5a7f78e2056?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80', '2016-08-12', 0, '900', 2, 2, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (24, 'LK-534-FP', 0, 'BMW', 'S4', 'berline', 'https://images.unsplash.com/photo-1560253787-9c3babc1fab2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', '2017-04-18', 1, '850', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (25, 'SF-485-TB', 0, 'PEUGEOT', 'Partner', 'utilitaire', 'https://cdn.pixabay.com/photo/2014/09/07/17/09/car-438029_1280.jpg', '2014-12-02', 0, '950', 4, 3, 3);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (26, 'LC-522-TY', 1, 'NISSAN', 'Juke', 'SUV', 'https://images.pexels.com/photos/116675/pexels-photo-116675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2017-10-26', 0, '1000', 2, 2, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (27, 'GA-829-AJ', 0, 'JEEP', 'Jeep', 'jeep', 'https://images.pexels.com/photos/1638459/pexels-photo-1638459.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2009-11-10', 1, '1100', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (28, 'PC-438-SO', 0, 'OPEL', 'Corsa', 'coupe', 'https://images.unsplash.com/photo-1582639510494-c80b5de9f148?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=843&q=80', '2013-05-22', 1, '850', 1, 1, 2);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (29, 'JF-417-ZP', 0, 'AUSTIN', 'Mini Cooper', 'coupe', 'https://images.unsplash.com/photo-1617624085810-3df2165bd11b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', '2016-10-27', 0, '650', 3, 4, 4);
INSERT INTO `aws`.`Voiture` (`idVoiture`, `immatriculation`, `maintenance`, `marque`, `modele`, `type`, `image_voiture`, `date`, `disponible`, `autonomie`, `Destination_idGarage`, `Mission_idMission`, `Utilisateur_idUtilisateur`) VALUES (30, 'FZ-167-LR', 0, 'PEUGEOT', '307', 'coupe', 'https://images.pexels.com/photos/14648100/pexels-photo-14648100.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', '2018-12-06', 1, '750', 1, 1, 2);

COMMIT;


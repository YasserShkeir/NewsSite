-- MySQL Script generated by MySQL Workbench
-- Fri Sep 23 11:50:59 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`publisher` (
  `id` INT NOT NULL,
  `publisherName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`writer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`writer` (
  `id` INT NOT NULL,
  `writerFname` VARCHAR(45) NULL,
  `writerLname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`newsArticles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`newsArticles` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  `dateWritten` VARCHAR(45) NULL,
  `dateUpdated` VARCHAR(45) NULL,
  `publisher_id` INT NOT NULL,
  `writer_id` INT NOT NULL,
  PRIMARY KEY (`id`, `writer_id`),
  INDEX `fk_newsArticles_publisher_idx` (`publisher_id` ASC) VISIBLE,
  INDEX `fk_newsArticles_writer1_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `fk_newsArticles_publisher`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `mydb`.`publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_newsArticles_writer1`
    FOREIGN KEY (`writer_id`)
    REFERENCES `mydb`.`writer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- MySQL Script generated by MySQL Workbench
-- Fri Mar 11 10:56:48 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mercadinho
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mercadinho
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mercadinho` ;
USE `Mercadinho` ;

-- -----------------------------------------------------
-- Table `Mercadinho`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercadinho`.`produtos` (
  `id` INT UNSIGNED NOT NULL,
  `nome` VARCHAR(45) NULL,
  `preco` DECIMAL(9,4) NULL,
  `estoque` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercadinho`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercadinho`.`Cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `fone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercadinho`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercadinho`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `cliente` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedidos_Cliente_idx` (`cliente` ASC),
  CONSTRAINT `fk_pedidos_Cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `Mercadinho`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercadinho`.`itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercadinho`.`itens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produto` INT NULL,
  `pedido` INT NULL,
  `qtd` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_itens_pedidos1_idx` (`pedido` ASC),
  INDEX `fk_itens_produtos1_idx` (`produto` ASC),
  CONSTRAINT `fk_itens_pedidos1`
    FOREIGN KEY (`pedido`)
    REFERENCES `Mercadinho`.`pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_produtos1`
    FOREIGN KEY (`produto`)
    REFERENCES `Mercadinho`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

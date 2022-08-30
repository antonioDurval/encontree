-- MySQL Script generated by MySQL Workbench
-- Tue Aug 30 17:14:15 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aluga_ja
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aluga_ja
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aluga_ja` DEFAULT CHARACTER SET utf8 ;
USE `aluga_ja` ;

-- -----------------------------------------------------
-- Table `aluga_ja`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluga_ja`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  `sexo` INT(1) NOT NULL,
  `descricao_usuario` LONGTEXT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `url_foto_usuario` VARCHAR(2083) NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `idade` INT(3) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aluga_ja`.`imovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluga_ja`.`imovel` (
  `id_imovel` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(100) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `ponto_referencia` VARCHAR(100) NULL,
  `quantidade_quartos` INT NOT NULL,
  `quantidade_banheiros` INT NOT NULL,
  `garagem_vaga` TINYINT NOT NULL,
  `tipo_imovel` VARCHAR(45) NOT NULL,
  `usuario_id_usuario` INT NOT NULL,
  `numero` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_imovel`, `usuario_id_usuario`),
  INDEX `fk_imovel_usuario_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_imovel_usuario`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `aluga_ja`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

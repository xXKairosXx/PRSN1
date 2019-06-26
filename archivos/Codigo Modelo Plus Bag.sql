CREATE DATABASE PlusBag;
USE PlusBag;

-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Administrador` (
  `CodigoAdmi` INT NOT NULL,
  `NombreUsuario` VARCHAR(25) NULL,
  `Contraseña` VARCHAR(30) NULL,
  PRIMARY KEY (`CodigoAdmi`));
show tables;
describe Administrador;


-- -----------------------------------------------------
-- Table `mydb`.`Inventariado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Inventariado` (
  `idgestion` INT NOT NULL,
  `TipodeArticulo` VARCHAR(45) NULL,
  `EstadoArticulo` ENUM('Dado de baja', 'Deteriorado', 'Extraviado') NULL,
  `CantidadArticulo` INT NULL,
  `MarcaArticulo` VARCHAR(15) NULL,
  `DescripcionArticulo` VARCHAR(100) NULL,
  PRIMARY KEY (`idgestion`));
show tables;
describe Inventariado;


-- -----------------------------------------------------
-- Table `mydb`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `NombrePro` VARCHAR(45) NULL,
  `TelefonoPro` VARCHAR(10) NULL,
  `DirrecionPro` VARCHAR(40) NULL,
  `CorreoPro` VARCHAR(30) NULL,
  `Proveedorcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedor`));
show tables;
describe Proveedor;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Producto` (
  `CodProducto` INT NOT NULL,
  `Nombre` VARCHAR(30) NULL,
  `Descripciòn` VARCHAR(50) NULL,
  `NumeroExistencias` INT NULL,
  `Inventariado_idgestion` INT NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  PRIMARY KEY (`CodProducto`),
  INDEX `fk_Articulo_Inventariado1_idx` (`Inventariado_idgestion` ASC) VISIBLE,
  INDEX `fk_Articulo_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Articulo_Inventariado1`
    FOREIGN KEY (`Inventariado_idgestion`)
    REFERENCES `mydb`.`Inventariado` (`idgestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Articulo_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `PlusBag`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
show tables;
describe Producto;


-- -----------------------------------------------------
-- Table `mydb`.`Control_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Control_usuario` (
  `idGestion de usuario` INT NOT NULL,
  `TipodeUsuario` ENUM('administrador', 'usuario') NULL,
  `Administrador_CodigoAdmi` INT NOT NULL,
  PRIMARY KEY (`idGestion de usuario`),
  INDEX `fk_ControlDeUsuario_Administrador1_idx` (`Administrador_CodigoAdmi` ASC) VISIBLE,
  CONSTRAINT `fk_ControlDeUsuario_Administrador1`
    FOREIGN KEY (`Administrador_CodigoAdmi`)
    REFERENCES `PlusBag`.`Administrador` (`CodigoAdmi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
show tables;
describe Control_usuario;


-- -----------------------------------------------------
-- Table `mydb`.`Movimiento_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Movimiento_Producto` (
  `idMovimientoArt` INT NOT NULL,
  `Entrada` VARCHAR(45) NULL,
  `CantidadEnt` INT NULL,
  `Salida` VARCHAR(45) NULL,
  `CantidadSal` INT NULL,
  `Articulo_CodigoDelArticulo` INT NOT NULL,
  `Administrador_CodigoAdmi` INT NOT NULL,
  PRIMARY KEY (`idMovimientoArt`),
  INDEX `fk_Movimiento_Articulo_Articulo1_idx` (`Articulo_CodigoDelArticulo` ASC) VISIBLE,
  INDEX `fk_Movimiento_Articulo_Administrador1_idx` (`Administrador_CodigoAdmi` ASC) VISIBLE,
  CONSTRAINT `fk_Movimiento_Articulo_Articulo1`
    FOREIGN KEY (`Articulo_CodigoDelArticulo`)
    REFERENCES `mydb`.`Producto` (`CodProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimiento_Articulo_Administrador1`
    FOREIGN KEY (`Administrador_CodigoAdmi`)
    REFERENCES `PlusBag`.`Administrador` (`CodigoAdmi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
show tables;
describe Movimiento_Producto;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Control_usuario_idGestion de usuario` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Control_usuario1_idx` (`Control_usuario_idGestion de usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Control_usuario1`
    FOREIGN KEY (`Control_usuario_idGestion de usuario`)
    REFERENCES `PlusBag`.`Control_usuario` (`idGestion de usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
show tables;
describe Usuario;


-- -----------------------------------------------------
-- Table `mydb`.`Reportes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Reportes` (
  `idReportes` INT NOT NULL,
  `DescripcionReporte` VARCHAR(200) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idReportes`),
  INDEX `fk_Reportes_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Reportes_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `PlusBag`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
show tables;
describe Reportes;

-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Pedido` (
  `idPedido` INT NOT NULL,
  `FechaPedido` DATE NULL,
  `FechaEntrega` DATE NULL,
  PRIMARY KEY (`idPedido`));
show tables;
describe Inventariado;

-- -----------------------------------------------------
-- Table `mydb`.`Observaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Observaciones` (
  `idObservaciones` INT NOT NULL,
  `Observacion` VARCHAR(50) NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`idObservaciones`),
  INDEX `fk_Observaciones_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Observaciones_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `PlusBag`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
show tables;
describe Inventariado;

-- -----------------------------------------------------
-- Table `mydb`.`Producto_has_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlusBag`.`Producto_has_Pedido` (
  `Producto_CodProducto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`Producto_CodProducto`, `Pedido_idPedido`),
  INDEX `fk_Producto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Producto_has_Pedido_Producto1_idx` (`Producto_CodProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_has_Pedido_Producto1`
    FOREIGN KEY (`Producto_CodProducto`)
    REFERENCES `mydb`.`Producto` (`CodProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `PlusBag`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
show tables;
describe Inventariado;
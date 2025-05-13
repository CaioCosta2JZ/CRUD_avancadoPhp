-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/05/2025 às 16:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `exemploprocedure`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `crud_aluno` (IN `var_id` INT, IN `var_nome` VARCHAR(50), IN `opcao` INT)   BEGIN
	IF(EXISTS(SELECT al_id FROM tb_aluno WHERE al_id = var_id)) THEN
    	IF(opcao = 1) THEN
        	UPDATE tb_aluno SET al_nome = var_nome WHERE al_id = var_id;
        ELSE
        	DELETE FROM tb_aluno WHERE al_id = var_id;
        END IF;
    ELSE
    	INSERT INTO tb_aluno VALUES (al_id, al_nome);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crud_curso1` (IN `var_id` INT, IN `var_nome` VARCHAR(50), IN `opcao` INT)   BEGIN
    IF EXISTS (SELECT curso_id FROM tb_curso WHERE curso_id = var_id) THEN
        IF opcao = 1 THEN
            UPDATE tb_curso SET curso_nome = var_nome WHERE curso_id = var_id;
        ELSE
            DELETE FROM tb_curso WHERE curso_id = var_id;
        END IF;
    ELSE
        INSERT INTO tb_curso (curso_id, curso_nome)
        VALUES (var_id, var_nome);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crud_estado` (IN `var_id` INT, IN `var_uf` CHAR(2), IN `var_nome` VARCHAR(50), IN `opcao` INT)   BEGIN
    if(exists(select est_id from tb_estado where est_id = var_id)) THEN
       if(opcao = 1) THEN
            update tb_estado set est_nome = var_nome, est_uf = var_uf where est_id = var_id;
            else 
                delete from tb_estado where est_id = var_id;
            end if;
          ELSE
          Insert into tb_estado values (var_id, var_uf, var_nome);
          end if;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_aluno`
--

CREATE TABLE `tb_aluno` (
  `al_id` int(11) NOT NULL,
  `al_nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_aluno`
--

INSERT INTO `tb_aluno` (`al_id`, `al_nome`) VALUES
(2, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_curso`
--

CREATE TABLE `tb_curso` (
  `curso_id` int(11) NOT NULL,
  `curso_nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_curso`
--

INSERT INTO `tb_curso` (`curso_id`, `curso_nome`) VALUES
(2, 'SEC');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_estado`
--

CREATE TABLE `tb_estado` (
  `est_id` int(11) NOT NULL,
  `est_uf` char(2) DEFAULT NULL,
  `est_nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  ADD PRIMARY KEY (`al_id`);

--
-- Índices de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  ADD PRIMARY KEY (`curso_id`);

--
-- Índices de tabela `tb_estado`
--
ALTER TABLE `tb_estado`
  ADD PRIMARY KEY (`est_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  MODIFY `al_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  MODIFY `curso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

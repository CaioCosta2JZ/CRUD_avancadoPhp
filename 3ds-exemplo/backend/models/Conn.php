<?php

/*
 * create database exemploprocedure;
 * 
 * create table tb_estado (
 * est_id int primary key auto_increment,
 * est_uf char(2)
 * est_nome varchar(50)
 * );
 * 
 * COMANDO SQL
 * 
 * 
 * 
 * DELIMITER $$
create procedure crud_estado (in var_id int, var_uf char(2), var_nome varchar(50), opcao int)
BEGIN
    if(exists(select est_id from tb_estado where est_id = var_id)) THEN
       if(opcao = 1) THEN
            update tb_estado set et_nome = var_nome, est_uf = var_uf where est_id = var_id;
            else 
                delete from tb_estado where est_id = var_id;
            end if;
          ELSE
          Insert into tb_estado values (var_id, var_uf, var_nome);
          end if;
END$$
DELIMITER ;

call crud_estado(1, 'RJ', 'Rio de Janeiro', 1);


call crud_estado(null, 'sp', 'São Paulo', 0);

call crud_estado(1, '', '', 0);
 */

class Conn extends PDO
{

    private static $instancia;
    private $host = "localhost";
    private $usuario = "root";
    private $senha = "";
    private $db = "exemploprocedure";

    public function __construct()
    {
        parent::__construct("mysql:host=$this->host;dbname=$this->db", "$this->usuario", "$this->senha");
    }

    public static function getInstance()
    {
        // Se o a instancia não existe eu faço uma
        if (!isset(self::$instancia)) {
            try {
                self::$instancia = new Conn;
            } catch (Exception $e) {
                echo 'Erro ao conectar';
                exit();
            }
        }
        // Se já existe instancia na memória eu retorno ela
        return self::$instancia;
    }
}

<div class="col-sm-12 mb-4">

    <div class="card shadow mb-4">
        <div class="table-responsive-sm mt-4">
            <h3 class="ml-3">
                Listar ALunos
                <a class="btn btn-success float-right mb-3 mr-3" href="?p=aluno/salvar"><i class="bi bi-database-add"></i></a>
            </h3>
            
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <!--consulta php-->
                </tbody>
            </table>
        </div>
    </div>
</div>

<!--
DELIMITER $$
CREATE PROCEDURE crud_aluno (IN var_id INT, var_nome varchar(50), opcao int)
BEGIN
	IF(EXISTS(SELECT al_id FROM tb_estado WHERE al_id = var_id)) THEN
    	IF(opcao = 1) THEN
        	UPDATE tb_aluno SET al_nome = var_nome WHERE al_id = var_id;
        ELSE
        	DELETE FROM tb_aluno WHERE al_id = var_id;
        END IF;
    ELSE
    	INSERT INTO tb_aluno VALUES (var_id, var_nome);
    END IF;
END$$
DELIMITER ;
-->
<?php
//capturar id da url
$id = filter_input(INPUT_GET, 'id');

include_once '../models/ALuno.php';
$aluno = new Aluno();

if (isset($id)) {
    echo "existe id";
}
?>
<div class="card shadow col-md-8 col-sm-12">
    <h3 class="ml-3 mt-3 text-primary">
        ALuno
    </h3>
    <form method="post" name="formsalvar" id="formSalvar" class="m-3" enctype="multipart/form-data">
        <?= isset($id) ? "ID " . $id : "" ?>

        <div class="form-group row">
            <label for="inputText" class="col-sm-2 col-form-label">
                Nome
            </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="txtnome" name="txtnome" placeholder="ALuno"
                    value="">
            </div>
        </div>
        

        <div class="form-group row">
            <div class="col-sm-10">
                <input type="submit"
                    class="btn <?= isset($id) ? "btn-success" : "btn-primary" ?>"
                    name=""
                    value="">
            </div>
            <a href="?p=aluno/consultar" class="btn btn-danger">Cancelar</a>
        </div>
    </form>
</div>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Cadastrar Dados.</h1>

        <form class="container jumbotron" action="cadastrar_idosos.jsp" method="POST">

            <label>
                Nome:
                <input class="form-control" type="text" name="txtNome" ">
            </label>

            <label>
                Telefone:
                <input class="form-control" type="text" name="txtTelefone">
            </label>

            <label>
                E-mail:
                <input class="form-control" type="text" name="txtEmail" >
            </label>
            <input type="submit" class="btn btn-success" value="Cadastrar">

        </form>
        <div class="container">
            <a href="listar_idosos_page.jsp"><button class="btn btn-info btn-lg" id="btn-cancelar">Cancelar</button></a>
        </div>
    </body>
</html>

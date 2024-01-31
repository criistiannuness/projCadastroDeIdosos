<%@page import="DTO.Idosos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.IdososDAO"%>
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
        <header id="topo">
            <a href="cadastrar_idosos_page.jsp"><button id="btn-novo" class="btn btn-success btn-lg">Cadastrar</button></a>
            <a href="index.html"><button id="btn-novo" class="btn btn-danger btn-lg">Sair</button></a>        
        </header>
        <main id="principal">
            <h1>Formulario do Idoso</h1>
                      
                IdososDAO objIdososDAO = new IdososDAO();

                ArrayList<Idosos> l = objIdososDAO.listarTodosOsIdosos(); 
                
                for (int i = 0; i < l.size(); i++) {
                    out.print("<div class='container jumbotron'><p>Código: " + l.get(i).getId() + "</p>");
                    out.print("<p>Nome: " + l.get(i).getNome() + "</p>");
                    out.print("<p>Telefone: " + l.get(i).getTelefone() + "</p>");
                    out.print("<p>E-mail: " + l.get(i).getEmail() + "</p><br>");
              
                    out.print("<a href='excluir_idosos_page.jsp?"
                            + "codigo=" + l.get(i).getId() + ""
                            + "&nome=" + l.get(i).getNome() + ""
                            + "&telefone=" + l.get(i).getTelefone() + ""
                            + "&email=" + l.get(i).getEmail() + "'><button class='btn btn-danger'>Excluir</button></a>");

                    out.print("<a href='alterar_idosos_page.jsp?"
                            + "codigo=" + l.get(i).getId() + ""
                            + "&nome=" + l.get(i).getNome() + ""
                            + "&telefone=" + l.get(i).getTelefone() + ""
                            + "&email=" + l.get(i).getEmail() + "'><button class='btn btn-warning'>Alterar</button></a></div>");
                
                }

            
        </main>
    </body>
</html>

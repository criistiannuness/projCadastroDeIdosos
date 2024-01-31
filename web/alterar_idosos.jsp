<%@page import="DAO.IdososDAO"%>
<%@page import="DTO.Idosos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="refresh" content="0.001; listar_idosos_page.jsp">
    </head>
    <body>
        
            Idosos objIdosos = new Idosos();
            objIdosos.setId(Integer.parseInt(request.getParameter("txtId")));
            objIdosos.setNome(request.getParameter("txtNome"));
            objIdosos.setTelefone(request.getParameter("txtTelefone"));
            objIdosos.setEmail(request.getParameter("txtEmail"));
        
            IdososDAO objIdososDAO = new IdososDAO();
            objIdososDAO.alterarIdosos(objIdosos);
            
        
    </body>
</html>

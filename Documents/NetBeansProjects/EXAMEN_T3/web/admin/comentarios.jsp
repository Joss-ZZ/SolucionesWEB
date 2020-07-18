<%-- 
    Document   : comentarios
    Created on : 14/07/2020, 11:55:40 AM
    Author     : Juxn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%boolean show=false;
            int id=Integer.parseInt(request.getParameter("id_pro"));
                    int id_venta=0;
                    Object venta=session.getAttribute("idventa");
                    if(venta=="" || venta==null){
                    }else
                    {
                        id_venta=Integer.parseInt(String.valueOf(venta));
                        show=true;
                    }%>
        <form name="editarcomentario"  action="/EXAMEN_T3/mante_carrito" method="post">
            <div class="row p-3">
                <input type="hidden" name="id_product" value="<%=id %>">
                <% if(show==true){%>
                <input type="hidden" name="id_venta" value="<%=id_venta %>">
                <%}%>
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 ">
                    <div class="row">
                        <label>Asunto:</label>
                    </div>
                    <div class="row">
                        <input type="text" class="form-control" name="titulo">
                    </div>
                    <div class="row">
                        <label>Comentario:</label>
                    </div>
                    <div class="row">
                        <textarea class="form-control" rows="3" name="comentarios"></textarea>
                    </div>
                </div> 
            </div>
            <div class="modal-footer">
                <input type="submit" value="Enviar" class="btn btn-outline-success" name="enviar">
                <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
            </div>
        </form>
    </body>
</html>

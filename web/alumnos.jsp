<%-- 
    Document   : alumnos
    Created on : 20 ene 2026, 21:20:30
    Author     : toki_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.ConexionBD"%>

<!DOCTYPE html>
<%
    if (request.getParameter("nombre") != null) {
        String nombre = request.getParameter("nombre");
        String grupo = request.getParameter("grupo");

        Connection con = ConexionBD.getConexion();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO alumno(nombre, grupo) VALUES (?, ?)"
        );
        ps.setString(1, nombre);
        ps.setString(2, grupo);
        ps.executeUpdate();
    }
%>
<html>
<head>
    <title>Gestión de Alumnos</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<!-- NAVBAR -->
<nav class="navbar navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="menu.jsp">Aprendizaje IA</a>
    </div>
</nav>

<div class="container mt-4">

    <h3 class="mb-4">Gestión de Alumnos</h3>

    <!-- FORMULARIO -->
    <div class="card mb-4">
        <div class="card-body">

            <form method="post">
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nombre del alumno</label>
                        <input type="text" name="nombre" class="form-control">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Grupo</label>
                        <input type="text" name="grupo" class="form-control">
                    </div>

                </div>

                <button class="btn btn-success">Guardar</button>
                <button class="btn btn-warning">Modificar</button>
                <button class="btn btn-danger">Eliminar</button>
            </form>

        </div>
    </div>

    <!-- TABLA -->
    <div class="card">
        <div class="card-body">

            <h5>Lista de alumnos</h5>

            <table class="table table-bordered table-striped mt-3">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Grupo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
    Connection con = ConexionBD.getConexion();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM alumno");

    while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id_alumno") %></td>
    <td><%= rs.getString("nombre") %></td>
    <td><%= rs.getString("grupo") %></td>
</tr>
<%
    }
%>
                </tbody>
            </table>

        </div>
    </div>

</div>

</body>
</html>


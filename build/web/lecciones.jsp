<%-- 
    Document   : lecciones
    Created on : 20 ene 2026, 21:23:26
    Author     : toki_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.ConexionBD"%>

<%
    // ====== GUARDAR LECCIÓN ======
    if (request.getParameter("nombre_leccion") != null) {

        String nombre = request.getParameter("nombre_leccion");
        String descripcion = request.getParameter("descripcion");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = ConexionBD.getConexion();
            ps = con.prepareStatement(
                "INSERT INTO leccion(nombre_leccion, descripcion) VALUES (?, ?)"
            );
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.executeUpdate();

        } catch (Exception e) {
            out.println("Error al guardar la lección");
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>
<%
    boolean guardadoLeccion = false;

    if (request.getParameter("nombre_leccion") != null) {
        guardadoLeccion = true;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Lecciones</title>

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

    <h3 class="mb-4">Gestión de Lecciones</h3>
    <% if (guardadoLeccion) { %>
    <div class="alert alert-success">
        Lección guardada correctamente.
    </div>
    <% } %>

    <!-- FORMULARIO -->
    <div class="card mb-4">
        <div class="card-body">

            <form method="post">

                <div class="mb-3">
                    <label class="form-label">Nombre de la lección</label>
                    <input type="text" name="nombre_leccion" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Descripción</label>
                    <textarea name="descripcion" class="form-control" required></textarea>
                </div>

                <button class="btn btn-success">Guardar</button>

            </form>

        </div>
    </div>

    <!-- TABLA -->
    <div class="card">
        <div class="card-body">

            <h5>Lista de lecciones</h5>

            <table class="table table-bordered table-striped mt-3">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Lección</th>
                        <th>Descripción</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;

                        try {
                            con = ConexionBD.getConexion();
                            st = con.createStatement();
                            rs = st.executeQuery("SELECT * FROM leccion");

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id_leccion") %></td>
                        <td><%= rs.getString("nombre_leccion") %></td>
                        <td><%= rs.getString("descripcion") %></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("Error al mostrar las lecciones");
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (st != null) st.close();
                            if (con != null) con.close();
                        }
                    %>

                </tbody>
            </table>

        </div>
    </div>

</div>

</body>
</html>



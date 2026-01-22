<%-- 
    Document   : avances
    Created on : 21 ene 2026, 22:40:35
    Author     : toki_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.ConexionBD"%>

<%
    // ====== REGISTRAR AVANCE ======
    if (request.getParameter("id_alumno") != null) {

        int idAlumno = Integer.parseInt(request.getParameter("id_alumno"));
        int idLeccion = Integer.parseInt(request.getParameter("id_leccion"));
        String estado = request.getParameter("estado");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = ConexionBD.getConexion();
            ps = con.prepareStatement(
                "INSERT INTO avance(id_alumno, id_leccion, estado) VALUES (?, ?, ?)"
            );
            ps.setInt(1, idAlumno);
            ps.setInt(2, idLeccion);
            ps.setString(3, estado);
            ps.executeUpdate();

        } catch (Exception e) {
            out.println("Error al registrar avance");
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Registro de Avances</title>

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

    <h3 class="mb-4">Registro de Avances</h3>

    <!-- FORMULARIO -->
    <div class="card mb-4">
        <div class="card-body">

            <form method="post">

                <div class="mb-3">
                    <label class="form-label">ID Alumno</label>
                    <input type="number" name="id_alumno" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">ID Lección</label>
                    <input type="number" name="id_leccion" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Estado</label>
                    <select name="estado" class="form-select">
                        <option>Completado</option>
                        <option>No completado</option>
                    </select>
                </div>

                <button class="btn btn-success">Guardar avance</button>

            </form>

        </div>
    </div>

    <!-- TABLA -->
    <div class="card">
        <div class="card-body">

            <h5>Historial de avances</h5>

            <table class="table table-bordered table-striped mt-3">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>ID Alumno</th>
                        <th>ID Lección</th>
                        <th>Estado</th>
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
                            rs = st.executeQuery("SELECT * FROM avance");

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id_avance") %></td>
                        <td><%= rs.getInt("id_alumno") %></td>
                        <td><%= rs.getInt("id_leccion") %></td>
                        <td><%= rs.getString("estado") %></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("Error al mostrar avances");
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


<%-- 
    Document   : menu
    Created on : 20 ene 2026, 21:14:38
    Author     : toki_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Menú Principal</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Aprendizaje IA - Primaria</a>
    </div>
</nav>

<div class="container mt-5">

    <h3 class="text-center mb-4">Menú Principal</h3>

    <div class="row justify-content-center">

        <!-- ALUMNOS -->
        <div class="col-md-4 mb-4">
            <div class="card text-center shadow">
                <div class="card-body">
                    <h5 class="card-title">Alumnos</h5>
                    <p class="card-text">Registro y consulta de alumnos.</p>
                    <a href="alumnos.jsp" class="btn btn-primary">Entrar</a>
                </div>
            </div>
        </div>

        <!-- LECCIONES -->
        <div class="col-md-4 mb-4">
            <div class="card text-center shadow">
                <div class="card-body">
                    <h5 class="card-title">Lecciones</h5>
                    <p class="card-text">Gestión de contenidos educativos.</p>
                    <a href="lecciones.jsp" class="btn btn-success">Entrar</a>
                </div>
            </div>
        </div>

        <!-- AVANCES -->
        <div class="col-md-4 mb-4">
            <div class="card text-center shadow">
                <div class="card-body">
                    <h5 class="card-title">Avances</h5>
                    <p class="card-text">Seguimiento del aprendizaje.</p>
                    <a href="avances.jsp" class="btn btn-warning">Entrar</a>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>



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

<body class="bg-primary bg-opacity-10">

<!-- BARRA SUPERIOR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Aprendizaje IA</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Cerrar sesión</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- CONTENIDO -->
<div class="container mt-5">

    <div class="text-center mb-4">
        <img src="img/Logotipo infantil pa-original.png" width="100" class="mb-3">
        <h3>Menú Principal</h3>
        <p class="text-muted">Seleccione una opción</p>
    </div>

    <div class="row text-center">

        <!-- ALUMNOS -->
        <div class="col-md-4 mb-4">
            <div class="card shadow">
                <div class="card-body">
                    <h5>Gestión de Alumnos</h5>
                    <p class="text-muted">Registrar y administrar alumnos</p>
                    <a href="alumnos.jsp" class="btn btn-primary w-100">
                        Entrar
                    </a>
                </div>
            </div>
        </div>

        <!-- LECCIONES -->
        <div class="col-md-4 mb-4">
            <div class="card shadow">
                <div class="card-body">
                    <h5>Lecciones de IA</h5>
                    <p class="text-muted">Administrar lecciones</p>
                    <a href="lecciones.jsp" class="btn btn-success w-100">
                        Entrar
                    </a>
                </div>
            </div>
        </div>

        <!-- AVANCES -->
        <div class="col-md-4 mb-4">
            <div class="card shadow">
                <div class="card-body">
                    <h5>Registro de Avances</h5>
                    <p class="text-muted">Seguimiento del aprendizaje</p>
                    <a href="avances.jsp" class="btn btn-warning w-100">
                        Entrar
                    </a>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>


<%@page import="entidades.Proyecto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registrar Proyectos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f5f6f7;
}

.card {
	border-radius: 10px;
}

.btn-group-custom button {
	margin-right: 5px;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

	<div class="container mt-5">
		<div class="row">

			<!-- FORMULARIO -->
			<div class="col-md-4">
				<div class="card p-4 shadow-sm">
					<h4 class="mb-3">Registrar Proyectos</h4>

					<form method="post" action="ProyectoServlet">
						<div class="mb-3">
							<label class="form-label">Nombre del Proyecto</label> <input
								name="nombre" type="text" class="form-control" minlength="4" maxlength="60" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Descripción técnica del Proyecto (Opcional)</label> 
							<textarea name="descripcion" type="text" class="form-control" rows="3"></textarea>
						</div>

						<div class="mb-3">
							<label class="form-label">Fecha de inicio del Proyecto</label> <input
								name="fechainicio" id="fechainicio" type="date" class="form-control" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Fecha de fin del Proyecto</label> <input
								name="fechafin" id="fechafin" type="date" class="form-control" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Asesor Técnico del Proyecto (Nombres y Apellidos)</label> <input 
							name="asesortecnico" type="text" class="form-control" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Presupuesto Asignado</label> <input
								name="presupuesto" type="number" class="form-control" min="0" step="0.01" required>
						</div>

						<div class="btn-group-custom">
							<button type="submit" class="btn btn-primary">Registrar</button>
							<button type="button" class="btn btn-success">Actualizar</button>
							<a href="ProyectoServlet" class="btn btn-warning">Listar</a>
							<button type="button" class="btn btn-danger">Eliminar</button>
						</div>
					</form>
				</div>
			</div>

			<!-- TABLA -->
			<div class="col-md-8">
				<div class="card p-4 shadow-sm">
					<h4 class="mb-3">Proyectos Disponibles</h4>

					<table class="table table-hover">
						<thead class="table-light">
							<tr>
								<th>Id</th>
								<th>Nombre del Proyecto</th>
								<th>Inicio</th>
								<th>Fin</th>
								<th>Asesor Técnico</th>
								<th>Presupuesto</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>

							<%
							@SuppressWarnings("unchecked")
							List<Proyecto> lista = (List<Proyecto>) request.getAttribute("proyectos");
							if (lista != null && !lista.isEmpty()) {
								for (Proyecto s : lista) {
							%>
							<tr>
								<td><%=s.getId()%></td>
								<td><%=s.getNombre()%></td>
								<td><%=s.getFechaInicio()%></td>
								<td><%=s.getFechaFin()%></td>
								<td><%=s.getAsesorTecnico()%></td>
								<td><%=s.getPresupuesto()%></td>
								<td>
									<button type="button" class="btn btn-sm btn-info" title="Información">
									<i class="bi bi-info-circle-fill"></i>
									</button>
									
									<button type="button" class="btn btn-sm btn-danger" title="Eliminar"> 
									<i class="bi bi-trash-fill"></i>
									</button>
								</td>
							</tr>
							<%
							}
							}
							%>
							
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
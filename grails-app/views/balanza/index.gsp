<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="layout" content="contabilidad"/>
	<asset:stylesheet src="datatables/dataTables.css"/>
	<asset:javascript src="datatables/dataTables.js"/> 
	<title>Balanza</title>
</head>
<body>
<content tag="header">
	<h3>Balanzas de comprobacion para ${session.empresa}</h3>
</content>
<content tag="operaciones">
	<li>
	    <g:link action="create" >
	        <i class="fa fa-plus"></i> Nuevo
	    </g:link>
	    <g:link action="importar" >
	        <i class="fa fa-external-link-square"></i> Importar
	    </g:link>
	</li>
</content>

%{-- <content tag="reportes">
	<g:link action="balanza" >
	    <i class="fa fa-print"></i> Balanza
	</g:link>
</content> --}%

<content tag="document">
<div class="">
	<table id="grid" class="table table-striped table-bordered table-condensed">

		<thead>
			<tr>
				<th>Folio</th>
				<th>Ejercicio</th>
				<th>Mes</th>
				<th>Cuentas</th>
				<th>Estatus</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${balanzaInstanceList}" var="row">
				<tr id="${row.id}">
					<td>
						<g:link  action="show" id="${row.id}">
							${fieldValue(bean:row,field:"id")}
						</g:link>
					</td>
					<td>${row.ejercicio}</td>	
					<td>${row.mes}</td>	
					<td>${row.partidas.size()}</td>	
					<td>
						<g:if test="${row.acuse}">
							<g:link  action="mostrarAcuse" id="${row.id}">
								ENVIADA
							</g:link>
						</g:if>
						<g:else>
							REVISION
						</g:else>
					</td>
					<td>
						<g:link  controller="report" action="balanza" id="${row.id}">
							<i class="fa fa-print"></i>
						</g:link>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${balanzaInstanceCount ?: 0}"/>
	</div>
</div>
</content><!-- End content document -->

<content tag="searchForm">
	%{-- <g:render template="search"/> --}%
</content>
<content tag="javascript">
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('#grid').dataTable( {
	        	"paging":   false,
	        	"ordering": false,
	        	"info":     false
	        	,"dom": '<"toolbar col-md-4">rt<"bottom"lp>'
	    	} );
	    	
	    	$("#filtro").on('keyup',function(e){
	    		var term=$(this).val();
	    		$('#grid').DataTable().search(
					$(this).val()
	    		        
	    		).draw();
	    	});

		});
	</script>
	
</content>

	
</body>
</html>
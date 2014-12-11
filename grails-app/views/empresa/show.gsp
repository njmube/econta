<html>
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="createForm"/>
	<title>${empresaInstance.clave}</title>
</head>
<body>

	<content tag="header">
		<h3>Empresa: ${empresaInstance.nombre}</h3>
	</content>
	
	<content tag="operaciones">
		<ul class="nav nav-pills nav-stacked">
  			<li><g:link action="index">
  					<span class="glyphicon glyphicon-arrow-left"></span> Catálogo
  			    </g:link>
  			</li>
  			<li><g:link action="create">
  					<span class="glyphicon glyphicon-plus"></span> Nuevo
  			    </g:link>
  			</li>
  			<li><g:link action="edit" id="${empresaInstance.id}">
  					<span class="glyphicon glyphicon-pencil"></span> Editar
  			    </g:link>
  			</li>
		</ul>
	</content>
	
	<content tag="formTitle">Datos generales</content>
	
	<content tag="form">
		
		<g:hasErrors bean="${empresaInstance}">
            <div class="alert alert-danger">
                <g:renderErrors bean="${empresaInstance}" as="list" />
            </div>
        </g:hasErrors>

		<fieldset disabled>

		<g:form class="form-horizontal" action="save" >
			
			<f:with bean="${empresaInstance }">
				<f:field property="nombre" input-class="form-control uppercase-field " input-autofocus="on"/>
				<f:field property="rfc" input-class="form-control uppercase-field"/>
				<f:field property="clave" input-class="form-control uppercase-field"/>
				<g:render template="/common/direccion" bean="${empresaInstance}"/> 
				
			</f:with>
			
			
		</g:form>

		</fieldset>
		

	</content>
	
</body>
</html>
<%-- 
    Document   : index
    Created on : 11-nov-2017, 15:43:17
    Author     : Usuario
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Vehiculo"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Alquier de Vehiculos SQL Server</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <%
            String marca="",modelo="",color="", mensaje="";
            float kilometraje = 0;
            int dias=0,valor=0;
            boolean respuesta=false;

            if(request.getParameter("btn-consul")!= null){
                marca = request.getParameter("txt-marca");
                modelo = request.getParameter("txt-modelo");
                color = request.getParameter("txt-color");
                kilometraje = Float.parseFloat(request.getParameter("txt-kilometraje"));
                dias = Integer.parseInt(request.getParameter("txt-dias"));

                Vehiculo vh = new Vehiculo();
                DecimalFormat formatea = new DecimalFormat("###,###.##");
                vh.setMarca(marca);
                vh.setModelo(modelo);
                vh.setColor(color);
                vh.setKilometraje(kilometraje);
                vh.setDias(dias);

                if(vh.Validar()){                
                    vh.insertar();
                    vh.Calcular();
                    mensaje = String.valueOf(formatea.format(vh.getValor()));
                }
                else{
                    mensaje = String.valueOf(vh.getError());
                }
            }
            %>
        
        <!-- Top content -->
        <div class="top-content">
        	<div class="container">
                	
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 text">
                        <h1>Alquiler de Vehiculos SQL Server</h1>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 show-forms">
                    	<span class="show-register-form active">Ingresar Datos Formulario</span> 
                    </div>
                </div>
                
                <div class="row register-form">
                    <div class="col-sm-4 col-sm-offset-1">
						<form role="form" method="post" class="r-form">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="txt-marca">Marca del Vehiculo</label>
	                        	<input type="text" name="txt-marca" placeholder="Marca del Vehiculo..." class="txt-marca form-control" id="txt-marca" required="required" value=<%out.println(marca);%>>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="txt-modelo">Modelo del Vehiculo</label>
	                        	<input type="text" name="txt-modelo" placeholder="Modelo del Vehiculo..." class="txt-modelo form-control" id="txt-modelo" required="required" value=<%out.println(modelo);%>>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="txt-color">Color del Vehiculo</label>
	                        	<input type="text" name="txt-color" placeholder="Color del Vehiculo..." class="txt-color form-control" id="txt-color" required="required" value=<%out.println(color);%>>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="txt-kilometraje">Kilometros del Vehiculo</label>
	                        	<input type="text" name="txt-kilometraje" placeholder="Kilometros del Vehiculo..." class="txt-kilometraje form-control" id="txt-kilometraje" required="required" value=<%//out.println(kilometraje);%>>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="txt-dias">Dias de Alquiler</label>
	                        	<input type="text" name="txt-dias" placeholder="Dias de Alquiler..." class="txt-dias form-control" id="txt-dias" required="required" value=<%//out.println(dias);%>>
	                        </div>
				            <button type="submit" name="btn-consul" class="btn">Enviar y  Calcular</button>
						</form>
                    </div>
                    <div class="col-sm-6 forms-right-icons">
						<div class="row">
							<div class="col-sm-2 icon"><i class="fa fa-commenting"></i></div>
							<div class="col-sm-10">
								<h3>Valor a Pagar Alquiler</h3>
                                <div class="alert alert-success" role="alert">
                                    <h4 class="alert-heading lbl-costo" style="font-size: 45px; margin-bottom: 0; text-align: center;">$<% out.println(mensaje); %></h4>
                                </div>
							</div>
						</div>
                    </div>
                </div>
        	</div>
        </div>

        <!-- Footer -->
        <footer>
        	<div class="container">
        		<div class="row">
        			
        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
        				<p>Alejandro Sánchez Ospina | Hector Javier Correa</a>.</p>
        			</div>
        			
        		</div>
        	</div>
        </footer>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
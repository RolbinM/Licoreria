<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
    <link rel="stylesheet" href="assets/css/estiloRegistrarCliente.css">


    <title>Registrar Cliente</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="signup-form">
                    <form action="" method="POST" class="mt-5 p-4">
                        <h3 class="mb-5 text-secondary">Registro de Cliente</h3>

                        <div class="mb-3">
                            <label>Cédula</label>
                            <input type="text" name="cedula" class="form-control" placeholder="Ingrese su cédula" required>
                        </div>
                        <div class="mb-3">
                            <label>Nombre</label>
                            <input type="text" name="nombre" class="form-control" placeholder="Ingrese su nombre" required>
                        </div>

                        <div class="mb-3">
                            <label>Fecha de Nacimiento</label>
                            <input type="date" name="fechaNacimiento" class="form-control" placeholder="Ingrese su fecha de nacimiento" required>
                        </div>

                        <div class="mb-3">
                            <label>Correo Electrónico</label>
                            <input type="email" name="correo" class="form-control" placeholder="Ingrese su correo electrónico" required>
                        </div>

                        <div class="mb-3">
                            <label>Latitud</label>
                            <input type="decimal" name="lat" id="latitud" value="9.8644400" class="form-control" required readonly>
                        </div>

                        <div class="mb-3">
                            <label>Longitud</label>
                            <input type="decimal" name="lng" id="longitud" value="-83.9194400" class="form-control" required readonly>
                        </div>


                        <div class="mb-3">
                            <label>País:</label>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paisSeleccionado" value="CostaRica" checked>
                                <label class="form-check-label" for="exampleRadios1">
                                    Costa Rica
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paisSeleccionado" value="Nicaragua">
                                <label class="form-check-label" for="exampleRadios2">
                                    Nicaragua
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paisSeleccionado" value="Panama">
                                <label class="form-check-label" for="exampleRadios2">
                                    Panamá
                                </label>
                            </div>
                        </div>
                        <br>

        

                        <div class="mb-3">
                           <button class="btn btn-primary float-end" name="enviar">Crear Usuario</button>
                        </div>

                    </form>
                </div>
            </div>
            <div class="col">
                <div class="mt-5 p-4 ">
                    <div id="map"></div>
                </div>
            </div>
        </div>
    </div>


    <?php
        if(isset($_POST['enviar'])){
            $cedula = $_POST ['cedula'];
            $nombre = $_POST ['nombre'];
            $fechaNacimiento = $_POST ['fechaNacimiento'];
            $correo = $_POST ['correo'];
            $pais = $_POST ['paisSeleccionado'];
            $latitud = $_POST ['lat'];
            $longitud = $_POST ['lng'];

            if($pais == 'CostaRica'){                      /* ESTA CABLEADO PARA SIEMPRE HACERLO CON COSTA RICA*/
                include 'php/driverCostaRica.php';
            }else if($pais == 'Nicaragua'){
                include 'php/driverCostaRica.php';
            }else if($pais == 'Panama'){
                include 'php/driverCostaRica.php';
            }

            $consulta = "EXECUTE dbo.sp_InsertarCliente '$nombre', '$cedula', 
                        '$fechaNacimiento', '$correo', '$latitud', '$longitud'";
            
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            if($ejecutar){
                $fila = sqlsrv_fetch_object( $ejecutar);
                
                if($fila->Codigo == 0) {
                    echo"<script>alert('Se creo correctamente el usuario')</script>";
                    echo"<script>window.open('indexCliente.php', '_self')</script>";
                }else if($fila->Codigo == 1){
                    echo"<script>alert('El usuario ya existe, pruebe con otro')</script>";
                }else if($fila->Codigo == 2){
                    echo"<script>alert('El usuario debe ser mayor de edad')</script>";
                }else {
                    echo '
                    <script>
                        alert("Datos ingresados erroneamente");
                    </script>
                ';
                }

            }
            else{
                /*echo"<script>alert('Error, intentelo de nuevo mas tarde')</script>";
                echo"<script>window.open('index.php', '_self')</script>";*/

                echo $ejecutar;
            }

        }
    ?>


    <script>
    var map = L.map('map').
        setView([9.8644400, -83.9194400],
        6);

        L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
        maxZoom: 18
        }).addTo(map);

        
        L.control.scale().addTo(map);


        var popup = L.popup();

        function onMapClick(e) {
            popup
                .setLatLng(e.latlng)
                .setContent("Se selecciono el punto: " + e.latlng.toString())
                .openOn(map);

            document.getElementById("latitud").value = e.latlng.lat;
            document.getElementById("longitud").value = e.latlng.lng;
        }

        map.on('click', onMapClick);

    </script>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
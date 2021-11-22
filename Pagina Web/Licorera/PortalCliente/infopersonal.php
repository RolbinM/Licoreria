<!DOCTYPE html>
<?php
    session_start();
    $pais = $_SESSION['pais'];

    if($pais == 'CostaRica'){                      /* ESTA CABLEADO PARA SIEMPRE HACERLO CON COSTA RICA*/
        include '../php/driverCostaRica.php';
    }else if($pais == 'Nicaragua'){
        include 'driverCostaRica.php';
    }else if($pais == 'Panama'){
        include 'driverCostaRica.php';
    }
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Licorera</title>

    <link rel ="stylesheet" href="../assets/css/estilos2.css">
    <link href="..//assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
</head>
<body id="body">
    

    <div class="menu__side" id="menu_side">

        <div class="name__page">
            <i class="fas fa-cocktail" id="btn_open"></i>
            <h4>Licorera</h4>
        </div>

        <div class="options__menu">	


            <a href="licor.php" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-wine-bottle" title="Hoteles" ></i>
                    <h4>Licores</h4>
                </div>
            </a>

            <a href="carrito.php" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-shopping-cart" title="Compras" ></i>
                    <h4>Carrito Compras</h4>
                </div>
            </a>

            <a href="sucursales.php" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-store" title="Sucursales" ></i>
                    <h4>Sucursales</h4>
                </div>
            </a>
            
            <a href="historial.php" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-history" title="historial" ></i>
                    <h4>Historial Compras </h4>
                </div>
            </a>
            <a href="infopersonal.php" style="text-decoration:none">
                <div class="option">
                    <i class="far fa-id-badge" title="Info"></i>
                    <h4>Información personal</h4>
                </div>
            </a>

            <a href="../php/cerrar_sesion.php" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-sign-out-alt" title="Salida"></i>
                    <h4>Salida</h4>
                </div>
            </a>

        </div>

    </div>
    <center>
    <br><br>
    <h1>Información Personal</h1>
    <br/><br/><br/>
                <?php   
                        //session_start();
                        $editar_usuario = $_SESSION['usuario'];
                        $consulta = "EXECUTE dbo.sp_ConsultaClienteEspecifico $editar_usuario" ;
                        $ejecutar = sqlsrv_query ($conn_sis, $consulta);

                        $fila = sqlsrv_fetch_array($ejecutar);
                            //$id = $fila ['Id'];
                            $Nombre = $fila ['Nombre'];
                            $identificacion = $fila ['Cedula'];
                            $Nacimiento = $fila ['Nacimiento']->format('Y-m-d');
                            $TipoCliente = $fila ['TC'];
                            $Correo = $fila ['CorreoElectronico'];
                            $UbicacionLat = $fila ['UbicacionLat'];
                            $UbicacionLong = $fila ['UbicacionLong'];
            ?>

            <div class = "col-md-8 col-md-offset-2">

                    <form method="POST" action="">
                        <!-- <div class="form-group" >
                            <label>Id:</label>
                            <input type="number" name="ID" class="form-control" placeholder = "Escriba el ID del puesto a crear"required/><br/>
                        </div> -->
                        <div class="form-group">
                            <label>Nombre:</label>
                            <input type="text" name="Nombre" class="form-control" value="<?php echo $Nombre; ?>" required/><br/>
                        </div>
                        <br/><br/>
                        <div class="form-group">
                            <label>Identificación:</label>
                            <input type="number" name="Identificacion" class="form-control" value="<?php echo $identificacion; ?>" readonly/><br/>
                        </div>
                        <br/><br/>
                        <div class="form-group">
                            <label>Nacimiento:</label>
                            <input type="date" name="Nacimiento" class="form-control"  value="<?php echo $Nacimiento; ?>" required/><br/>
                        </div>
                        <br/><br/>
                        <div class="form-group">
                            <label>Tipo Cliente:</label>
                            <input type="text" name="TipoCliente" class="form-control" value="<?php echo $TipoCliente; ?>" readonly/><br/>
                        </div>
                        <br><br>
                        <div class="form-group">
                            <label>Correo:</label>
                            <input type="text" name="Correo" class="form-control" value="<?php echo $Correo; ?>" required/><br/>
                        </div>
                        <br/><br/>
                        <div class="form-group">
                            <label>Longitud:</label>
                            <input type="decimal" name="UbicacionLong" class="form-control" value="<?php echo $UbicacionLong; ?>" required/><br/>
                        </div>
                        <br/><br/>
                        <div class="form-group">
                            <label>Latitud:</label>
                            <input type="decimal" name="UbicacionLat" class="form-control" value="<?php echo $UbicacionLat; ?>" required/><br/>
                        </div>
                        <br/><br/>
                        <div class="form-group">
                            <input type="submit" name="actualizar" class="btn btn-warning" value = "ACTUALIZAR DATOS"><br/>
                        </div>
                        
                    </form>
                    
                </div>

            <?php
                    if(isset($_POST['actualizar'])){

                        $actualizar_nombre = $_POST ['Nombre'];
                        $actualizar_identificacion = $_POST ['Identificacion'];
                        $actualizar_Nacimiento = $_POST ['Nacimiento'];
                        $actualizar_Correo = $_POST ['Correo'];
                        $actualizar_Password = $_POST ['Password'];
                        

                        $consulta = "EXECUTE dbo.sp_ActualizarCliente '$actualizar_nombre', '$editar_usuario', '$actualizar_Password', 
                                    $actualizar_identificacion, '$actualizar_Nacimiento', '$actualizar_Correo'" ;
                        
                        $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                    
                        if($ejecutar){
                            echo"<script>$actualizar_Nacimiento</script>";
                            echo"<script>alert('Cliente Editado correctamente')</script>";
                            echo"<script>window.open('infopersonal.php', '_self')</script>";
                        }
                        else{
                            echo $consulta;
                            echo 'hola';
                            if( ($errors = sqlsrv_errors() ) != null) {
                                foreach( $errors as $error ) {
                                    echo "SQLSTATE: ".$error[ 'SQLSTATE']."<br />";
                                    echo "code: ".$error[ 'code']."<br />";
                                    echo "message: ".$error[ 'message']."<br />";
                                }
                            }
                        }

                    }
                
            ?>
    </center>         
    <script src="../assets/js/prueba.js"></script>
</body>
</html>
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
<br>
<br>
    <?php
        if(isset($_GET['IdLicor']) && isset($_GET['IdSucursal'])){
            $IdLicor = $_GET['IdLicor'];
            $IdSucursal = $_GET['IdSucursal'];
            $consulta = "EXECUTE dbo.sp_ConsultarExistenciasXLicorXSucursal $IdSucursal, $IdLicor" ;
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            $fila = sqlsrv_fetch_array($ejecutar);
            $NombreSucursal = $fila ['NombreSucursal'];
            $NombreLicor = $fila ['NombreLicor'];
            $Precio = $fila ['Precio'];
        }
    ?>

        
    <div class = "col-md-8 col-md-offset-2">

    <form method="POST" action="">
        <!-- <div class="form-group" >
            <label>Id:</label>
            <input type="number" name="ID" class="form-control" placeholder = "Escriba el ID del puesto a crear"required/><br/>
        </div> -->
        <div class="form-group">
            <label>Nombre Sucursal:</label><br>
            <input type="text" name="Nombre" class="form-control" value="<?php echo $NombreSucursal; ?>" readonly min="1"/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Nombre Licor:</label><br>
            <input type="text" name="Nombre2" class="form-control" value="<?php echo $NombreLicor; ?>" readonly/><br/>
        </div>

        <br/><br/>
        <div class="form-group">
            <label>Precio Por Unidad:</label><br>
            <input type="text" name="Correo" class="form-control" value="<?php echo $Precio; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Cantidad Deseada:</label><br>
            <input type="number" name="Cantidad" class="form-control" min="1" placeholder="Ingrese la cantidad deseada" required >
        </div>
        <br/><br/>
        <div class="form-group">
            <input type="submit" name="compra" class="btn btn-warning" value = "Comprar"><br/>
        </div>
    </form>
    </div>
    </center>

            
        <?php
            if(isset($_POST['compra'])){

                $idUsuario = $_SESSION['usuario'];
                $Cantidad = $_POST ['Cantidad'];

                $consulta = "EXECUTE dbo.sp_ProductosAFactura $idUsuario, $IdSucursal, $IdLicor, $Cantidad" ;
                
                $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                
            
                if($ejecutar){

                    echo"<script>alert('Compra agregada a carrito correctamente')</script>";
                    echo"<script>window.open('carrito.php', '_self')</script>";
                }
                else{
                    echo"<script>alert('No se pudo realizar la compra, debido a que hay un carrito con elementos de otra sucursal')</script>";
                    echo"<script>window.open('licor.php', '_self')</script>";
                }

            }

        ?>
    <script src="../assets/js/prueba.js"></script>
</body>
</html>
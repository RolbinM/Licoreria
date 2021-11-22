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

    <main>
    <center>
    <div class = "col-md-8 col-md-offset-2">
        <h1>Carrito Compras</h1>
        <br> <br>

        <form method="POST" action="carrito.php">

            <div class="form-group">
                <label>Tipo de envio:</label>
                <select name="envio" class="form-control">
                <option>Envio a Casa</option>
                <option>Recoleccion en sucursal</option>   
                </select>
            </div>
            <br/><br>
            <div class="form-group">
                <input type="submit" name="insert" class="btn btn-success" value = "Proceder a pagar" /><br/>
            </div>
            <br><br>
            <div class="form-group">
                <input type="submit" name="delete" class="btn btn-danger" value = "Eliminar carrito" /><br/>
            </div>
        </form>
    </div>
    <br /> <br />

    <?php
        if(isset($_POST['insert'])){

            $envio = $_POST ['envio'];
            $editar_usuario = $_SESSION['usuario'];

            if($envio == "Envio a Casa"){                      
                $consulta = "EXECUTE dbo.sp_InsertarEnvio $editar_usuario, 0" ;

            }else if($envio == "Recoleccion en sucursal"){
                $consulta = "EXECUTE dbo.sp_InsertarEnvio $editar_usuario, 1" ;

            }
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            if($ejecutar){
                echo"<script>window.open('transaccion.php', '_self')</script>";
            }
            else{
                echo"<script>alert('Error, inserte elementos o elimine la factura')</script>";
                echo"<script>window.open('carrito.php', '_self')</script>";
            }

        }
    ?>

    <?php
        if(isset($_POST['delete'])){
           
            $editar_usuario = $_SESSION['usuario'];

            $consulta = "EXECUTE dbo.sp_EliminarFactura $editar_usuario" ;
            
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            if($ejecutar){
                echo"<script>alert('Factura eliminada correctamente')</script>";
                echo"<script>window.open('licor.php', '_self')</script>";
            }
            else{
                echo"<script>alert('Error al emininar el carrito')</script>";
                echo"<script>window.open('licor.php', '_self')</script>";
            }

        }
    ?>
    
    <div class = "col-md-8 col-md-offset-2">

        <div class = "col-md-8 col-md-offset-2" >
        <table class = "table table-bordered table-responsive" >
            <tr>
                <td align="center">ID</td>
                <td align="center">Nombre Licor</td>
                <td align="center">Precio</td>
                <td align="center">Cantidad</td>
                <td align="center">Total</td>
                <td align="center">Impuesto</td>
                <td align="center">Borrado</td>
            </tr>


    <?php
            {
            $usuario = $_SESSION['usuario'];
            $consulta = "EXECUTE dbo.sp_ConsultaCarrito $usuario";
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            $i = 0;
            while ($fila = sqlsrv_fetch_array($ejecutar)){
                $id = $fila ['Id'];
                $Nombre = $fila ['NombreLicor'];
                $Precio = $fila ['Precio'];
                $Cantidad = $fila ['Cantidad'];
                $Total = $fila ['Total'];
                $Impuesto = $fila ['Impuesto'];
                $i++;
        
        
        ?>
                <tr align = "center">
                <td><?php echo $id; ?></td>
                <td><?php echo $Nombre; ?></td>
                <td><?php echo $Precio; ?></td>
                <td><?php echo $Cantidad; ?></td>
                <td><?php echo $Total; ?></td>
                <td><?php echo $Impuesto; ?></td>
                <td><a class="btn btn-danger" href="carrito.php?borrarproducto=<?php echo $id; ?>">Eliminar</a></td>
                </tr>

        <?php } ?>
            </table>
            </div>
            <?php
        }
    
?>



    </main>

    <?php
    if(isset($_GET['borrarproducto'])){

        $borrar_Id = $_GET['borrarproducto'];
        $borrar = "EXECUTE dbo.sp_EliminarProductosFactura $usuario, $borrar_Id";
        $ejecutar = sqlsrv_query ($conn_sis, $borrar);

        if($ejecutar){
            echo"<script>alert('Articulo Eliminado Correctamente')</script>";
            echo"<script>window.open('carrito.php', '_self')</script>";
        }
    }
    ?>

    </center>

    <script src="../assets/js/prueba.js"></script>
</body>
</html>
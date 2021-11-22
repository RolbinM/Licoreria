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
      
    <br/><br/>
    <center>
               
            <h1>Compras Previas</h1>


            <br /> <br />

            <div class = "col-md-8 col-md-offset-2" >
            <table class = "table table-bordered table-responsive" >
                <tr>
                <td align="center">ID</td>
                <td align="center">Sucursal</td>
                <td align="center">Fecha</td>
                <td align="center">Tipo Pago</td>
                <td align="center">Impuesto</td>
                <td align="center">Retencion</td>
                <td align="center">Envio</td>
                <td align="center">Descuento</td>
                <td align="center">Total</td>
                </tr>

                <?php
                    $idUsuario = $_SESSION['usuario'];
                    $consulta = "EXECUTE dbo.sp_ConsultaHistorialCompras $idUsuario";
                    $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                    $i = 0;
                    while ($fila = sqlsrv_fetch_array($ejecutar)){
                            $id = $fila ['Id'];
                            $Sucursal = $fila ['SNombre'];
                            $Fecha = $fila ['Fecha']->format('Y-m-d');
                            $Metodo = $fila ['tpNombre'];
                            $Impuesto = $fila ['Impuesto'];
                            $Retencion = $fila ['Retencion'];
                            $Envio = $fila ['Envio'];
                            $Descuento = $fila ['Descuento'];
                            $Total = $fila ['Total'];
                            $i++;
                    
                    
                    ?>
                <tr align = "center">
                <td><?php echo $id; ?></td>
                <td><?php echo $Sucursal; ?></td>
                <td><?php echo $Fecha; ?></td>
                <td><?php echo $Metodo; ?></td>
                <td><?php echo $Impuesto; ?></td>
                <td><?php echo $Retencion; ?></td>
                <td><?php echo $Envio; ?></td>
                <td><?php echo $Descuento; ?></td>
                <td><a href="detalleCompra.php?IdFactura=<?php echo $id; ?>"><?php echo $Total; ?></a></td>

                </tr>

                    <?php } ?>

                    <?php
                            if(isset($_GET['IdFactura'])){
                                include ("detalleCompra.php");
                            }

                            ?>
                
            </table>
            </div>
    </center>



    <script src="../assets/js/prueba.js"></script>
</body>
</html>
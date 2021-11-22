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

    <link rel ="stylesheet" href="../assets/css/estilos3.css">
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
    <h1 class="title">  Catalogo </h1>
    </center>
    <br><br>
    <div class="container">

    <?php
            if(isset($_GET['idSucursal'])){
            $IdSucursal = $_GET ['idSucursal'];
            $consulta = "EXECUTE dbo.sp_ConsultarExistenciasXSucursal $IdSucursal";
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            $i = 0;
            while ($fila = sqlsrv_fetch_array($ejecutar)){
            
                ?>

                <div class="hotel">

                    <img src="data:image/jpg;base64,<?php echo base64_encode($fila['Imagen']);?>" />

                    
                    <h2><?php echo $fila['NombreLicor'] ?></h2>
                    <br>
                    <p3>Procedencia: <?php echo $fila['Procedencia'] ?></p3>
                    <br><br>
                    <p3>Tipo Maduración: <?php echo $fila['TipoMaduracion'] ?></p3>
                    <br><br>
                    <p3>Edad de Maduración: <?php echo $fila['Edad'] ?></p3>
                    <br><br>
                    <p3>Precio: <?php echo $fila['Precio'] ?></p3>
                    <br><br>
                    <p3>Cantidad Disponible: <?php echo $fila['Cantidad'] ?></p3>
                    <br><br>

                </div>

                 
            <?php } } ?>

    </div>    
    <script src="../assets/js/prueba.js"></script>
</body>
</html>
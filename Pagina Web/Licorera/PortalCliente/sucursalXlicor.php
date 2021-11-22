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

    <link rel ="stylesheet" href="../assets/css/estilos5.css">
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
    <br>
    <h1 align=center>Sucursales con disponibilidad</h1>
    <br>
    <div class="container">
    <?php

        if(isset($_GET['IdLicor'])){
            $IdLicor = $_GET ['IdLicor'];
            $idUsuario = $_SESSION['usuario'];
            $consulta = "EXECUTE dbo.sp_ConsultarSucursalXLicor $IdLicor, $idUsuario" ;
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            $i = 0;
            
            while ($fila = sqlsrv_fetch_array($ejecutar)){
                ?>
                
                <div class="card">
                    <h3 class="title"><?php echo $fila['SucursalNombre']?></h3>
                    <div class="bar">
                        <div class="emptybar"></div>
                        <div class="filledbar"></div>
                    </div>
                    <div class="card-body">
                        <h2 class=info>Distancia (Km): <?php echo $fila['Distancia']?></h2>
                        <br>
                        <h2 class=info2>Cantidad Disponible: <?php echo $fila['cantidad']?></h2>
                        <br>
                        <a class=info3 href="formulario.php?IdLicor=<?php echo $IdLicor ?>&IdSucursal=<?php echo $fila['SucursalId'] ?>">Comprar<a>
                    </div>
                </div>
              
            <?php } } ?>
            

    </div>

    </main>


    <script src="../assets/js/prueba.js"></script>
</body>
</html>
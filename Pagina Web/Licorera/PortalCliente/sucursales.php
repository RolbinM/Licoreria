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
        <section class="Form my-4 mx-5">
            <div class="container">
                <br>
                <div class="row justify-content-center">
                    <div class="col-md-5 rounded shadow  bg-light rounded">
                        <h2 class="text-center font-weight-bold">Sucursales</h2>
                    </div>
                </div>
                <br>
                <div class="row">

                    <?php
                        $idUsuario = $_SESSION['usuario'];
                        $consulta = "EXECUTE dbo.sp_ConsultarSucursales $idUsuario ";
                        $ejecutar = sqlsrv_query ($conn_sis, $consulta);

                        while($fila = sqlsrv_fetch_array($ejecutar)){
                        ?>
                             <form method="post" class="col-12 p-3 justify-content-center">
                                <div class="card border-dark text-dark">
                                    <div class="card-header">
                                       <?php echo $fila['Nombre'] ?>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            <dl class="row">
                                                <dt class="col-sm-2">Código:</dt>
                                                <dd class="col-sm-10" name='id'><?php echo $fila['Id'] ?></dd>
                                                <hr>
                                                <dt class="col-sm-2">Latitud:</dt>
                                                <dd class="col-sm-10" name='latitud'><?php echo $fila['Lat'] ?></dd>
                                                <hr>
                                                <dt class="col-sm-2">Longitud:</dt>
                                                <dd class="col-sm-10" name='longitud'><?php echo $fila['Long'] ?></dd>
                                                <hr>
                                                <dt class="col-sm-2">Distancia (Km):</dt>
                                                <dd class="col-sm-10" name='distancia'><?php echo $fila['Distancia'] ?></dd>
                                                <hr>
                                                <dt class="col-sm-2">Horario:</dt>
                                                <dd class="col-sm-10" name='horario'><?php echo $fila['Horario'] ?></dd>
                                                <hr>
                                            </dl>
                                        </p>
                                        <a href="catalogo.php?idSucursal=<?php echo $fila['Id'] ?>" class="btn btn-success">Revisar Catalogo</a>
                                    </div>
                                </div>
                            </form>

                            <?php } ?>

                            <?php
                            if(isset($_GET['idSucursal'])){
                                include ("catalogo.php");
                            }

                            ?>
                </div>
            </div>
        </section>
    </main>
      
    <script src="../assets/js/prueba.js"></script>
</body>
</html>
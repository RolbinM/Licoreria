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
    <h1>Facturación</h1>
<br>
<br>
    <?php
       
            $idUsuario = $_SESSION['usuario'];
            $consulta = "EXECUTE dbo.sp_ConsultaFactura $idUsuario" ;
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            $fila = sqlsrv_fetch_array($ejecutar);
            
            $NombreSucursal = $fila ['NombreSucursal'];
            $Fecha = $fila ['Fecha']->format('Y-m-d');
            $Total = $fila ['Total'];
            $Impuesto = $fila ['Impuesto'];
            $Descuento = $fila ['Descuento'];
            $Envio = $fila ['Envio'];
            $Nombre = $fila ['Nombre'];

    ?>

        
    <div class = "col-md-8 col-md-offset-2">

    <form method="POST" action="">
        <!-- <div class="form-group" >
            <label>Id:</label>
            <input type="number" name="ID" class="form-control" placeholder = "Escriba el ID del puesto a crear"required/><br/>
        </div> -->
        <div class="form-group">
            <label>Nombre Sucursal:</label><br>
            <input type="text" name="Nombre" class="form-control" value="<?php echo $NombreSucursal; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Fecha:</label><br>
            <input type="date" name="Fecha" class="form-control" value="<?php echo $Fecha; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Total:</label><br>
            <input type="Int" name="total" class="form-control"  value="<?php echo $Total; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Impuesto:</label><br>
            <input type="Int" name="impuesto" class="form-control"  value="<?php echo $Impuesto; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Descuento:</label><br>
            <input type="Int" name="descuento" class="form-control"  value="<?php echo $Descuento; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Precio de envio:</label><br>
            <input type="Int" name="costoenvio" class="form-control" value="<?php echo $Envio; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Tipo de cliente:</label><br>
            <input type="text" name="tipocliente" class="form-control" value="<?php echo $Nombre; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
                <label>Metodo de pago:</label>
                <?php

                $query = "EXECUTE dbo.sp_ConsultartipoPago";
                $ejecutar = sqlsrv_query ($conn_sis, $query);

                ?>
                <select input type = "number" name="TipoPag" class="form-control">   
                    <?php    
                    while ($fila = sqlsrv_fetch_array($ejecutar))    
                    {
                        $id = $fila['ID'];
					    $nombre = $fila['Nombre']?>
                        ?>

                        <option value="<?php echo $id ?>"><?php echo $nombre ?>
                        </option>  
                    
                        <?php
                    }    
                    ?>       
                </select>
            </div>
        <br/><br/>
        <div class="form-group">
            <input type="submit" name="pagar" class="btn btn-warning" value = "Comprar"><br/>
        </div>
    </form>
    </div>
    </center>

            
        <?php
            if(isset($_POST['pagar'])){

                $TipoPago = $_POST ['TipoPag'];
                $editar_usuario = $_SESSION['usuario'];
             

                $consulta = "EXECUTE dbo.sp_GenerarTransaccion $editar_usuario, $TipoPago, 10000" ;
                
                $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                
            
                if($ejecutar){

                    echo"<script>alert('Transaccion ejecutada correctamente')</script>";
                    echo"<script>window.open('historial.php', '_self')</script>";
                }
                else{
                    echo"<script>alert('No se pudo ejecutar la transaccion')</script>";
                    echo"<script>window.open('carrito.php', '_self')</script>";
                }

            }

        ?>

    <script src="../assets/js/prueba.js"></script>
</body>
</html>
<?php
    session_start();

    $usuario =$_POST ['usuario'];
    $contrasena = $_POST ['contrasena'];
    $pais = $_POST['paisSeleccionado'];


    if($pais == 'CostaRica'){                  /* ESTA CABLEADO PARA SIEMPRE HACERLO CON COSTA RICA*/
        include 'driverCostaRica.php';
    }else if($pais == 'Nicaragua'){
        include 'driverCostaRica.php';
    }else if($pais == 'Panama'){
        include 'driverCostaRica.php';
    }


    $validar_login = "EXECUTE dbo.sp_ValidarAdministrador '$usuario', '$contrasena'";
    $ejecutar = sqlsrv_query ($conn_sis, $validar_login);
    $_SESSION ['usuario'] = $usuario;

    if($ejecutar){
        $fila = sqlsrv_fetch_object( $ejecutar);

        if($fila->Codigo == 0){
            /*header("location: ../PortalAdministrador/hoteles.php");
            exit;
            */
            echo '
            <script>
                alert("Usuario encontrado");
            </script>';
        }else if($fila->Codigo == 1){
            echo '
            <script>
                alert("Usuario inexistente, verificar datos ingresados");
                window.location = "../loginAdministrador.php";
            </script>';

        }else{
            echo '
            <script>
                alert("Error al analizar el usuario");
                window.location = "../loginAdministrador.php";
            </script>';
        }
    }
    else{
        echo "NO FUNCIONA.";
    }
    

?>
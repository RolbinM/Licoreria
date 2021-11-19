<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/styleLogin.css">
    <title>Login Administrador</title>

  </head>
  <body>
   
    <section class="Form my-4 mx-5">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-lg-5">
                    <img src="assets/backgrounds/trago.jpg" class="img-fluid"alt="">
                </div>
                <div class="col-lg-7 px-5 pt-5">
                    <h1 class="font-weight-bold py-3">Licorera</h1>
                    <h4>Login Administrador</h4>
                    <form action="php/loginAdministrador.php" method="POST">
                        <div class="form-row">
                            <div class="col-lg 7">
                                <input type="text" placeholder="Usuario" name="usuario" required class="form-control my-3 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg 7">
                                <input type="password" placeholder="Contraseña" name="contrasena" required class="form-control my-3 p-4">
                            </div>
                        </div>

                        <h4>País:</h4>
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
                                Pánama
                            </label>
                        </div>

                        <br>

                        <div class="form-row">
                            <div class="col-lg 7">
                               <button type="submit" class="btn1 mt-3 mb-5"> Iniciar Sesión </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

  </body>
</html>
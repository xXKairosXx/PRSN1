<?php
  ob_start();
  require_once('includes/load.php');
  if($session->isUserLoggedIn(true)) { redirect('home.php', false);}
?>


<?php include_once('layouts/header.php'); ?>
<div class="login-page">
    <div class="text-center">
       <h1>Bienvenido a PlusBag</h1>
       <p>Iniciar sesión </p>
     </div>
     <?php echo display_msg($msg); ?>
      <form method="post" action="auth.php" class="clearfix">
           <a href="recupera.php" class="btn btn-info pull-right">recuperar contraseña</a>
        <div class="form-group">
  
        <div class="form-group">
              <label for="username" class="control-label">Usuario</label>
              <input type="name" class="form-control" name="username" placeholder="Usuario">
        </div>
        <div class="form-group">
            <label for="Password" class="control-label">Contraseña</label>
            <input type="password" name= "password" class="form-control" placeholder="Contraseña">
        </div>
        <div class="form-group">
                <button type="submit" class="btn btn-info  pull-right">Entrar</button>

        </div>
        
        </div>
    </form>
</div>
<?php include_once('layouts/footer.php'); ?>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fondo-Imagen</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>
  <div class="fondo">
    
  </div>

</body>
</html>

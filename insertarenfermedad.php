<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nombre de usuario
                      // para acceder a la base
$dbpassword="Ga19961904"; // password de acceso para el usuario de la
                      // linea anterior
$db="hospital1";        // Seleccionamos la base con la cual trabajar
$conexion = @mysql_connect($dbhost, $dbusuario, $dbpassword);

if (!$conexion){
	exit('<p>No pudo realizarce la conexión a la base de datos.</p>');
}
if (!@mysql_select_db($db, $conexion)){
	echo mysql_errno();
	exit ('<p>Problema al seleccionar la base de datos $db.</p>');
}


if (!$_POST ){ //evalua si se enviaron los datos del formulario
	?> 


   
    <html>
    <head><title>Insertar Enfermedad</title></head>
    <body>

	<h1><font color=red size=6 face="Courier"><div align="center"><b>Datos a Almacenar</div></h1>
	<center>
	<table border=0>

	<div align="center">
	<form action="insertarenfermedad.php" method="post" name="hobbie">
	<tr><td><font color=blue size=4>ID_Enfermedad:
	<td><input type="text" align="LEFT" name="id_enf" /></tr>
	<tr><td><font color=blue size=4>Enfermedad:
	<td><input type="text" align="LEFT" name="nom_enf" /></tr>			
	<tr><td colspan=2 align=center><input type="submit" value="INSERTAR" name="guardar"><tr>
	</form></div>

	</table>
	</center>
	</body>
	</html>



<?
}
else { //esta parte se ejecuta cuando se han enviado los datos del formulario
 	
 	echo "<br>";
 	$sql = "INSERT INTO enfermedad (ID_EMF,NOM_EMF) "."VALUES ('$id_enf','$nom_enf')";

 	
 	echo "<html><head><title>Resultado</title></head>
    <body>";

 	if(!@mysql_query($sql,$conexion)){
	
		echo '<h3>Los datos NO han sido guardados</h3>';
		if (mysql_errno()==1452){
		echo '<h3>Revisar la integridad referencial. La editorial del libro debe existir.</h3>';
		}
	}
	else{
  		echo '<h3>Los datos han sido guardados</h3><br>';
    }
    echo '<div align="center"><p><a href="menuinsertar1.php">Regresar a menu insertar</a></p></div></body></html>';

}
?>

<? mysql_close($conexion); ?>
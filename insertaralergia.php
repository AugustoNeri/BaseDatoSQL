<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nombre de usuario
                      // para acceder a la base
$dbpassword="rags151195"; // password de acceso para el usuario de la
                      // linea anterior
$db="hospital";        // Seleccionamos la base con la cual trabajar
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
    <head><title>Insertar Alergia</title></head>
    <body>

	<h1><font color=red size=6 face="Courier"><div align="center"><b>Datos a Almacenar</div></h1>
	<center>
	<table border=0>

	<div align="center">
	<form action="insertaralergia.php" method="post" name="hobbie">
	<tr><td><font color=blue size=4>ID_Alergia:
	<td><input type="text" align="LEFT" name="id_al" /></tr>
	<tr><td><font color=blue size=4>Alergia:
	<td><input type="text" align="LEFT" name="nom_al" /></tr>			
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
 	$sql = "INSERT INTO alergia(ID_AL,NOM_AL) "."VALUES ('$id_al','$nom_al')";

 	
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
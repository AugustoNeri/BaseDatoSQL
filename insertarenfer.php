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
    <head><title>Insertar</title></head>
    <body>
<h1><font color=red size=6 face="Courier"><div align="center"><div align="center"><b>Datos a Almacenar</div></h1>
	<center>
	<table border=0>

	<div align="center">
	<form action="insertarenfer.php" method="post" name="medi">


<?


echo "<tr><td><font color=blue size=4>ID_Enfermo";
$con3="SELECT CLAVE_ENF FROM enfermo";
$res3=@mysql_query($con3);
if(!$res3){
echo " fallo";
}
else{
echo "<td><select name='combo1'>";


while ($fila3=mysql_fetch_array($res3)){
echo "<option>", $fila3['CLAVE_ENF']," </option>";



}
echo "</select>";
}
$idc3=$_POST['combo1'];
echo "</tr>";

echo "<tr><td><font color=blue size=4>ID_Enfermedad";
$con4="SELECT ID_EMF FROM enfermedad";
$res4=@mysql_query($con4);
if(!$res4){
echo " fallo";
}
else{
echo "<td><select name='combo2'>";


while ($fila4=mysql_fetch_array($res4)){
echo "<option>", $fila4['ID_EMF']," </option>";



}
echo "</select>";
}
$idc4=$_POST['combo2'];
echo "</tr>";

?>
	<tr><td><font color=red size=4>Teléfono:
	<td><input type="text" align="LEFT" name="tel" /></tr>
	<tr><td colspan=2 align=center><input type="submit" value="INSERTAR" name="guardar"></tr>
	</form></div>
	</table>
	</center>
	</body>
	</html>

<?
}
else { //esta parte se ejecuta cuando se han enviado los datos del formulario
 	
 	echo "<br>";
 	$sql = "INSERT INTO enfer(CLAVE_E2,ID_ENF2) "."VALUES ('$combo1','$combo2')";

 	
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
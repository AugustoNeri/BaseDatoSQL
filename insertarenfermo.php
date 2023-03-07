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
    <head><title>Insertar Enfermo</title></head>
    <body>
<h1><font color=red size=6 face="Courier"><div align="center"><div align="center"><b>Datos a Almacenar</div></h1>
	<center>
	<table border=0>

	<div align="center">
	<form action="insertarendia.php" method="post" name="medi">
	<tr><td><font color=blue size=4>Clave_Enfermo:
	<td><input type="text" align="LEFT" name="id_enf" /></tr>
	<tr><td><font color=blue size=4>Nombre del Enfermo:
	<td><input type="text" align="LEFT" name="nom_enf" /></tr>
	<tr><td><font color=blue size=4>Fecha_Entrada:
	<td><input type="text" align="LEFT" name="fehe_enf" /></tr>
	<tr><td><font color=blue size=4>Fech_Salida:
	<td><input type="text" align="LEFT" name="fehs_enf" /></tr>


<?



echo "<tr><td><font color=blue size=4>ID_Calle";
$con4="SELECT ID_CA FROM calle";
$res4=@mysql_query($con4);
if(!$res4){
echo " fallo";
}
else{
echo "<td><select name='combo2'>";


while ($fila4=mysql_fetch_array($res4)){
echo "<option>", $fila4['ID_CA']," </option>";



}
echo "</select>";
}
$idc4=$_POST['combo2'];
echo "</tr>";



echo "<tr><td><font color=blue size=4>ID_Colonia";
$con4="SELECT ID_COL FROM colonia";
$res4=@mysql_query($con4);
if(!$res4){
echo " fallo";
}
else{
echo "<td><select name='combo3'>";


while ($fila4=mysql_fetch_array($res4)){
echo "<option>", $fila4['ID_COL']," </option>";



}
echo "</select>";
}
$idc5=$_POST['combo3'];
echo "</tr>";


echo "<tr><td><font color=red size=4>ID_Delegación";
$con3="SELECT ID_DEL FROM delegacion";
$res3=@mysql_query($con3);
if(!$res3){
echo " fallo";
}
else{
echo "<td><select name='combo1'>";


while ($fila3=mysql_fetch_array($res3)){
echo "<option>", $fila3['ID_DEL']," </option>";



}
echo "</select>";
}
$idc3=$_POST['combo1'];
echo "</tr>";



?>
	<tr><td><font color=blue size=4>Código Postal:
	<td><input type="text" align="LEFT" name="tiem_c" /></tr>

<?



echo "<tr><td><font color=blue size=4>ID_Enfermedad";
$con4="SELECT ID_EMF FROM enfermedad";
$res4=@mysql_query($con4);
if(!$res4){
echo " fallo";
}
else{
echo "<td><select name='combo4'>";


while ($fila4=mysql_fetch_array($res4)){
echo "<option>", $fila4['ID_EMF']," </option>";



}
echo "</select>";
}
$idc4=$_POST['combo4'];
echo "</tr>";


echo "<tr><td><font color=blue size=4>ID_Tipo Sangre";
$con4="SELECT ID_TS FROM tipo_sangre";
$res4=@mysql_query($con4);
if(!$res4){
echo " fallo";
}
else{
echo "<td><select name='combo5'>";


while ($fila4=mysql_fetch_array($res4)){
echo "<option>", $fila4['ID_TS']," </option>";



}
echo "</select>";
}
$idc4=$_POST['combo5'];
echo "</tr>";

?>

	
	
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
 	$sql = "INSERT INTO enfermo(CLAVE_ENF,NOM_ENF,FEHE_ENF,FEHS_ENF,ID_CA1,ID_CO1,ID_DEL1,CP_ENF,ID_EN1,ID_TS1) "."VALUES ('$id_enf','$nom_enf','$fehe_enf','$fehs_cnf','$combo2','$combo3','$combo1','$tiem_c','$combo4','$combo5')";

 	
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
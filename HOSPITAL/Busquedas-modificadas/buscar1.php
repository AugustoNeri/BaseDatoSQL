<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nom_cLA de usuario
                      // para acceder a la base
$dbpassword="rags151195"; // password de acceso para el usuario de la
                      // linea anterior
$db="hospital";        // Seleccionamos la base con la cual trabajar
$tabla="medicamento";

$conexion = @mysql_connect($dbhost, $dbusuario, $dbpassword);
if (!$conexion){
	exit('<p>No pudo realizarce la conexión a la base de datos.</p>');
}
if (!@mysql_select_db($db, $conexion)){
	exit ('<p>Problema al seleccionar la base de datos $db.</p>');
}

if(!$_POST && !isset($cambiar)){
?>

<head>
<body bgcolor=white><font color="red"> <face="arial">
<div align="center">
<body >
	<font face="cooper black" size=5 color="red"><center>
  
<p> BUSCAR Enfermo</p>
<form action="buscar1.php" method="post" name="Buscar">
  
<br><br>
<p><font size=3>CLAVE:</font>
	<input type="text" align="LEFT" name="id" value="<?php echo $registro['CLAVE_ENF'];?>"/><p>
<br><br>
<input type="submit" value="Buscar" name="Buscar">
	

  </form>  
</div>

</body>
</html>
<?

}
if($_POST){
	?>
	<html>
    	<head><title>RESULTADO DE LA BUSQUEDA</title></head>
    	<body>

 	<?php

	echo "<br>";     
 	$sql =  "Select CLAVE_ENF,NOM_ENF,FEHE_ENF,FEHS_ENF,NOM_CALLE,NOM_COL,NOM_DEL,CP_ENF,NOM_TE,NOM_TS from calle join enfermo on calle.ID_CA=enfermo.ID_CA1 join colonia on enfermo.ID_CO1=colonia.ID_COL join delegacion on enfermo.ID_DEL1=delegacion.ID_DEL join tipoenf on enfermo.ID_EN1=tipoenf.ID_TE join tipo_sangre on enfermo.ID_TS1=tipo_sangre.ID_TS WHERE CLAVE_ENF=".$id;
	//$sql =  "SELECT * from medicamento WHERE id ='1' ORDER BY id ASC ";
	$resultado1= @ mysql_query ($sql);
	if (!$resultado1)
	{
	 exit ('Error en la busqueda');
    }

  ?>
    <HTML>
    <body bgcolor=white background="white">
	<font face="cooper black" size=5 color="red"><center>
<br><br>Resultado de la Búsqueda
<br><br> 
    <table align="center" border="1">
    <tr>
    <td>CLAVE DEL ENFERMO</td>
    <td><h2>NOMBRE DEL ENFERMO </h2></td>
	<td><h2>FECHA ENTRADA </h2></td>
	<td><h2>FECHA_SALIDA</h2></td>
	<td><h2>CALLE</h2></td>
	<td><h2>COLONIA</h2></td>
    <td><h2>DELEGACIÓN</h2></td>
    <td><h2>CÓDIGO POSTAL</h2></td>
	<td><h2>TIPO DE ENFERMEDAD</h2></td>
	<td><h2>TIPO_SANGRE</h2></td>
	</tr>


 <?
while ($row=mysql_fetch_array ($resultado1))
{
echo "<tr><td>". $row["CLAVE_ENF"]. "</td>";
echo "<td>". $row["NOM_ENF"]. "</td>";
echo "<td>" ,$row["FEHE_ENF"],"</td>";
echo "<td>". $row["FEHS_ENF"]. "</td>";
echo "<td>". $row["NOM_CALLE"]. "</td>";
echo "<td>". $row["NOM_COL"]. "</td>";
echo "<td>". $row["NOM_DEL"]. "</td>";
echo "<td>". $row["CP_ENF"]. "</td>";
echo "<td>". $row["NOM_TE"]. "</td>";
echo "<td>". $row["NOM_TS"]. "</td>";
}
   echo '</table>';
 
    echo '<div align="center"><p><a href="buscar1.php"></a></p></div>
    </body>
    </html>';


				}
	echo '<br><br><br><br>';



	echo '</body></html>';


 mysql_close($conexion); ?>
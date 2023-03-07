<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nom_cLA de usuario
                      // para acceder a la base
$dbpassword="rags151195"; // password de acceso para el usuario de la
                      // linea anterior
$db="hospital";        // Seleccionamos la base con la cual trabajar
$tabla="enfermo";

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
  
<p> BUSCAR enfermo medicamento enfermedad</p>
<form action="buscar10.php" method="post" name="Buscar">
  
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
 	$sql =  "Select CLAVE_ENF,NOM_ENF,NOM_AL FROM enfermo join aleenf on enfermo.CLAVE_ENF=aleenf.CLAVE_E4 join alergia on aleenf.ID_ALE1=alergia.ID_AL where CLAVE_ENF=".$id;
	
	$resultado1= @ mysql_query ($sql);
	if (!$resultado1)
	{
	 exit ('Error en la búsqueda');
    }

  ?>
    <HTML>
    <body bgcolor=white background="white">
	<font face="cooper black" size=5 color="red"><center>
	<div align="left"><p><a href="Bienvenida.php">Regresar al menu principal</a></p></div>
<br><br>Resultado de la Búsqueda
<br><br> 
    <table align="center" border="1">
    <tr>
    <td>CLAVE ENFERMO</td>
    <td><h2>NOMBRE DEL ENFERMO </h2></td>
	<td><h2>ALERGIA  </h2></td>
    </tr>


 <?
while ($row=mysql_fetch_array ($resultado1))
{
echo "<tr><td>". $row["CLAVE_ENF"]. "</td>";
echo "<td>". $row["NOM_ENF"]. "</td>";
echo "<td>" ,$row["NOM_AL"],"</td>";
}
   echo '</table>';
 
    echo '<div align="center"><p><a href="buscar6.php"></a></p></div>
    </body>
    </html>';


				}
	echo '<br><br><br><br>';



	echo '</body></html>';


 mysql_close($conexion); ?>
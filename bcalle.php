<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nom_cLA de usuario
                      // para acceder a la base
$dbpassword="ciscouv1"; // password de acceso para el usuario de la
                      // linea anterior
$db="hospital";        // Seleccionamos la base con la cual trabajar
$tabla="calle";

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
<body><font color="black"> <face="arial">
<div align="center">
<body >
	<font face="cooper black" size=5 color="black"><center>
  
<p> BUSCAR CALLE</p>
<form action="bcalle.php" method="post" name="Buscar">
  
<br><br>
<p>CLAVE:
	<input type="text" align="LEFT" name="id" value="<?php echo $registro['ID_CA'];?>"/><p>
<br><br>
<input type="submit" value="CALLE ID" name="Buscar">
	

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
 		$sql =  "Select * from calle where ID_CA =".$id;
	$resultado1= @ mysql_query ($sql);
	if (!$resultado1)
	{
	 exit ('error en la busqueda');
    }

  ?>
    <HTML>
    <body background="red">
	<font face="cooper black" size=5 color="black"><center>
<br><br>Resultado de la Busqueda
<br><br> 
    <table align="center" border="6" bordercolor=blue >
	
    <tr bgcolor=33FFF3>
	<td><font color=white size=5>ID_CALLE</td>
    <td><font  color=white size=5>CALLE</td>
	
    </tr>


 <?
while ($row=mysql_fetch_array ($resultado1))
{

echo "<tr><td>". $row["ID_CA"]. "</td>";
echo "<td>". $row["NOM_CALLE"]. "</td>";
}
   echo '</table>';
    echo '<div align="center"><p><a href="bcalle.php"></a></p></div>
    </body>
    </html>';


				}
	echo '<br><br><br><br>';

	

	echo '</body></html>';


 mysql_close($conexion); ?>
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
  
<p> BUSCAR Enfermo-Enfermedad</p>
<form action="buscar5.php" method="post" name="Buscar">
  
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
 	$sql =  "Select CLAVE_ENF,NOM_ENF,NOM_EMF FROM enfermo join enfer on enfermo.CLAVE_ENF=enfer.CLAVE_E2 join enfermedad on enfer.ID_ENF2=enfermedad.ID_EMF where CLAVE_ENF=".$id;
	
	$resultado1= @ mysql_query ($sql);
	if (!$resultado1)
	{
	 exit ('error en la busqueda');
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
	<td><h2>ENFERMEDAD </h2></td>

    </tr>


 <?
while ($row=mysql_fetch_array ($resultado1))
{
echo "<tr><td>". $row["CLAVE_ENF"]. "</td>";
echo "<td>". $row["NOM_ENF"]. "</td>";
echo "<td>" ,$row["NOM_EMF"],"</td>";
}
   echo '</table>';
 
    echo '<div align="center"><p><a href="buscar4.php"></a></p></div>
    </body>
    </html>';


				}
	echo '<br><br><br><br>';



	echo '</body></html>';


 mysql_close($conexion); ?>
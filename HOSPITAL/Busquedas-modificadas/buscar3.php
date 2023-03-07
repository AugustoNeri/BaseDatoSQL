<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nom_cLA de usuario
                      // para acceder a la base
$dbpassword="rags151195"; // password de acceso para el usuario de la
                      // linea anterior
$db="hospital";        // Seleccionamos la base con la cual trabajar
$tabla="doctor";

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
  
<p> BUSCAR Doctor-Horario-Especialidad</p>
<form action="buscar3.php" method="post" name="Buscar">
  
<br><br>
<p><font size=3>CLAVE:</font>
	<input type="text" align="LEFT" name="id" value="<?php echo $registro['ID_D'];?>"/><p>
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
 	$sql =  "Select ID_D,NOM_D,NOM_ED,NOM_HR FROM horario join doctor on horario.ID_HR=doctor.ID_HR1 join especialidad on doctor.ID_ED1=especialidad.ID_ED where ID_D=".$id;
	
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
    <td>ID DOCTOR</td>
    <td><h2>NOMBRE DEL DOCTOR </h2></td>
	<td><h2>ESPECIALIDAD </h2></td>
	<td><h2>HORARIO</h2></td>

    </tr>


 <?
while ($row=mysql_fetch_array ($resultado1))
{
echo "<tr><td>". $row["ID_D"]. "</td>";
echo "<td>". $row["NOM_D"]. "</td>";
echo "<td>" ,$row["NOM_ED"],"</td>";
echo "<td>". $row["NOM_HR"]. "</td>";
}
   echo '</table>';
 
    echo '<div align="center"><p><a href="buscar2.php"></a></p></div>
    </body>
    </html>';


				}
	echo '<br><br><br><br>';



	echo '</body></html>';


 mysql_close($conexion); ?>
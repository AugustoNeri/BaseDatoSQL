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
  
<p> BUSCAR Medicamento-Laboratorio</p>
<form action="buscar2.php" method="post" name="Buscar">
  
<br><br>
<p><font size=3>CLAVE:</font>
	<input type="text" align="LEFT" name="id" value="<?php echo $registro['ID_MED'];?>"/><p>
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
 	$sql =  "Select ID_MED,NOM_MED,NOM_PREN,NOM_LAB from laboratorio join mela on laboratorio.ID_LAB=mela.ID_LAB1 join medicamento on MELA.ID_MED3=medicamento.ID_MED join mepe on medicamento.ID_MED=mepe.ID_MED1 join presentacion on mepe.ID_PRE1=presentacion.ID_PRE where ID_MED=".$id;
	
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
    <td>ID MEDICAMENTO</td>
    <td><h2>NOMBRE DEL MEDICAMENTO </h2></td>
	<td><h2>PRESENTACIÓN </h2></td>
	<td><h2>NOM. LABORATORIO</h2></td>

    </tr>


 <?
while ($row=mysql_fetch_array ($resultado1))
{
echo "<tr><td>". $row["ID_MED"]. "</td>";
echo "<td>". $row["NOM_MED"]. "</td>";
echo "<td>" ,$row["NOM_PREN"],"</td>";
echo "<td>". $row["NOM_LAB"]. "</td>";
}
   echo '</table>';
 
    echo '<div align="center"><p><a href="buscar2.php"></a></p></div>
    </body>
    </html>';


				}
	echo '<br><br><br><br>';



	echo '</body></html>';


 mysql_close($conexion); ?>
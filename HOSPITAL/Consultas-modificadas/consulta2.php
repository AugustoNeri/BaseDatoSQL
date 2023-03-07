<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nombre de usuario
                      // para acceder a la base
$dbpassword="rags151195"; // password de acceso para el usuario de la
                      // linea anterior
$db="hospital";        // Seleccionamos la base con la cual trabajar
$conexion = @mysql_connect($dbhost, $dbusuario, $dbpassword);

if (!$conexion)
   {
	exit('<p>No pudo realizarce la conexión a la base de datos.</p>');
   }
if (!@mysql_select_db($db, $conexion))
   {
	echo mysql_errno();
	exit ('<p>Problema al seleccionar la base de datos $db.</p>');
   }

if (!$_POST and !$_Get)
        { //evalua si se enviaron los datos del formulario
	?>
    <html>
    <head>
    <title>CONSULTA DE AMIGOS</title>
    </head>
    <body bgcolor=white><font color=red face=Arial>
 	<h1><div align="center">DATOS A CONSULTAR</div></h1>
 	<div align="center">
	

	</body>
	</html>

<?


 	echo "<br>";
 	$sql =  "Select ID_MED,NOM_MED,NOM_PREN,NOM_LAB from laboratorio join mela on laboratorio.ID_LAB=mela.ID_LAB1 join medicamento on MELA.ID_MED3=medicamento.ID_MED join mepe on medicamento.ID_MED=mepe.ID_MED1 join presentacion on mepe.ID_PRE1=presentacion.ID_PRE";
	$resultado1= @ mysql_query ($sql);
	if (!$resultado1)
	{
	 exit ('error en la consulta');
    }
    ?>
    <HTML>
    <BODY>
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
    echo '<div align="center"><p><a href="consultas.html">Regresar a Consultas</a></p></div>
    </body>
    </html>';

}
 mysql_close($conexion); ?>
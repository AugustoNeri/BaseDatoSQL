<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nombre de usuario
                      // para acceder a la base
$dbpassword="Ga19961904"; // password de acceso para el usuario de la
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
 	$sql =  "Select ID_D,NOM_D,NOM_ED,NOM_HR FROM horario join doctor on horario.ID_HR=doctor.ID_HR1 join especialidad on doctor.ID_ED1=especialidad.ID_ED";
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
    echo '<div align="center"><p><a href="consultas.html">Regresar a Consultas</a></p></div>
    </body>
    </html>';

}
 mysql_close($conexion); ?>
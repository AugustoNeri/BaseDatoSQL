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
 	$sql =  "Select CLAVE_ENF,NOM_ENF,NOM_MED,NOM_EMF FROM enfermo join meen on enfermo.CLAVE_ENF=meen.CLAVE_E7 join medicamento on meen.ID_MED6=medicamento.ID_MED join enfer on enfermo.CLAVE_ENF=enfer.CLAVE_E2 join enfermedad on enfer.ID_ENF2=enfermedad.ID_EMF";
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
    <td>CLAVE ENFERMO</td>
    <td><h2>NOMBRE DEL ENFERMO </h2></td>
	<td><h2>MEDICAMENTO </h2></td>
	<td><h2>ENFERMEDAD </h2></td>
	</tr>


 <?
while ($row=mysql_fetch_array ($resultado1))
{
echo "<tr><td>". $row["CLAVE_ENF"]. "</td>";
echo "<td>". $row["NOM_ENF"]. "</td>";
echo "<td>" ,$row["NOM_MED"],"</td>";
echo "<td>" ,$row["NOM_EMF"],"</td>";
}
   echo '</table>';
    echo '<div align="center"><p><a href="consultas.html">Regresar a Consultas</a></p></div>
    </body>
    </html>';

}
 mysql_close($conexion); ?>
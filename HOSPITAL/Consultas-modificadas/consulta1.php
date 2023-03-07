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
 	$sql =  "Select CLAVE_ENF,NOM_ENF,FEHE_ENF,FEHS_ENF,NOM_CALLE,NOM_COL,NOM_DEL,CP_ENF,NOM_TE,NOM_TS from calle join enfermo on calle.ID_CA=enfermo.ID_CA1 join colonia on enfermo.ID_CO1=colonia.ID_COL join delegacion on enfermo.ID_DEL1=delegacion.ID_DEL join tipoenf on enfermo.ID_EN1=tipoenf.ID_TE join tipo_sangre on enfermo.ID_TS1=tipo_sangre.ID_TS";
	$resultado1= @ mysql_query ($sql);
	if (!$resultado1)
	{
	 exit ('Error en la consulta');
    }
    ?>
    <HTML>
    <BODY>
    <table align="center" border="1">
    
    <tr>
    <td>CLAVE DEL ENFERMO</td>
    <td><h2>NOMBRE DEL ENFERMO </h2></td>
	<td><h2>FECHA ENTRADA </h2></td>
	<td><h2>FECHA_SALIDA</h2></td>
	<td><h2>CALLE</h2></td>
	<td><h2>COLONIA</h2></td>
    <td><h2>DELEGACIÓNN</h2></td>
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
    echo '<div align="center"><p><a href="consultas.html">Regresar a Consultas</a></p></div>
    </body>
    </html>';

}
 mysql_close($conexion); ?>
<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nombre de usuario
                      // para acceder a la base
$dbpassword="Ga19961904"; // password de acceso para el usuario de la
                      // linea anterior
$db="hospital1";        // Seleccionamos la base con la cual trabajar
$tabla="viaadmon";

$conexion = @mysql_connect($dbhost, $dbusuario, $dbpassword);
if (!$conexion){
	exit('<p>No pudo realizarce la conexión a la base de datos.</p>');
}
if (!@mysql_select_db($db, $conexion)){
	exit ('<p>Problema al seleccionar la base de datos $db.</p>');
}

if(!$_POST && !isset($cambiar)){
?>
    <html>
    <head><title>Modificar Via Admon.</title></head>
    <body>

	<?
	$sql = "SELECT * FROM ".$tabla;

	$resultado = @mysql_query($sql);
	if(!$resultado){
		exit('<p>Error en el Query.'.$resultado.'</p>');
	}
?>

<h1><div align="center"><font size=15 face="Courier" color=red>Contenido de la Base de Datos <?php echo $db.", tabla ".$tabla;?></div></h1>
<table align="center" border=6 cellpadding="1" cellspacing="1" bordercolor=red>

<th><font color=blue size=5>ID_Via Admon.</th>
<th><font color=blue size=5>Via Admon.</th>


</tr>

<?
while ($row=mysql_fetch_array($resultado)){
	echo "<tr><td align=center>".$row['ID_VIA']."</td>";
	echo "<td align=center>".$row['NOM_VA']."</td>";
echo "<td align=center><a href=".$_SERVER['PHP_SELF']."?cambiar=".$row['ID_VIA'].">Editar</a></td></tr>";
}
?>
	</table>
	</div>
	</body>
	</html>
<?
}
if (isset ($cambiar)){
	//echo $_GET;
	//echo "cambiar=".$cambiar;
	$sql = "SELECT * FROM ".$tabla." WHERE ID_VIA=".$cambiar;
	//echo "sql=".$sql;
	$registro = @mysql_query($sql);
	if(!$registro){
		echo "Error ".mysql_errno();
		exit('<p>No se pudo obtener los detalles del registro.</p>');
	}
	$registro = mysql_fetch_array($registro);
	//echo "titulo=".$registro['Titulo'];
	?>

	<html>
    	<head><title>Actualizar Datos</title></head>
    	<body>
	<h1><div align="center">Editando Datos</div></h1>

	<div align="center">
	<form action="<?php echo $_SERVER['PHP_self'];?>" method="post" name="amigo">
	<p><font color=blue size=5>ID_Via Admon:
	<input type="hidden" align="LEFT" name="id_via" value="<?php echo $registro['ID_VIA'];?>" /><p>
	<p><font color=blue size=5>Via Admon:
	<input type="text" align="LEFT" name="nom_via" value="<?php echo $registro['NOM_VA'];?>"/><p>
	
	
	<input type="submit" value="ACTUALIZAR" name="actualizar">
	</form></div>
	

	</body>
	</html>
<?PHP
}
if($_POST){
	?>
	<html>
    	<head><title>Resultado de UPDATE</title></head>
    	<body>

 	<?php

		$sql="UPDATE ".$tabla." SET
		NOM_VA='$nom_via'
		WHERE ID_VIA=".$cambiar;
		//echo "sql=".$sql;

		if(@mysql_query($sql)){   
			echo '<script>alert("Registro Actualizado.");</script>';
		}
		else{
			echo "<p>Error al actualizar el registro.</p>";
			echo mysql_errno();
			if (mysql_errno()==1452){
				echo "existe una restricción y tendrá que actualizar datos en editorial.";
			}
		}
	/*echo '<div align="center"><p><a href="cambios.html">Regresar a Cambios</a></p></div>';*/
	echo '</body></html>';

}
 mysql_close($conexion); ?>
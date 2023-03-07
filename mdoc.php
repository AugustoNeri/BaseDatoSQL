<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nombre de usuario
                      // para acceder a la base
$dbpassword="ciscouv1"; // password de acceso para el usuario de la
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
    <html>
    <head><title>datos en la base</title></head>
    <body>

	<?
	$sql = "SELECT * FROM ".$tabla;

	$resultado = @mysql_query($sql);
	if(!$resultado){
		exit('<p>Error en el Query.'.$resultado.'</p>');
	}
?>

<h1><div align="center">Contenido de la base de datos <?php echo $db.", tabla ".$tabla;?></div></h1>
<table align="center" border=1 cellpadding="1" cellspacing="1">

<th>ID DOCTOR</th>
<th>DOCTOR</th>
<th>CEDULA</th>
<th>ID ESPECIALIDAD</th>
<th>ID HORARIO</th>


</tr>

<?
while ($row=mysql_fetch_array($resultado)){
	echo "<tr><td>".$row['ID_D']."</td>";
	echo "<td>".$row['NOM_D']."</td>";
	echo "<td>".$row['CED_D']."</td>";
	echo "<td>".$row['ID_ED1']."</td>";
	echo "<td>".$row['ID_HR1']."</td>";
	echo "<td><a href=".$_SERVER['PHP_SELF']."?cambiar=".$row['ID_D'].">Editar</a></td></tr>";
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
$sql = "SELECT * FROM ".$tabla." WHERE ID_D=".$cambiar;
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
    	<head><title>Actualizar datos</title></head>
    	<body>
	<h1><div align="center">Editando Datos</div></h1>

	<div align="center" border=1 cellpadding="1" cellspacing="1">
	<form action="<?php echo $_SERVER['PHP_self'];?>" method="post" name="amigo">
	<p>
	<input type="hidden" align="LEFT" name="ID" value="<?php echo $registro['ID_D'];?>" /><p>
	<p>DOCTOR:
	<input type="text" align="LEFT" name="TP" value="<?php echo $registro['NOM_D'];?>"/><p>
		<p>CEDULA:
	<input type="text" align="LEFT" name="CE" value="<?php echo $registro['CED_D'];?>"/><p>
		<p>ID ESPECIALIDAD:
	<input type="text" align="LEFT" name="ED" value="<?php echo $registro['ID_ED1'];?>"/><p>
		<p>ID HORARIOS:
	<input type="text" align="LEFT" name="HR" value="<?php echo $registro['ID_HR1'];?>"/><p>
	<input type="submit" value="Actualizar" name="actualizar">
	</form></div>
	<div align="center"><p><a href="modi.html">Regresar a Cambios</a></p></div>

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
		NOM_D='$TP',
		CED_D='$CE',
		ID_ED1='$ED',
		ID_HR1='$HR'
       WHERE ID_D=".$cambiar;
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
<?
$dbhost="localhost";  // host del MySQL (generalmente localhost)
$dbusuario="root"; // aqui debes ingresar el nombre de usuario
                      // para acceder a la base
$dbpassword="rootroot"; // password de acceso para el usuario de la
                      // linea anterior
$db="MEDICAMENTO2";        // Seleccionamos la base con la cual trabajar
$tabla="DOCTOR";

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

<th>CLAVE</th>
<th>NOMBRE</th>
<th>CEDULA</th>
<th>HORARIO</th>
<th>ESPECIALIDAD</th>

</tr>

<?
while ($row=mysql_fetch_array($resultado)){
	echo "<tr><td>".$row['ID_DOC']."</td>";
	echo "<td>".$row['NOM_DOC']."</td>";	
	echo "<td>".$row['CED_DOC']."</td>";	
	echo "<td>".$row['ID_HOR1']."</td>";	
	echo "<td>".$row['ID_ESP1']."</td>";	
	echo "<td><a href=".$_SERVER['PHP_SELF']."?cambiar=".$row['ID_DOC'].">Editar</a></td></tr>";
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
	$sql = "SELECT * FROM ".$tabla." WHERE ID_DOC=".$cambiar;
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

	<div align="center">
	<form action="<?php echo $_SERVER['PHP_self'];?>" method="post" name="doctor">
	<p>
	<input type="hidden" align="LEFT" name="id" value="<?php echo $registro['ID_DOC'];?>" /><p>
<p>NOMBRE:
	<input type="text" align="LEFT" name="nombre" value="<?php echo $registro['NOM_DOC'];?>"/><p>
<p>CEDULA:
	<input type="text" align="LEFT" name="cedula" value="<?php echo $registro['CED_DOC'];?>"/><p>

<!--     *****************************************************************            -->
<p>CLAVE HORARIO:

<?php 
$con3="SELECT ID_HOR FROM HORARIO";
$res3=@mysql_query($con3);
if(!$res3){ echo " fallo";}
else{

echo "<select name='combo3'>";
      while ($fila3=mysql_fetch_array($res3)){
          echo "<option>", $fila3['ID_HOR']," </option>"; }
echo "</select>";
}

$clhob1=$_POST3['combo3'];
?>

<!--     *****************************************************************            -->
<!--     *****************************************************************            -->
<p>CLAVE ESPECIALIDAD:

<?php 
$con4="SELECT ID_ESP FROM ESPECIALIDAD";
$res4=@mysql_query($con4);
if(!$res4){ echo " fallo";}
else{

echo "<select name='combo4'>";
      while ($fila4=mysql_fetch_array($res4)){ echo "<option>", $fila4['ID_ESP']," </option>"; }
echo "</select>";
}

$clhob2=$_POST4['combo4'];
?>

<!--     *****************************************************************            -->



	<br><br>
	<input type="submit" value="Actualizar" name="actualizar">
	</form></div>
	<div align="center"><p><a href="Z_MOD_doctor.php">Regresar a Cambios</a></p></div>

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

		$sql="UPDATE ".$tabla." SET NOM_DOC='$nombre',CED_DOC='$cedula',ID_HOR1='$combo3',ID_ESP1='$combo4' WHERE ID_DOC=".$cambiar;
		//echo "sql=".$sql;

		if(@mysql_query($sql)){
			echo '<script>alert("Registro Actualizado.");</script>';
		}
		else{
			echo "<p>Error al actualizar el registro.</p>";
			echo mysql_errno();
			if (mysql_errno()==1452){
				echo "existe una restricción.";
			}
		}
	/*echo '<div align="center"><p><a href="Z_MOD_horario.php">Regresar a Cambios</a></p></div>';*/
	echo '</body></html>';

}
 mysql_close($conexion); ?>
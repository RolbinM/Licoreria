<?php 

$serverName = 'Localhost';
$connectionInfo = array("Database"=>"ProyectoBases2", "UID"=>"sa","PWD"=>"sa","CharacterSet"=>"UTF-8");

$conn_sis = sqlsrv_connect ($serverName, $connectionInfo);
?>
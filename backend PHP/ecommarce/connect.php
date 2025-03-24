<?php
$dsc = "mysql:host=localhost;dbname=ecommence";
$user = "root";
$pass="";
$options = array(
    PDO::MYSQL_ATTR_INIT_COMMAND =>"SET NAMES UTF8"
);

try{
    $con= new PDO($dsc,$user,$pass,$options);
    $con->setAttribute(PDO::ATTR_ERRMODE , PDO::ERRMODE_EXCEPTION);
    
    include 'function.php';



}catch(PDOException $e){
    echo $e->getMessage();
 
}
?>
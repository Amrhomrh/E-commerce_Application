<?php 
include '../../connect.php';
$email=FilterRequest('email');
$password=FilterRequest('password');

$stmt=$con->prepare("UPDATE `users` SET `users_password` = ? WHERE `users_email` = ?");
$stmt->execute(array($password,$email));
$count=$stmt->rowCount();
if($count>0){

    echo json_encode(array("stutes" => "success"));
    }

else{
    echo json_encode(array("stutes" => "filde"));
}



?>
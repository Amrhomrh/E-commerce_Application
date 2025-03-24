<?php
include '../connect.php';
$email=FilterRequest('email');
$verifycode=FilterRequest('verify');
$stmt=$con->prepare("SELECT * FROM `users` WHERE `users_email` = ? AND `users_verfiycode` = ?");
$stmt->execute(array($email,$verifycode));
$count=$stmt->rowCount();
if($count>0){
    $stmt=$con->prepare("UPDATE `users` SET `users_approve` = '1'  WHERE `users_email` = ?");
    $stmt->execute(array($email));
    $count=$stmt->rowCount();
    if($count>0){

    echo json_encode(array("stutes" => "success"));
    }
}
else{
    echo json_encode(array("stutes" => "filde"));
}
?>
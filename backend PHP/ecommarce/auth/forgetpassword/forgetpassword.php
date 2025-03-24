<?php
include '../../connect.php';
$email=FilterRequest('email');
$verfiycode =66666;
$stmt=$con->prepare("SELECT * FROM `users` WHERE `users_email` = ?");
$stmt->execute(array($email));
$count= $stmt->rowCount();
if($count > 0){
    $stmt=$con->prepare("UPDATE `users` SET  `users_verfiycode`= ? WHERE `users_email` = ?  ");
    $stmt->execute(array($verfiycode,$email));
    echo json_encode(array("stutes" => "success"));
}
else{
    echo json_encode(array("stutes" => "feald"));
}

?>
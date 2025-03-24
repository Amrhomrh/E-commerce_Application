<?php 

include "../connect.php";

$userId = FilterRequest('id');

$username=FilterRequest('username');
$email=FilterRequest('email');
$phone=FilterRequest('phone');



$stmt=$con->prepare("UPDATE `users` SET `users_name`='$username' ,`users_email`='$email',`users_phone`='$phone' WHERE users_id = $userId ");


$stmt->execute();


$count = $stmt->rowCount();//boolen

if($count > 0 )
{
    echo json_encode(array("stutes"=>"success"  ));
}
else{

    echo json_encode(array("stutes"=>"failed" ));
}

?>
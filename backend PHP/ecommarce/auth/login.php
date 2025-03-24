<?php
include '../connect.php';

$email = FilterRequest('email');
$password=FilterRequest('password');

$stmt = $con->prepare("SELECT * FROM `users` WHERE  `users_password` =? And `users_email` = ?  ");

$stmt->execute(array($password ,  $email));
$data= $stmt->fetchAll(PDO::FETCH_ASSOC);
$count=$stmt->rowCount();
if($count > 0){
    if($data[0]["users_approve"] == "1"){
        echo json_encode(array("stutes"=>"success" , "data" =>$data ));
    }
    else{
        echo json_encode(array("stutes"=>"must chick for your verifycode"));
    }
    // echo  json_encode(array("stutes"=>"success" , "data" =>$data["users_approve"] ));

}
else{
    echo json_encode(array("stutes"=>"fealde" ));

}



?>
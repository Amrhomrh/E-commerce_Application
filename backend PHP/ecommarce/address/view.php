<?php
include '../connect.php';

$id=FilterRequest('userid');

$stmt=$con->prepare("SELECT * FROM `address` WHERE address.address_usersId = $id");
$stmt->execute();
$data= $stmt->fetchAll(PDO::FETCH_ASSOC);

$count = $stmt->rowCount();

if($count > 0){

    echo json_encode(array("stutes"=>"success" , "data" =>$data ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}


?>
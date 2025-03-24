<?php
include '../connect.php';
$address_id=FilterRequest('address_id');

$stmt=$con->prepare("DELETE FROM `address` WHERE 	address_id=$address_id");
$stmt->execute();
$count = $stmt->rowCount();

if($count > 0){

    echo json_encode(array("stutes"=>"success"  ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}

?>
<?php
include '../connect.php';
$address_id=FilterRequest('address_id');
$userId=FilterRequest('usersid');
$address_name=FilterRequest('address_name');
$citys=FilterRequest('citys');
$street=FilterRequest('street');
$stms = $con->prepare("UPDATE `address` SET `address_name`=? ,`address_usersId`= ? ,`address_city`= ? ,`address_street`=? ,`address_lat`= 0.0 ,`address_long`=0.0 WHERE `address_id` = ?  ");
$stms->execute(array($address_name,$userId,$citys,$street , $address_id));
$count = $stms->rowCount();

if($count > 0){

    echo json_encode(array("stutes"=>"success"  ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}



?>
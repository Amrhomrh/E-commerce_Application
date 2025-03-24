<?php
include '../connect.php';

$userId=FilterRequest('usersid');
$address_name=FilterRequest('address_name');
$citys=FilterRequest('citys');
$street=FilterRequest('street');
$lat=FilterRequest('lat');
$long=FilterRequest('long');
$stms = $con->prepare("INSERT INTO `address` ( `address_name`, `address_usersId`, `address_city`, `address_street`, `address_lat`, `address_long`)
 VALUES ( ?, ?, ?, ?, ?, ?);");
$stms->execute(array($address_name,$userId,$citys,$street,$lat,$long));
$count = $stms->rowCount();

if($count > 0){

    echo json_encode(array("stutes"=>"success"  ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}

?>
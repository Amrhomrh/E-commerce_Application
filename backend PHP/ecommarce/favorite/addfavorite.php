<?php
include '../connect.php';

$userid = FilterRequest('userid');
$itemsid=FilterRequest('itemsid');

$stms = $con->prepare("INSERT INTO `favorite`( `favorite_usresid`, `favorite_itemsid`)
 VALUES (?,?)");

 $stms->execute(array($userid,$itemsid));
$count = $stms->rowCount();

if($count > 0){

    echo json_encode(array("stutes"=>"success"  ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}

?>
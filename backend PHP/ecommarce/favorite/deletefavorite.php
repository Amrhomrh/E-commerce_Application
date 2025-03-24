<?php
include '../connect.php';

$userid = FilterRequest('userid');
$itemsid=FilterRequest('itemsid');

$stms = $con->prepare("DELETE FROM `favorite` where favorite_usresid = ? And favorite_itemsid= ?");

 $stms->execute(array($userid,$itemsid));
$count = $stms->rowCount();

if($count > 0){

    echo json_encode(array("stutes"=>"success"  ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}

?>
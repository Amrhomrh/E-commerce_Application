<?php
include '../connect.php';

$userid = FilterRequest('userid');
$itemsid=FilterRequest('itemsid');

$stms = $con->prepare("DELETE  FROM cart WHERE cart_id =(SELECT cart_id FROM cart WHERE cart_itemsid=? AND cart_usersid=? AND cart_order = 0 LIMIT 1 )");

 $stms->execute(array($itemsid,$userid));
$count = $stms->rowCount();

if($count > 0){

    echo json_encode(array("stutes"=>"success"  ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}

?>
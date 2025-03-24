<?php

include '../connect.php';

$userid = FilterRequest('userid');
$itemsid=FilterRequest('itemsid');

$stms = $con->prepare("SELECT * FROM cart WHERE cart_itemsid=? AND cart_usersid = ? ");
 $stms->execute(array($itemsid,$userid));
$count = $stms->rowCount();

// if($count > 0){

    echo json_encode(array("stutes"=>"success"  ));
    $inser=$con->prepare("INSERT INTO `cart`( `cart_itemsid`, `cart_usersid`) VALUES (?,?)");
    $inser->execute(array($itemsid,$userid));
// }
// else{
//    $inser=$con->prepare("INSERT INTO `cart`( `cart_itemsid`, `cart_usersid`) VALUES (?,?)");
//    $inser->execute(array($itemsid,$userid));
// }

?>


<?php
include '../connect.php';

// $userid = FilterRequest('userid');
// $itemsid=FilterRequest('itemsid');
// $stms=$con->prepare("SELECT COUNT(cart.cart_id) as CountItems  FROM `cart` WHERE cart_usersid= ? AND cart_itemsid = ?");

// $stms->execute(array($userid,$itemsid));
// $data=$stms->fetchColumn();
// $count = $stms->rowCount();
// if($count > 0){

//     echo json_encode(array("stutes"=>"success" , "data" => $data  ));
// }
// else{
//     echo json_encode(array("stutes"=>"success" ,  "data" => "0"));
// }



$userid = FilterRequest('userid');
$itemsid=FilterRequest('itemsid');
$stms=$con->prepare("SELECT items.items_id ,SUM(items.items_price - items.items_price * items.items_discount / 100) as total ,COUNT(cart.cart_id) as CountItems FROM cart
INNER JOIN items on items.items_id = cart.cart_itemsid AND cart.cart_usersid = ?
WHERE items.items_id = ? AND cart_order = 0 
GROUP BY cart.cart_itemsid, cart.cart_usersid");

$stms->execute(array($userid,$itemsid));
$data=$stms->fetchAll(PDO::FETCH_ASSOC);
$count = $stms->rowCount();
if($count > 0){

    echo json_encode(array("stutes"=>"success" , "data" => $data  ));
}
else{
    echo json_encode(array("stutes"=>"success" ,  "data" => "0"));
}
?>
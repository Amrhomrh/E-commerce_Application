<?php
include '../connect.php';

$orderId=FilterRequest('orderId');

$stmt=$con->prepare("SELECT SUM(items.items_price-items.items_price*items.items_discount / 100 ) as priceItems, COUNT(cart.cart_itemsid) as countItems, items.* , cart.* FROM cart
INNER JOIN items ON items.items_id=cart.cart_itemsid
WHERE cart.cart_order = $orderId
GROUP BY cart.cart_itemsid ");
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
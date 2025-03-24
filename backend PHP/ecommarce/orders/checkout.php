<?php

include '../connect.php';

$userId=FilterRequest('userid');
$addressId=FilterRequest('addressid');
$types=FilterRequest('orderstypes');
$pricedelivery=FilterRequest('pricedelivery');
$ordersprice=FilterRequest('ordersprice');

$payments=FilterRequest('payments');

if($types == "1"){
    $pricedelivery = 0;
}
$totalprice = $pricedelivery + $ordersprice;

$stmt=$con->prepare("INSERT INTO `orders`( `orders_usersid`, `orders_address`, `orders_type`, `orders_pricedelivery`, `orders_price`, `orders_totalprice`,`orders_payments`) VALUES( '$userId' , '$addressId' , '$types' , '$pricedelivery' , '$ordersprice','$totalprice' , '$payments')");
$stmt->execute();
$count = $stmt->rowCount();

if($count > 0){

    $stmt2=$con->prepare("SELECT MAX(orders_id) From  orders WHERE orders_usersid = $userId");
    $stmt2->execute();
    $maxid=$stmt2->fetchColumn();

    $stmt3=$con->prepare("UPDATE cart SET cart_order = $maxid WHERE  cart_usersid = $userId AND cart_order = 0");
    $stmt3->execute();


    echo json_encode(array( "stutes"=>"success" ));
}
else{
    echo json_encode(array( "stutes"=>"feald" ));
}

?>
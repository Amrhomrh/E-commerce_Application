<?php

include "../../connect.php";

$orderid=FilterRequest('orderid');
$userid=FilterRequest('usersid');

$stmt=$con->prepare("UPDATE `orders` SET `orders_stutes` = '1'  WHERE `orders_id`= '$orderid' AND `orders_stutes`= '0' ");
$stmt->execute();
$count= $stmt->rowCount();

if($count > 0){
    echo json_encode(array("states" => "success"));
    // sendGCM(" States Your Orders" , " the order has approved" , "amr$userid" , 'none' , 'aprroveNotification');
    insertNotifi(" States Your Orders" , " the order has approved" , "amr$userid" , 'none', 'aprroveNotification', "$userid");
}
else{
    echo json_encode(array("states" => "feald"));

}

?>
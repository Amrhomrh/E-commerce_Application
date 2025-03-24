<?php
include '../connect.php';
 $id=FilterRequest('userid');


 $stmt=$con->prepare("SELECT cartview.* FROM cartview
WHERE cartview.cart_usersid=?");
$stmt->execute(array($id));
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count=$stmt->rowCount();



$sql=$con->prepare("SELECT SUM(cartview.priceitems) as totalprice , SUM(cartview.countitems) as totalcount FROM cartview
WHERE cartview.cart_usersid=?
GROUP BY cartview.cart_usersid");
$sql->execute(array($id));
$countpraice=$sql->fetch(PDO::FETCH_ASSOC);

if($count >0){
    echo json_encode(array(
        "stutes" => "success",
        "data" =>$data,
        "countpraice" =>$countpraice
    ));    
}
else{
    echo json_encode(array("stutes"=>"feald"));
}
// $stmt=$con->prepare("SELECT items.*,0 as quantity , cart.* FROM items
// INNER JOIN cart on cart.cart_itemsid=items.items_id AND cart.cart_usersid=?");
// $stmt->execute(array($id));
// $data= $stmt->fetchAll(PDO::FETCH_ASSOC);
// $count = $stmt->rowCount();

// if($count > 0){

//     echo json_encode(array("stutes"=>"success" , "data" => $data ));
// }
// else{
//     echo json_encode(array("stutes"=>"feald"));
// }


?>
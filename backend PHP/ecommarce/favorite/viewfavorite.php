<?php
include '../connect.php';
$id=FilterRequest('userid');

$stmt=$con->prepare("SELECT favorite.*,items.* FROM items
INNER JOIN favorite on favorite.favorite_itemsid = items.items_id AND favorite.favorite_usresid= ?; ");
$stmt->execute(array($id));
$data= $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if($count > 0){

    echo json_encode(array("stutes"=>"success" , "data" => $data ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}


?>
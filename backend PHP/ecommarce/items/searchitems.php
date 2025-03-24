<?php
include '../connect.php';

$search=FilterRequest('searchitems');

$stmt=$con->prepare("SELECT * FROM items WHERE items.items_name LIKE '%$search%' OR items.items_name_ar LIKE '%$search%'");
$stmt->execute();
$count=$stmt->rowCount();
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
 
if($count > 0){
    echo json_encode(array("stutes" => "success" , "data" => $data));
}
else{
    echo json_encode(array("stutes" => "feald" ));
}
?>
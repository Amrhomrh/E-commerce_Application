<?php 

include "../connect.php";

$userId = FilterRequest('id');

$stmt=$con->prepare("SELECT * FROM  users WHERE users_id = $userId ");

$stmt->execute();

$data= $stmt->fetchAll(PDO::FETCH_ASSOC);

$count = $stmt->rowCount();//boolen

if($count > 0 )
{
    echo json_encode(array("stutes"=>"success" , "data" => $data ));
}
else{

    echo json_encode(array("stutes"=>"failed" ));
}
?>
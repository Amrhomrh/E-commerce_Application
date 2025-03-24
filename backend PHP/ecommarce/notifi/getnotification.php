<?php

include '../connect.php';

$userID = FilterRequest('userid');

$stmt=$con->prepare("SELECT * FROM `notification` WHERE notifi_userid = $userID ORDER BY notift_id DESC ");
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
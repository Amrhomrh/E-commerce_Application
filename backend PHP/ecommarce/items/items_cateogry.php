<?php
include '../connect.php';

$cateogryId = FilterRequest('id');
$user = FilterRequest('userid');



// $stmt = $con->prepare("SELECT * FROM `items` WHERE  `cate_id` =?   ");
// $stmt->execute(array($cateogryId));
// $data= $stmt->fetchAll(PDO::FETCH_ASSOC);
// $count=$stmt->rowCount();
// if($count > 0){

//     echo json_encode(array("stutes"=>"success" , "data" =>$data ));
// }
// else{
//     echo json_encode(array("stutes"=>"feald"));
// }

$stmt = $con->prepare("SELECT items.* , 1 as favorite , (items_price - (items_price * items_discount / 100)) as itemspricediscount    FROM items
 INNER JOIN favorite on favorite.favorite_itemsid=items.items_id AND favorite.favorite_usresid= $user
  WHERE items.cate_id=$cateogryId 
  UNION ALL
   SELECT * , 0 as favorite , (items_price - (items_price * items_discount / 100)) as itemspricediscount FROM items 
   WHERE items.cate_id=$cateogryId  And items.items_id Not IN  (SELECT items.items_id FROM items 
   INNER JOIN favorite on favorite.favorite_itemsid=items.items_id AND favorite.favorite_usresid=$user); ");
$stmt->execute();
$data= $stmt->fetchAll(PDO::FETCH_ASSOC);
$count=$stmt->rowCount();
if($count > 0){

    echo json_encode(array("stutes"=>"success" , "data" =>$data ));
}
else{
    echo json_encode(array("stutes"=>"feald"));
}


?>
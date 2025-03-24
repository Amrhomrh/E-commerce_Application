<?php
include 'connect.php';
$alldata=array();
function getCateogry(){
    global $con;
    $stmt=$con->prepare("SELECT * FROM `cateogreys`");
    $stmt->execute();
    $data=$stmt->fetchAll(PDO::FETCH_ASSOC);    
    $count=$stmt->rowCount();
    if($count>0){
    
       return $data ;
    }   
}
function getItems(){
    global $con;
    $stmt=$con->prepare("SELECT * FROM `items`");
    $stmt->execute();
    $data=$stmt->fetchAll(PDO::FETCH_ASSOC);    
    $count=$stmt->rowCount();
    if($count>0){
    
        return $data ;
    } 
}
// getCateogry();
// getItems();
$alldata['cateogreys']=getCateogry();
$alldata['items']=getItems();
if(getCateogry() || getItems()  !=null  ){
    $alldata['stutes']="success";
    echo json_encode($alldata);
}
//  if(getItems() !=null ){

// }
else{
    
    echo json_encode(array("stutes"=>"feald"));
}
?>

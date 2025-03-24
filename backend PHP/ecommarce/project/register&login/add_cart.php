<?php

include 'connectdb.php';
if(isset($_GET['add'])){
    $id_add=$_GET['id'];
    
    $sel="SELECT *  FROM items  WHERE items_id='$id_add'";
    $add=$database->prepare($sel);
    $add->execute();
    $adds=$add->fetchAll(PDO::FETCH_OBJ);

foreach($adds as $addss) : 

 $img= "img/" .  $addss->img_position;
 $names=$addss->pro_name;
 $prics=$addss->pro_price;
 $coins=$addss->pro_coin;
endforeach; 
$addcart="INSERT INTO addcart(cart_img,cart_name, cart_price , cart_coin) VALUES(:img ,:name ,:price ,:coin)";
$insert_cart=$database->prepare($addcart);
$insert_cart->bindParam(":img",$img );
$insert_cart->bindParam(":name",$names);
$insert_cart->bindParam(":price",$prics);
$insert_cart->bindParam(":coin",$coins);
$insert_cart->execute();


if($insert_cart){
    echo " <script> alert('تم شراء المنتج بنجاح')  </script>";
    echo "<head>
    <meta http-equiv='refresh' content='0; URL=view_produ.php'>
    </head>";
    
}
else{
    echo " <script> alert('لم شراء رفع المنتج')  </script>";
}



}?>

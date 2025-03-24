<?php
include 'connectdb.php';
if(isset($_POST['del'])){
    $idcart=$_POST['id'];
    $delcart="DELETE FROM  addcart WHERE id=$idcart";
    $delcarts=$database->prepare($delcart);
    $delcarts->execute();
    $del_cart=$delcarts->fetchObject();
    if($delcarts){
        echo ' <script> alert("data deleted turn");  </script> ';
           echo "<head>
          <meta http-equiv='refresh' content='0; URL=show_cart.php'>
          </head>";
    
       }
       else{
        echo ' <script> alert("not data deleted ");  </script> ';
       }

}







?>
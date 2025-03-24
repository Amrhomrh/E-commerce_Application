<?php
include 'connectdb.php';

if(isset($_GET['delete']))
{
   $pro_id =$_GET['id'];
   $del ="DELETE  FROM products WHERE pro_id='$pro_id'";
   $del_run =$database->prepare($del);
   $del_run->execute();
   $dels_run =$del_run->fetchObject();

   $id =$_GET['id'];
   $del_photo ="DELETE  FROM images WHERE id='$id'";
   $del_photo =$database->prepare($del_photo);
   $del_photo->execute();
   $dels_runs =$del_photo->fetchObject();
   
   
   if($del_run && $del_photo ){
    echo ' <script> alert("data deleted turn");  </script> ';
       echo "<head>
      <meta http-equiv='refresh' content='0; URL=all_product.php'>
      </head>";

   }
   else{
    echo ' <script> alert("not data deleted ");  </script> ';
   }
}

?>
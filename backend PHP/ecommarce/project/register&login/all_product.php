<?php

include 'connectdb.php';
$sql = "SELECT p.*, i.id , i.img_position FROM products p JOIN images_produ i ON p.pro_id = i.id    ";
$result = $database->prepare($sql);
$result->execute();
$rows = $result->fetchAll(PDO::FETCH_OBJ);
?>
<!-- 
 
//  if(isset($_GET['delete'])){
//     $delete_id =$_GET['delete'];
//     $delete_product=" DELETE * FROM products WHERE pro_id='?'";
//     $delete_product=$database->prepare($delete_product);
//     $deletes_product=$delete_product->execute($delete_id );
 

// }
  -->

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shopping Cart</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css" />
    <link rel="stylesheet" href="css/style.css" />
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="cssbot/bootstrap.css" />
    
    
    
 </head>
 <body>


 <?php require_once ("hheaders.php"); ?>

 <center>
 <h1 style="color: currentColor;">the all products</h1>
 </center>
 

 <?php
      $counter=0;
 foreach ($rows as $row) :
    
    
    if ($counter % 4 == 0) {
            echo '</div><div class="row">'; // إغلاق الصف الحالي وفتح صف جديد بعد عرض ثلاث صور
        }
        ?>
      <div class="col-md-3 col-sm-6 my-3 my-md-0">
        <form action="all_product.php" method="post">
                    <div class="card shadow">
                        <div>
                            <img src="<?php echo $row->img_position; ?>" alt="<?php echo $row->img_position; ?>" class="img-fluid card-img-top">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo htmlentities($row->pro_name); ?></h5>
                            <p class="card-text">
                                <?php echo htmlentities($row->pro_descr); ?>
                            </p>
                            <h5>
                                <h4><h4>
                                <span class="price">السعر: <?php echo htmlentities($row->pro_price . " " . $row->pro_coin); ?></span>
                            </h5>
   
            
        </form>
                           <div style="display: inline-flex;margin-top: 20px;">
                                    <form action="delete.php?id=<?$row->pro_id ?>"  method="get" enctype="multipart/form-data">
                                            <input type="hidden" name="id" value="<?php echo htmlentities($row->pro_id . " " . $row->id)?>">
                                        <input type="submit" name="delete" class="btn btn-danger" value="Delete" >
                                        </form>
                                

                                    <form action="updatedata.php?id=<?php echo htmlentities($row->pro_id . " " . $row->id)?>"  method="get" enctype="multipart/form-data"   style=" margin-inline-start: 20px;">
                                            <input type="hidden" name="id" value="<?php echo htmlentities($row->pro_id . " " . $row->id)?>">
                                        <input type="submit"   name="update" class="btn btn-danger" value="update"  />
                                        </form>
                            </div>
                        </div>
                    </div>
                    <?php
                    $counter++;
                    ?>
    </div>
    
 
  <?php endforeach; ?>


 

</body>
</html>
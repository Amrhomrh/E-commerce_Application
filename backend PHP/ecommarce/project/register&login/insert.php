


<!DOCTYPE html>
<html lang="ar">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>shop online | اضافة منتج </title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">اضافة صنف للمتجر</h2>
                </div>
                <div class="card-body">
                    <form acttion="insert.php"  method="POST" enctype="multipart/form-data" >
                        <div class="form-row m-b-55">
                            <div class="name">اسم الصنف</div>
                            <div class="value">
                                <div class="row row-space"style="
                                width: 1000px;
                            ">
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            
                                            <input class="input--style-5" type="text" name="name" placeholder="اسم الصنف">
                                            
                                        </div>  
                                    </div>
                             
                                </div>
                            </div>
                        </div>
                 
                        <div class="form-row"style="
                        width: 620px;
                    ">
                     
                            <div class="name">وصف المنتج</div>
                            <div class="value">
                                <div class="input-group">
                                   <textarea name="description" class="input--style-5"   cols="40" rows="5"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">price</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                            
                                            <input class="input--style-5" type="text" name="price" placeholder="السعر">
                                            <input class="input--style-5" type="text" name="discount" placeholder="تخفيض">
                                            
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="name"style="
                                        margin-right: 5px;"></div>
                                    
                                        <div class="value">
                                            <div class="input-group">
                                                <div class="rs-select2 js-select-simple select--no-search">
                                                    <!-- <select name="coin">
                                                        <option disabled="disabled" selected="selected">
                                                            <label type="text" ></label>نوع العملة</option>
                                                        <option value="coin1">ريال يمني</option>
                                                        <option value="coin2">ريال سعودي </option>
                                                        <option value="coin3">دولار</option>
                                                    </select> -->

                                                            <select class="custom-select custom-select-sm" name="catg">
                                                            <option selected>القسم  </option>
                                                            <option value="1">كاميرا</option>
                                                            <option value="2">لابتوب</option>
                                                            <option value="3">جوال  </option>
                                                            </select>
                                                    <div class="select-dropdown"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       

                        <div class="upload-container">
                            <div class="image-preview" onclick="document.getElementById('imageUpload').click()">
                              <span>Click to upload images</span>
                            </div>
                          </div>
                        
                          <input class="form-control d-none" type="file" id="imageUpload" name="image"   accept="image/*" multiple onchange="previewImages(event)">



                        
                        <div style="margin-top: 30px;">
                            <button style=" margin-left: 90px;" class="btn btn--radius-2 btn--red" type="submit" name="send">اضافة منتج</button>
                            <a  style=" margin-left: 90px;" href="page-users.php"  class="btn btn--radius-2 btn--red">عرض المنتجات</a>
                        </div>
                       
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->





<?php
require_once 'connectdb.php';


if(isset($_POST['send'])){
    $NAME =$_POST['name'];
    $DESCR =$_POST['description'];
    $PRICE =$_POST['price'];
    $catg =$_POST['catg'];
    $discount =$_POST['discount'];
    $IMAGE =$_FILES['image'];
    $image_location =$_FILES['image']['tmp_name'];
    $image_name=$_FILES['image']['name'];
    $image_type=$_FILES['image']['type'];
    $image_position="../../uploade".$image_name;

    $insert=$database->prepare("INSERT INTO items(items_name , items_desc , items_image,items_price  ,items_discount,cate_id) VALUES (:name , :description,:image, :price,:discount,:catg) ");
    $insert->bindParam('name',$NAME);
    $insert->bindParam('description',$DESCR);
    $insert->bindParam('price',$PRICE);
    $insert->bindParam('catg',$catg);
    $insert->bindParam('discount',$discount);
    $insert->bindParam('image',$image_name);
    $insert->execute();

//    $coin =$_POST['coin'];
//     $sql_photo=" SELECT count(*) FROM images_produ ";
//     $select_photo=$database->prepare($sql_photo);
//     $select_photo->execute();

   

//     if($select_photo->rowCount()>=0){
//         $imgid=$select_photo->rowCount()+1;



//     }
    
//    $sql_photo="INSERT INTO images_produ( img_name ,img_type ,img_position ) VALUES(:name,:type,:position) ";
//    $insert_photo=$database->prepare($sql_photo);
//    $insert_photo->bindParam(":name",$image_name);
//    $insert_photo->bindParam(":type",$image_type);
//    $insert_photo->bindParam(":position",$image_position);
//    $insert_photo->execute();
//   // move_uploaded_file($image_location,"img/".$image_name);
  
// if(move_uploaded_file($image_location,"img/".$image_name)){
//     echo " <script> alert('تم رفع المنتج بنجاح')  </script>";
//     echo "<head>
//     <meta http-equiv='refresh' content='0; URL=all_product.php'>
//     </head>";
    
// }  
// else{
//     echo " <script> alert('لم يتم رفع المنتج')  </script>";
// }
  
   
   
  
    
   /* if($insert->execute()){

        echo " <script> alert('تم رفع الصورة بنجاح')  </script>";
          }  
          else{
              echo " <script> alert('لم يتم رفع المنتج')  </script>";

    }*/
    
    #$insert->fetch(PDO::FETCH_ASSOC);
    
   #if($insert->rowCount()>1){
  
}

?>
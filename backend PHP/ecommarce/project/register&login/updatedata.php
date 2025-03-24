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
    <title>shop online | تعديل على المنتج </title>

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

<?php   

// if(isset($_POST['update']))
// {
// $id=$_POST['id'];
// $sql = "SELECT p.*, i.id , i.img_position FROM products p JOIN images i ON p.pro_id = i.id WHERE p.pro_id='$id' "  ;
// $result = $database->prepare($sql);
// $result->execute();
// $rows = $result->fetchAll(PDO::FETCH_OBJ);
// }
?>
<?php
include 'connectdb.php';
$id=$_GET['id'];
$sql = "SELECT p.*, i.id , i.img_position FROM products p JOIN images i ON p.pro_id = i.id WHERE p.pro_id='$id' "  ;
$result = $database->prepare($sql);
$result->execute();
$rows = $result->fetchAll(PDO::FETCH_OBJ);

if($result->execute() ){
    foreach($rows as $row){
        ?>
  

     <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title"> تعديل على المنتج </h2>
                 </div>
                 <div class="card-body">
                    
                    <form acttion="updatedata.php"  method="POST" enctype="multipart/form-data" >
                    <input type="hidden" name="id" value="<?php echo htmlentities($row->pro_id . " " . $row->id)   ?>"  />
                        <div class="form-row m-b-55">
                            <div class="name">اسم الصنف</div>
                            <div class="value">
                                <div class="row row-space"style="width: 1000px;">
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            
                                            <input name="Name" class="input--style-5" type="text"  value="<?php echo htmlentities($row->pro_name); ?>" placeholder="اسم الصنف">
                                            
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
                                   <textarea name="description"   class="input--style-5"   cols="40" rows="5"><?php echo htmlentities($row->pro_descr); ?></textarea>
                                </div>
                            </div>
                         </div>
                         <div class="form-row m-b-55">
                            <div class="name">price</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                            
                                                    <input class="input--style-5" type="text" name="price" value="<?php echo htmlentities($row->pro_price); ?>" placeholder="السعر">
                                                    
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

                                                            <select class="custom-select custom-select-sm" name="coin">
                                                            <option selected> <?php echo htmlentities($row->pro_coin); ?>  </option>
                                                            <option value="يمني">ريال يمني </option>
                                                            <option value="سعودي">ريال سعودي </option>
                                                            <option value="دولار">دولار </option>
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
                            <div class="image-preview" onclick="document.getElementById('imageUpload').click()" >

                            <img src="<?php echo $row->img_position; ?>" alt="Image1" >
                             

                            </div>
                            
                          </div>
                         
                          <input class="form-control d-none" type="file" id="imageUpload" name="image"  accept="image/*" multiple onchange="previewImages(event)   ">



                        
                         <div style="margin-top: 30px;">
                            <button style="margin-left: 90px;background: green;" class="btn btn--radius-2 btn--red" type="submit" name="updata">تعديل على منتج</button>
                            <a  style=" margin-left: 90px;" href="all_product.php"  class="btn btn--radius-2 btn--red">عرض المنتجات</a>
                        </div>
                       
                    </form>
                    <?php
    }

}

?>

                        <?php   
                        //include 'connectdb.php';
                        if(isset($_POST['updata'])){
                            $NAME=$_POST['Name'];
                            $DEC=$_POST['description'];
                            $PRIC=$_POST['price'];
                            $COIN=$_POST['coin'];
                            $up="UPDATE products SET pro_name='$NAME', pro_descr='$DEC' ,pro_price='$PRIC' , pro_coin='$coin'  WHERE pro_id='$id'  ";
                            $up=$database->prepare($up);
                            $up->execute();
                            $update=$up->fetchObject();
                            if($up->execute()){
                                echo ' <script> alert("data update turn");  </script> ';
                              echo "<head>
                                <meta http-equiv='refresh' content='0; URL=all_product.php'>
                              </head>";

                            }
                            else{
                                echo ' <script> alert(" not data update turn");  </script> ';
                            }
                        }
                        ?>

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






    

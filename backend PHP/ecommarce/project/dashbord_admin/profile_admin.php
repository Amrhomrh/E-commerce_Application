
<?php

require_once ('C:\xampp\htdocs\project\register&login\connectdb.php');

session_start();

$id=$_SESSION['id'];

$sql="SELECT * FROM users WHERE user_id='$id' ";
$results=$database->prepare($sql);
$results->execute();
$result=$results->fetchObject();




//  echo $allresults ->first_name;
// if($results->rowCount()>0){

  
// }



$sql_photo="SELECT 	img_position,id	 FROM images_users WHERE id='$id'	";
$results_photo=$database->prepare($sql_photo);
$results_photo->execute();
$results_photo=$results_photo->fetchObject();
// if($results_photo->rowCount()>0){

 

// }

?>

<html >
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
    <link href="css/styles.css" rel="stylesheet" />
    
</head>







<body>


<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <!-- <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg> -->
        <span class="fs-4">Simple header</span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-item"><a href="firstPadmin.php" class="nav-link active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
      </ul>
    </header>
  </div>
  

<section class="bg-dark">
  <div class="container py-5">
    <div class="row">
      <div class="col">
        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="#"><?php echo $_SESSION['email'];      ?></a></li>
            <li class="breadcrumb-item"><a href="#"><?php  echo $_SESSION['password'];     ?></a></li>
            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
          </ol>
        </nav>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body  text-center">
          
           <form action="" method="post" enctype="multipart/form-data">

                      <div class="card" style="width: 20rem;">
              <img src="<?php echo ( "../img/" . $results_photo->img_position);  ?>" class="card-img-top " id="previewImage" alt="">
              <div class="card-body">
                <h5 class="card-title"><?php echo htmlentities($result->first_name . " " . $result->last_name )   ?></h5>
                <br>
                <h6 class="text-muted mb-0"  ><?php echo htmlentities($result->email )?></h6>
                <br>
                <h6 class="text-muted mb-0"  ><?php echo htmlentities($result->phone )?></h6>
                <br>
                <input type="file" name="ch_prof"  placeholder="add photo" class="form-control card-img-top mt-3 " style="width: 18rem;" >
                <button type="submit" class="btn btn-outline-primary ms-1 mt-3" name="change">change</button>
                <button type="submit" name="delete" class="btn btn-outline-primary ms-1 mt-3"  >delete</button>
             
                
              
              </div>
            </div>

          
            
            <div class="d-flex justify-content-center mb-3">
            
            
              </form>
              
            </div>
          </div>
        </div>
        <div class="card mb-4 mb-lg-0">
          <div class="card-body p-0">
            <ul class="list-group list-group-flush rounded-3">
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fas fa-globe fa-lg text-warning"></i>
                <p class="mb-0">https://mdbootstrap.com</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                <p class="mb-0">@mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
            </ul>
          </div>
        </div>
      </div>
      
      <div class="col-lg-8">
      <form action="" method="post" enctype="multipart/form-data">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              
              <div class="col-sm-9">
              <input class="text-muted mb-0" name="first_name" value="<?php echo htmlentities($result->first_name  )   ?>"></input>
              <input class="text-muted mb-0" name="last_name" value="<?php echo htmlentities( $result->last_name )   ?>"></input>
              
              
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
              <input class="text-muted mb-0" name="email" value="<?php echo htmlentities($result->email )    ?>"></input>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <input class="text-muted mb-0" name="phone" value="<?php echo htmlentities($result->phone )   ?>"></input>
              </div>
            </div>
            <hr>
           
            <div class="row">
            <button type="submit" name="update" class="btn btn-outline-primary ms-1">update</button>
              <!-- <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div> -->
              <!-- <div class="col-sm-9">
                <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>
              </div> -->
            </div>
          </div>
        </div>
       
        </div>
      </div>
      </form>
    </div>
  </div>
  
</section>
  

 <!-- Jquery JS-->
 <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
</body>

</html>




<?php

if(isset($_POST['update']))
{
  $first_name=$_POST['first_name'];
  $last_name=$_POST['last_name'];
  $email=$_POST['email'];
  $phone=$_POST['phone'];


$sql="UPDATE users set first_name=?, last_name=?, email=?,phone=? WHERE user_id='$id' ";
$update=$database->prepare($sql);
$update->execute([$first_name,$last_name,$email, $phone]);
if($update->rowCount()>0){
//   echo "<head>
//  <meta http-equiv='refresh' content='0; URL=user_profile.php'>
//  </head>";
// $sql_select="SELECT  first_name, last_name, email,phone FROM users WHERE user_id='1' ";
// $select=$database->prepare($sql_select);
// $select->execute();



  echo '<script>alert("update succesfully");</script>';
  header("Refresh: 2;");
  
} else{

  echo '<script>alert("update  --not --succesfully");</script>';

}




}




?>

<?php

  
if(isset($_POST['change'])){

  $IMAGE =$_FILES['ch_prof'];
  $image_location =$_FILES['ch_prof']['tmp_name'];
  $image_name=$_FILES['ch_prof']['name'];
  $image_type=$_FILES['ch_prof']['type'];
  $image_position=$image_name;

  $ch_p=$database->prepare("UPDATE images_users SET img_name=? ,img_position=? ,img_type=? WHERE id='$id' ");
  $ch_p->execute([$image_name, $image_position,$image_type]);

  if(move_uploaded_file($image_location,"img/".$image_name)){
    echo " <script> alert('تم رفع المنتج بنجاح')  </script>";
}  
else{
    echo " <script> alert('لم يتم رفع المنتج')  </script>";
}



}




if(isset($_POST['delete'])){

  $delete_img='default.jpg';
 


  $id=$_POST['delete'];



   $query="UPDATE images_users set img_name='$delete_img',img_position='$delete_img'  ";
  $up_pho=$database->prepare($query);

  $up_pho->execute();
  if($up_pho->execute()){

    echo " <script> alert('jfuck up')  </script>";

   



  }else{

    echo " <script> alert('no fuck up')  </script>";

  }
   
  
 }




  
 
?>
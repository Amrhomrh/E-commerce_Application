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
    <title>Au Register Forms by Colorlib</title>

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
    <link href="css/bootstrap.min.css" rel="stylesheet" media="all">
    <link href="css/bootstrap.css" rel="stylesheet" media="all">
    <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>



        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
   
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                    <div class="card-body">
                                        <form acttion=""  method="POST" enctype="multipart/form-data">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                
                                                        <input type="text" name="firstname" required placeholder="enter your name" class="form-control" maxlength="50">
                                                        <label for="inputFirstName">First name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <!-- <div class="form-floating">
                                                    <input type="text" name="lastname" required placeholder="enter your name" class="form-control" maxlength="50">
                                                        <label for="inputLastName">Last name</label>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                            <input type="email" name="email" required placeholder="enter your email" class="form-control" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
                                                
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            <div class="row mb-3">
                                            <div class="col-md-5">
                                                    <div class="form-floating mb-2 mb-md-3">
                                                    <input type="number" name="phone" required placeholder="enter your number" class="form-control" >
                                                    
                                                        <label for="inputPhoneNumber">PhoneNumber</label>
                                                    </div>
                                                </div>
                                                

                                                
                                                
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    <input type="password" name="password" required placeholder="enter your password" class="form-control" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
                                                       
                                                        <label for="inputPassword">Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        
                                                        <input type="password" name="cpass" required placeholder="confirm your password" class="form-control" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
                                                        <label for="inputPasswordConfirm">Confirm Password</label>
                                                    </div>
                                                </div>

                                                    
                                                    <!-- <div class="card form-floating mt-4 ">
                                                        
                                                        <input type="file" id="previewImage" name="image" required placeholder="add photo" class=" upload-container " style="width: 20rem;" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
                                                        
                                                   
                                                </div> -->
                                                
                                                
<?php

include 'connectdb.php';

if(isset($_POST['submit'])){

$first_name=$_POST['firstname'];
$last_name=$_POST['lastname'];
$phone=$_POST['phone'];
$email=$_POST['email'];
$password=$_POST['password'];
$cpass=$_POST['cpass'];

// $IMAGE =$_FILES['image'];
// $image_location =$_FILES['image']['tmp_name'];
// $image_name=$_FILES['image']['name'];
// $image_type=$_FILES['image']['type'];
// $image_position=$image_name;

// $imgid="";
// $sql_photo=" SELECT * FROM images_users ";
// $select_photo=$database->prepare($sql_photo);
// $select_photo->execute();
// if($select_photo->rowCount()>=0){
//     $imgid=$select_photo->rowCount()+1;



// }

// $sql_photo="INSERT INTO images_users( img_name ,img_position ,img_type ) VALUES(:name,:position ,:type) ";
// $insert_photo=$database->prepare($sql_photo);
// $insert_photo->bindParam(":name",$image_name);
// $insert_photo->bindParam(":position",$image_position);
// $insert_photo->bindParam(":type",$image_type);
// $insert_photo->execute();
// move_uploaded_file($image_location,"img/".$image_name);

$select_user = $database->prepare("SELECT * FROM users WHERE users_email = ? ");
   $select_user->execute([$email]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if ($select_user->rowCount() > 0 ){

    echo '<div class="alert alert-danger mt-3" role="alert">
    email or number already exists!.
</div>';
   
    "<head>
    <meta http-equiv='refresh' content='0; URL=register.php'>
    </head>";
}else{

    if($_POST['password'] != $_POST['cpass']){

        " <script> alert ('confirm password not matched!') </script>
       ";
   
       echo '<div class="alert alert-danger mt-3" role="alert">
       confirm password not matched!.
   </div>';
      
       "<head>
       <meta http-equiv='refresh' content='0; URL=register.php'>
       </head>";
   }else{
       
       
    $sql="INSERT INTO `users` ( `users_name`, `users_password`, `users_email`, `users_phone`) VALUES (:users_name, :users_password,:users_email, :users_phone)";
$register=$database->prepare($sql);
$register->bindParam(":users_name",$_POST['firstname']);
$register->bindParam(":users_password",$password );
$register->bindParam(":users_email",$_POST['email']);
$register->bindParam(":users_phone",$_POST['phone']);


// $register->bindParam(":id",$imgid);
$register->execute();
$register->fetch(PDO::FETCH_ASSOC);
if($register->rowCount()>=0){
    
    
    
    echo '<script>alert("register succesfully");</script>';
  
    echo "<head>
 <meta http-equiv='refresh' content='0; URL=login.php'>
 </head>";
  
}else{

echo 'error';

}
      
   }
    

   
}
   


 





}


?>


                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                    <button class="btn btn-primary btn-block" type="submit" name="submit">Create Account</button></div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <!-- <div class="small"><a href="login.php">Have an account? Go to login</a></div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer >
                    <?php
                    include 'footer.php'
                    
                    ?>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


<!-- end document-->

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Password Reset - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Password Recovery</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted">Enter your email address and we will send you a link to reset your password.</div>
                                        <form role="form" name="chngpwd" method="post" onSubmit="return valid();">
                                                 <div class="form-group">
                                                    <label>Enter Reg Email id</label>
                                                    <input class="form-control" type="email" name="email" required autocomplete="off" />
                                                </div>
                                                    <div class="form-group">
                                                        <label>Enter Reg Mobile No</label>
                                                        <input class="form-control" type="text" name="mobile" required autocomplete="off" />
                                                  </div>
                                                     <div class="form-group">
                                                        <label>Password</label>
                                                        <input class="form-control" type="password" name="newpassword" required autocomplete="off"  />
                                                    </div>

                                                    <div class="form-group">
                                                        <label>ConfirmPassword</label>
                                                        <input class="form-control" type="password" name="confirmpassword" required autocomplete="off"  />
                                                    </div>



                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                               
                                                <button type="submit" name="change" class="btn btn-info">Chnage Password</button> |  <a class="small" href="login.php">Return to login</a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.php">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
           <!-- ========php======== -->
            <?php 
            
            include 'footer.php';
            
            ?>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>

<?php
// session_start();
error_reporting(0);
include 'connectdb.php';
if(isset($_POST['change']))
{
$email=$_POST['email'];
$mobile=$_POST['mobile'];
$newpassword=$_POST['newpassword'];
  $sql ="SELECT users_email FROM users WHERE users_email=:email and users_phone=:mobile";
$query= $database -> prepare($sql);
$query-> bindParam(':email', $email, PDO::PARAM_STR);
$query-> bindParam(':mobile', $mobile, PDO::PARAM_STR);
$query-> execute();
$results = $query -> fetchAll(PDO::FETCH_OBJ);
if($query -> rowCount() > 0)
{
    
$con="UPDATE users set users_password=:newpassword where users_email=:email and users_phone=:mobile";
$chngpwd1 = $database->prepare($con);
$chngpwd1-> bindParam(':email', $email, PDO::PARAM_STR);
$chngpwd1-> bindParam(':mobile', $mobile, PDO::PARAM_STR);
$chngpwd1-> bindParam(':newpassword', $newpassword, PDO::PARAM_STR);
$chngpwd1->execute();
echo  '<script>alert("Your Password succesfully changed");</script>';
echo "<head>
<meta http-equiv='refresh' content='0; URL=login.php'>
</head>";


}
else {
echo "<script>alert('Email id or Mobile no is invalid');</script>"; 
}
}
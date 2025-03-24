

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-danger">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form method="POST">
                                            <div class="form-floating mb-3">
                                                
                                                <input class="form-control" id="inputEmail" name="email" type="email" placeholder="name@example.com" required />
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" name="password" type="password" placeholder="Password"  required/>
                                                <label for="inputPassword">Password</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input"  id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <!-- <a class="small" href="password.php">Forgot Password?</a> -->
                                                <button class="btn btn-dark" type="submit" name="login" id="login" >Login</button>
                                            </div>
                                            
    
                                            



                                            <?php
                                            include 'connectdb.php';
                                          
                                            
                                            session_start();
                                            
                                            if(isset($_POST['login'])){


                                                $_SESSION['email']=$_POST['email'];
                                                $_SESSION['password']=$_POST['password'];
                                                // $_SESSION['id']=$_POST['id'];

                                                
                                            
                                            $log_in=$database->prepare("SELECT * FROM users WHERE users_email=:email AND users_password= :password  ");
                                            $log_in->bindParam("email",$_SESSION['email']);
                                            $log_in->bindParam("password",$_SESSION['password']);
                                            

                                            
                                            #echo $_SESSION['email'] . $_SESSION['password'] ;
                                            $log_in->execute();
                                            $log_in->rowCount();
                                            $row=$log_in->fetch(PDO::FETCH_ASSOC);
                                            if(isset($row['users_id']))
                                            {

                                                $_SESSION['id']=$row['users_id'] ;
                                            echo $_SESSION['id'];


                                            }
                                            
                                            if($log_in->rowCount()>0){

                                                
                                                    if($row['users_approve']=='1')
                                                    {
                                                        if($row['users_approve']=='0'){

                                                            header('location:403.html');
                                                        }else{

                                                            $_SESSION['id'] = $row['users_id'];
                                                    // $temp = $_SESSION['id'] ;
                                                     echo "<script> alert('this user')  </script>";
                                                     header('Location:page-users.php', true);


                                                        }

                                                        



                                                    
                                                    
                                                    }
                                                    else if ($row['users_approve']=='2')
                                                    {  
                                                       $_SESSION['id'] = $row['users_id'];
                                                    //    $temp = $_SESSION['id'] ;
                                                     echo "<script> alert('this admin')  </script>";

                                                     header('Location:../dashbord_admin/firstPadmin.php', true);
                                                    }

                                                    echo '<div class="alert alert-success mt-3" role="alert">
                                                    success !
                                                    
                                                    </div>';



                                                 }else{
                                                    
                                                    echo '<div class="alert alert-danger mt-3" role="alert">
                                                    error ! email or password not correct
                                                    <a class="small" href="forgatpassword.php">Forgot Password?</a>
                                                </div>';
                                                  

                                                    session_destroy();

                                                 }
                                              
                                                
                                            }

                                           

                                            ?>
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
            
        </div>
       

<!-- -------------------- -->



            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
  

        
        <?php
        
        include 'footer.php'
        
        
        ?>


            </body>
</html>
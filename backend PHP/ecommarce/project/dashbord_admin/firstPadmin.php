<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    <nav class="sb-nav-fixed sb-topnav navbar navbar-expand ms-auto navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
</div>



            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <img src="img/default.jpg" class="rounded-circle mb-1" style="width: 40px;"
            alt="Avatar" />
                <li class="nav-item dropdown">
                
                    
                     <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                    <div class="dropdown-item">
           

                 
                    </div>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="profile_admin.php">Settings</a></li> 
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    
       

       


    
        <!-- Navbar-->
        
              <!-- <div class="me-4">
            <img src="" class="rounded-circle mb-3" style="width: 50px;"
            alt="Avatar" />

                 
                    </div>
        <div class="text-end">
          
          <a href="profile_users.php" class="btn btn-outline-light me-4">edit </a>
          <a href="" class="btn btn-danger">Logout  </a>
        </div> -->
      
  <!-- </header> -->

           
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <form action="" method="post">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                         <div class="row">
                            
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable USERS
                            </div>
                            <a href="register-admin.php" type="submit" name="add" class="btn btn-primary btn-lg md-3 mt-3">Add admin</a>

                            <div class="card-body">
                            
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                        <th>Name</th>
                                            <th>email</th>
                                            <th>phone</th>
                                            <th>create account</th>
                                            <th>type</th>
                                            <th>activity</th>
                                            <th>controle</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>email</th>
                                            <th>phone</th>
                                            <th>create account</th>
                                            <th>type</th>
                                            <th>activity </th>
                                            <th>controle</th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                        <?php
                                       
                                       include('C:\xampp\htdocs\project\register&login\connectdb.php');

                                      

                                     $sql="SELECT * FROM users s,userrole r WHERE s.Id_role=r.id  ORDER BY user_id DESC";
                                   
                                    $views=$database->prepare($sql);
                                    $views->execute();
                                    foreach($views as $show):

                                       
                                       
                                       ?>
                                            <td><?php echo htmlentities($show ['first_name'] . " " . $show['last_name'])?></td>
                                            <td><?php echo htmlentities($show ['email'] )?></td>
                                            <td><?php echo htmlentities($show ['phone'] )?></td>
                                            <td><?php echo htmlentities($show ['date_create'] )?></td>
                                            <td><?php echo htmlentities($show ['Role'] )?></td>
                                            <td><?php echo htmlentities($show ['active'])?></td>
                                            <td><div class="btn-group" role="group" aria-label="Button group with nested dropdown">
 
                                                
                                            <button type="submit" name="delete" value="<?php echo htmlentities($show ['user_id'])?>"   class="btn  btn-danger"  >delete </button>
                                            <button type="submit" name="active" value="<?php echo htmlentities($show ['user_id'])?>" class="btn btn-success" name="change">active</button>
                                            <button type="submit" name="deactive" value="<?php echo htmlentities($show ['user_id'])?>" class="btn btn-warning" name="change">deactive</button></td>
                                            <!-- <td> -->
                                            <!--  -->
                                            
    </div>
                                        </tr>

                                        </form>
                                        <?php endforeach; 

                                        if(isset($_POST['delete'])){
                                            $userD=$_POST['delete'];
    
                                            
                                            $qdel="  DELETE t1,t2
                                                    FROM users t1
                                                    JOIN images_users t2 ON t1.user_id = t2.id
                                                    WHERE user_id=' $userD' ";
                                            $del=$database->prepare($qdel);
                                            $del->execute();
                                            $delete=$del->fetchObject();

                                            if($del)
                                            {

                                                echo " <script> alert('jfuck up')  </script>";
                                                

   



                                                        }else{

                                                            echo " <script> alert('no fuck up')  </script>";

                                                        }
                                                                                                    }


                                                                                                    if(isset($_POST['active'])){
                                                                                                        $userA=$_POST['active'];
                                                                
                                                                                                        $qAct="UPDATE users set active='1' WHERE user_id=' $userA' ";
                                                                                                        $Act=$database->prepare($qAct);
                                                                                                        $Act->execute();
                                                                                                        $Active=$Act->fetchObject();
                                                            
                                                                                                        if($Act)
                                                                                                        {
                                                            
                                                                                                            echo " <script> alert('jfuck up')  </script>";
                                                            
                                                               
                                                            
                                                            
                                                            
                                                                                                                    }else{
                                                            
                                                                                                                        echo " <script> alert('no fuck up')  </script>";
                                                            
                                                                                                                    }
                                                                                                                                                                }

                                                                                                                                                                if(isset($_POST['deactive'])){
                                                                                                                                                                    $userA=$_POST['deactive'];
                                                                                                                            
                                                                                                                                                                    $qAct="UPDATE users set active='0' WHERE user_id=' $userA' ";
                                                                                                                                                                    $Act=$database->prepare($qAct);
                                                                                                                                                                    $Act->execute();
                                                                                                                                                                    $Active=$Act->fetchObject();
                                                                                                                        
                                                                                                                                                                    if($Act)
                                                                                                                                                                    {
                                                                                                                        
                                                                                                                                                                        echo " <script> alert('jfuck up')  </script>";
                                                                                                                        
                                                                                                                           
                                                                                                                        
                                                                                                                        
                                                                                                                        
                                                                                                                                                                                }else{
                                                                                                                        
                                                                                                                                                                                    echo " <script> alert('no fuck up')  </script>";
                                                                                                                        
                                                                                                                                                                                }
                                                                                                                                                                                                                            }
    
    
                                           
                                           ?>
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                    </div>
                    </form>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>

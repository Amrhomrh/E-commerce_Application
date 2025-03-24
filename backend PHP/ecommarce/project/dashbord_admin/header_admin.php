
<?php 

include 'register&login\connectdb.php';

session_start();

$id=$_SESSION['id'];


$sql_photo="SELECT 	img_position,id	 FROM images_users WHERE id='$id'	";
$results_photo=$database->prepare($sql_photo);
$results_photo->execute();
$results_photo=$results_photo->fetchObject();


$sql="SELECT * FROM users WHERE user_id='$id' ";
$results=$database->prepare($sql);
$results->execute();
$result=$results->fetchObject();




?>




<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Headers · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/headers/">

    

    <!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet" />

    <!-- <style>
      .bd-placeholder-img {
        font-size: 2.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 7rem;
        }
      }
    </style> -->

    
    <!-- Custom styles for this template -->
    <link href="assets/css/headers.css" rel="stylesheet">
  </head>
  <body>

<main>
  
  

  <div class="b-example-divider"></div>

  <header class="p-3 bg-dark text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="img/default.jpg" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
         
        </a>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>


    
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
          
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
              <div class="me-4">
            <img src="" class="rounded-circle mb-3" style="width: 50px;"
            alt="Avatar" />

                  <h5 class="mb-2"><strong></strong></h5> <br>

</div>
        <div class="text-end">
          
          <a href="profile_users.php" class="btn btn-outline-light me-4">edit </a>
          <a href="logout.php" class="btn btn-danger">Logout  </a>
        </div>
      </div>
    </div>
  </header>

</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
  


    <script src="assets/js/bootstrap.bundle.min.js"></script>

      
  </body>
</html>

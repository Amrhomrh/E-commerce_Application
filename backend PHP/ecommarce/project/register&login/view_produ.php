<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Album example · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">

    

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet" />

<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">




    
  </head>
  <body>
    
<?php

include 'hheaders.php';
?>

<main>

<main>
<div id="carouselExampleCaptions" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/photo-1610792516307-ea5acd9c3b00.jpeg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/RE54Lzd.jpeg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/The-Best-Phones-to-buy-in-2023---our-top-10-list.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


  <!-- <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Album example</h1>
        <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
        <p>
          <a href="#" class="btn btn-primary my-2">Main call to action</a>
          <a href="#" class="btn btn-secondary my-2">Secondary action</a>
        </p>
      </div>
    </div>
  </section> -->

 
<!-- ==================================================================================================== -->
  
<?php

include 'connectdb.php';


$sql="SELECT * FROM items  ORDER BY items_id DESC ";
$views=$database->prepare($sql);
$views->execute();

      $counter=0;
      foreach($views as $show):
    
    
    if ($counter % 4 == 0) {
            echo '</div><div class="row">'; // إغلاق الصف الحالي وفتح صف جديد بعد عرض ثلاث صور
        }
        ?>
      <div class="col-md-3 col-sm-6 my-3 my-md-0">
        <form action="all_product.php" method="post">
                    <div class="card shadow">
                        <div>
                            <img src="<?php echo ( "../../uploade" . $show['items_image']) ?>" alt="<?php echo  $show['items_image']; ?>" class="img-fluid card-img-top">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo htmlentities($show['items_name']); ?></h5>
                            <p class="card-text">
                                <?php echo htmlentities($show['items_desc']); ?>
                                
                            </p>
                            <h5>
                                <h4><h4>
                                <span class="card-text text-success">السعر: <?php echo htmlentities($show['items_price'] ); ?></span>
                            </h5>
                            <p class="card-text text-danger"> تاريخ النشر
                            <?php echo   $show['items_date']?>
                            </p>
   
            
        </form>
                           <div style="display: inline-flex;margin-top: 20px;">
                                   
                                    <form action="add_cart.php"  method="get" enctype="multipart/form-data">
                                            <input type="hidden" name="id" value="<?php echo htmlentities($show['items_id'] )?>">
                                        <input type="submit" name="add" class="btn btn-danger" value="add cart" >
                                        </form>
                                

                                   
                            </div>
                        </div>
                    </div>
                    <?php
                    $counter++;
                    ?>
    </div>
    
 
  <?php endforeach; ?>

</main>

<footer class="text-muted py-5">

</footer>
<?php
  
  include_once 'footer.php';
  
  ?>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

   
  </body>
</html>


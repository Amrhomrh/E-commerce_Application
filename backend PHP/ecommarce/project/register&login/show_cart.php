<?php
include 'connectdb.php';
$sel_cart="SELECT * FROM addcart";
$sql_cart=$database->prepare($sel_cart);
$sql_cart->execute();
// $CartCount = $sql_cart->rowCount();
$carts=$sql_cart->fetchAll(PDO::FETCH_OBJ);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css2/style.css" rel="stylesheet">

</head>
<body>
 
    <header class="site-header sticky-top py-1" style="background-color: black;">
                <nav class="container d-flex flex-column flex-md-row justify-content-between">
                    <a class="py-2" href="#" aria-label="Product">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mx-auto" role="img" viewBox="0 0 24 24"><title>Product</title><circle cx="12" cy="12" r="10"></circle><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"></path></svg>
                    </a>
                    <a class="py-2 d-none d-md-inline-block" href="../../../project/register&login/indexx.php">home</a>
                    <a class="py-2 d-none d-md-inline-block" href="#">Product</a>
                    <a class="py-2 d-none d-md-inline-block" href="#">Features</a>
                    <a class="py-2 d-none d-md-inline-block" href="#">Enterprise</a>
                    <a class="py-2 d-none d-md-inline-block" href="#">Support</a>
                    <a class="py-2 d-none d-md-inline-block" href="../../../project/register&login/login.php">LOGIN</a>
                    
                <a href="show_cart.php" class="nav-item nav-link active">
                                    <h5 class="px-5 cart">
                                        <i class="fas fa-shopping-cart"></i> Cart
                </a>
               </nav>                         
</header>


<!-- <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                   </table>  -->
                   

<?php
    $quantities = array();
    
    // Initialize quantities with previous values
    foreach ($carts as $cart) {
        
        $quantities[$cart->id] = $cart->quantity;
    }
    
    if (isset($_POST['update'])) {
        
        $cartId = $_POST['cart_id'];
        $quantity = $_POST['quantity'];

        $upcart="UPDATE addcart SET quantity='$quantity' WHERE id=$cartId";
        $upcart=$database->prepare($upcart);
        $upcart->execute();

        
    
        // Update the quantity for the specific product
        $quantities[$cartId] = $quantity;
    }
      foreach($carts as $cart) :
        
        $cartId = $cart->id;

   
          ?>

    <center>
         <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                            
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle"><img src="<?php echo htmlentities($cart->cart_img) ?>" alt="" style="width: 50px;"  > <?php echo htmlentities($cart->cart_name) ?></td>
                          
                            <td class="align-middle"><?php echo htmlentities($cart->cart_price . $cart->cart_coin) ?></td>
                            
                            <td class="align-middle">
                          
                           
                                      
                            
                                     
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                    
                                  <form method="POST" action="">
                                    <div class="form-group">
                                        <input type="hidden" name="cart_id" value="<?php echo htmlentities($cart->id) ?>" >
                                        <input type="number" class="form-control" name="quantity" id="quantity" value="<?php echo htmlentities($quantities[$cartId]) ?>">
                                    </div>
                                    <input type="submit" class="btn btn-primary" name="update" value=" Update"></button>
                                </form>
                                        
                                </div>
                                


                            </td>
                            <td class="align-middle"> <?php
                                            echo htmlentities($cart->cart_price * $quantities[$cartId]);
                                            ?>
        </td>
                           
                            <form action="delcart.php" method="post">
                                <input type="hidden" name="id" value="<?php echo htmlentities($cart->id)?>">
                               <td class="align-middle"><button type="submit" name="del" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></td>
                           
                            </form>
                        </tr>

                 </tbody>
              </table>
         </div>
         <?php
        //  $quantity=$quantity+1;
            
        endforeach;?>
         </center>
           <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/easing/easing.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

   
</body>
</html>

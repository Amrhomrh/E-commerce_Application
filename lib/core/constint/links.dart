class AppLinks{
  // static String LinkServer = "http://192.168.43.177/ecommarce/";


    static String LinkServer = "http://192.168.0.167/ecommarce/";
  static String LinkImage  = "http://192.168.0.167/ecommarce/uploade";

//Auth
  static String linkSignup="$LinkServer/auth/signup.php";
  static String linkVerifySignup="$LinkServer/auth/verifycode.php";
  static String linkLogin="$LinkServer/auth/login.php";
  static String linkforgetpassword="$LinkServer/auth/forgetpassword/forgetpassword.php";
  static String linkVerifyCodeforgetpassword="$LinkServer/auth/forgetpassword/verfycodeforgetpassword.php";
  static String linkResetgetpassword="$LinkServer/auth/forgetpassword/resetpassword.php";


  static String linkHomePage="$LinkServer/homepage.php";
  static String linkCateogryView="$LinkServer/cateogry/view.php";

  //Items
  static String linkItemsCateogryView="$LinkServer/items/items_cateogry.php";
  //Search Items
  static String linkSearchItems="$LinkServer/items/searchitems.php";


  //Favorite
  static String linkDeleteFavorite="$LinkServer/favorite/deletefavorite.php";
  static String linkAddFavorite="$LinkServer/favorite/addfavorite.php";
  static String linkViewFavorite="$LinkServer/favorite/viewfavorite.php";

  //Cart
  static String linkAddCart="$LinkServer/cart/addcart.php";
  static String linkDeleteCart="$LinkServer/cart/deletcart.php";
  static String linkViewCart="$LinkServer/cart/viewcart.php";
  static String linkGetCountItems="$LinkServer/cart/getcountitems.php";

  // Address

  static String linkViewAddress="$LinkServer/address/view.php";
  static String linkAddAddress="$LinkServer/address/add.php";
  static String linkDeleteAddress="$LinkServer/address/delete.php";
  static String linkUpdateAddress="$LinkServer/address/update.php";

  // user

  static String linkViewUser="$LinkServer/users/view.php";
  static String linkUpdateUser="$LinkServer/users/update.php";

  // CheckOutOrders
  static String linkCheckoutOrders="$LinkServer/orders/checkout.php";
  static String linkViewOrders="$LinkServer/orders/orders.php";
  static String linkArchiveOrders="$LinkServer/orders/archive.php";
  static String linkDetailsOrders="$LinkServer/orders/details.php";

  // Notification
  static String linkViewNotification="$LinkServer/notifi/getnotification.php";








}
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shoping/view/screen/address/add.dart';
import 'package:shoping/view/screen/address/add_detailse.dart';
import 'package:shoping/view/screen/address/update.dart';
import 'package:shoping/view/screen/address/view.dart';
import 'package:shoping/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:shoping/view/screen/auth/login.dart';
import 'package:shoping/view/screen/auth/forgetpassword/reseypassword.dart';
import 'package:shoping/view/screen/auth/singup.dart';
import 'package:shoping/view/screen/auth/forgetpassword/verfiyCode.dart';
import 'package:shoping/view/screen/auth/success_sinup.dart';
import 'package:shoping/view/screen/checkout.dart';
import 'package:shoping/view/screen/notification.dart';
import 'package:shoping/view/screen/orders/detailsorders.dart';
import 'package:shoping/view/screen/orders/ordersPending.dart';
import 'package:shoping/view/screen/orders/ordersArchive.dart';
import 'package:shoping/view/screen/product_detailes.dart';
import 'package:shoping/view/screen/profile/updateProfile.dart';
import 'package:shoping/view/screen/users/items.dart';
import 'package:shoping/view/screen/profile/profile.dart';
import 'package:shoping/view/screen/users/cart.dart';
import 'package:shoping/view/screen/index.dart';
import 'package:shoping/view/screen/onboarding.dart';
import 'package:shoping/view/screen/users/favorites.dart';
import 'package:shoping/view/screen/users/home.dart';
import 'package:shoping/view/screen/users/setings.dart';

import 'core/middleware/mymiddleware.dart';
import 'view/screen/auth/verfiyemail.dart';
List<GetPage<dynamic>>?routes=[
  GetPage(name: "/", page: ()=>onboarding(),middlewares: [
    MyMiddleWare()
  ]),
  ///Auth
  GetPage(name: "/login", page: ()=>Login()),
  GetPage(name: "/singup", page: ()=>Singup()),
  GetPage(name: "/forgetpassword", page: ()=>forgetpassword()),
  GetPage(name: "/verfiycode", page: ()=>verfiyCode()),
  GetPage(name: "/resetpassword", page: ()=>resetpassword()),
  GetPage(name: "/success_singup", page: ()=>SuccessSinup()),
  GetPage(name: "/verfiyEmail", page: ()=>verfiyEmail()),
  /// pages
  GetPage(name: "/index", page: ()=>Index()),
  GetPage(name: "/homeuser", page: ()=>Home()),


  GetPage(name: "/cart", page: ()=>Cart()),
  GetPage(name: "/favorites", page: ()=>Favorites()),
  GetPage(name: "/notification", page: ()=>ViewNotification()),

  GetPage(name: "/ptofile", page: ()=>Profile()),
  GetPage(name: "/setings", page: ()=>Setings()),
  GetPage(name: "/items", page: ()=>Items()),
  GetPage(name: "/productDetails", page: ()=>ProductDetails()),
  GetPage(name: "/viewAddress", page: ()=> ViewAddress()),
  GetPage(name: "/addAddress", page: ()=> AddAddress()),
  GetPage(name: "/checkout", page: ()=> CheckOut()),
  GetPage(name: "/addDetailsAddress", page: ()=> AddDetailsAddress()),
  GetPage(name: "/updateAddress", page: ()=> UpdateAddress()),

  GetPage(name: "/updateProfile", page: ()=> UpDateProfile()),
  GetPage(name: "/orders", page: ()=> OrdersPending()),
  GetPage(name: "/archive", page: ()=> OrderArchive()),
  GetPage(name: "/detailsOrders", page: ()=> DetailsOrders()),


];

// Map<String, Widget Function(BuildContext)> routes={
//   "language":(context)=>laungueg(),
//   "login":(context)=>Login(),
//   "singup":(context)=>Singup(),
//   "forgetpassword":(context)=>forgetpassword(),
//   "verfiycode":(context)=>verfiyCode(),
//   "resetpassword":(context)=>resetpassword(),
//   "success_singup":(context)=>SuccessSinup(),
//   "successResetpassword":(context)=>SuccessResetpassword(),
//   "verfiyEmail":(context)=>verfiyEmail()
// };
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/favoritePage_controller.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/constint/images.dart';
import 'package:shoping/core/constint/links.dart';
import 'package:shoping/view/screen/users/home.dart';
class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritePageController());
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.teal[600],
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for products...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),

              IconButton(
                  onPressed: () {
                    Get.offNamed("/index");
                  },
                  icon: (Icon(Icons.home_outlined,
                      color: Colors.white, size: 28))),


              Stack(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: (Icon(Icons.notifications_none_outlined,
                          color: Colors.white, size: 28))),
                  Positioned(
                    right: 4,
                    top: 2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<FavoritePageController>(
            init:FavoritePageController() ,
            builder:  (controller) => ListView(
            children: [
              HandlingDataView(
                  stutesRequest:controller.stutesRequest ,
                  widget: ListView.builder(
                    scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.myFavorite.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppColor.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage("${AppLinks.LinkImage}/${controller.myFavorite[index].itemsImage}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),

                              // Product Details Column
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product Name
                                    Text(
                                      "${controller.myFavorite[index].itemsName}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.texthead,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),

                                    // Product Details
                                    Text(
                                      "${controller.myFavorite[index].itemsDesc}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: AppColor.textscand,
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    // Product Price
                                    Text(
                                      "\$${controller.myFavorite[index].itemsPrice}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.button2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 30,),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: IconButton(
                                    onPressed: (){
                                      controller.deleteFavorite(controller.myFavorite[index].itemsId!);
                                    },
                                    icon: Icon(Icons.delete),
                                  iconSize: 30,
                                  color: Colors.grey,

                                ) ,
                              )
                            ],
                          ),
                        ),
                      );
                    },))
            ],

        )),
      )

    );
  }
}
// import 'package:flutter/material.dart';
//
// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Favorites"),
//         backgroundColor: Colors.teal[600],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             buildProductCard(
//               productImage: 'https://via.placeholder.com/150',
//               productName: 'Product 1',
//               productDetails: 'Some details about Product 1.',
//               productPrice: '\$49.99',
//             ),
//             buildProductCard(
//               productImage: 'https://via.placeholder.com/150',
//               productName: 'Product 2',
//               productDetails: 'Some details about Product 2.',
//               productPrice: '\$99.99',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildProductCard({
//     required String productImage,
//     required String productName,
//     required String productDetails,
//     required String productPrice,
//   }) {
//     return Card(
//       color: Colors.grey[850],
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: NetworkImage(productImage),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(width: 16),
//
//             // Product Details Column
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Product Name
//                   Text(
//                     productName,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.amber[600],
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//
//                   // Product Details
//                   Text(
//                     productDetails,
//                     style: TextStyle(
//                       color: Colors.white70,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//
//                   // Product Price
//                   Text(
//                     productPrice,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.teal[600],
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
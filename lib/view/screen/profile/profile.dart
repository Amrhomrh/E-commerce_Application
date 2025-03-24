import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/controller/users/profile_controller.dart';
import 'package:shoping/core/class/handlingDataveiw.dart';
import 'package:shoping/core/constint/color.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override

  Widget build(BuildContext context) {
    Get.put(ProFileController());
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('My Profile', style: TextStyle(color: AppColor.textscand)),
        centerTitle: true,
      ),
      backgroundColor: AppColor.background,
      body: GetBuilder<ProFileController>(
          builder: (controller) => HandlingDataView(stutesRequest: controller.stutesRequest,
              widget:
              controller.data.isEmpty?
                  Text("IS EMPTY"):
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    // Profile Image
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/camera1.jpeg"),
                    ),
                    SizedBox(height: 20),
                    // Userpasswordname
                    Text(
                      '${controller.data[0]["users_name"]}',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textscand,
                      ),
                    ),
                    SizedBox(height: 10),
                    // User Role
                    Text(
                      'E-Shop Customer',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.texthead,
                      ),
                    ),
                    SizedBox(height: 30),
                    // Contact Information
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.gree1,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Email
                          Row(
                            children: [
                              Icon(Icons.email, color: AppColor.Icons1),
                              SizedBox(width: 10),
                              Text(
                                '${controller.data[0]["users_email"]}',
                                style: TextStyle(fontSize: 16, color: AppColor.textscand),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          // Phone
                          Row(
                            children: [
                              Icon(Icons.phone, color: AppColor.primaryColor),
                              SizedBox(width: 10),
                              Text(
                                '${controller.data[0]["users_phone"]}',
                                style: TextStyle(fontSize: 16, color: AppColor.textscand),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          // Address
                          Row(
                            children: [
                              Icon(Icons.location_on, color: AppColor.primaryColor),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  '123 E-Shop St, City, Country',
                                  style: TextStyle(fontSize: 16, color: AppColor.textscand),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    // Order History Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Action for viewing order history
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        icon: Icon(Icons.shopping_bag, color: AppColor.textscand),
                        label: Text('View Order History', style: TextStyle(fontSize: 18, color: AppColor.textscand)),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Edit Profile Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton.icon(
                        onPressed: () async{
                          await controller.gotoUpdate(controller.data[0]["users_name"], controller.data[0]["users_email"], controller.data[0]["users_phone"]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.Icons1,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        icon: Icon(Icons.edit, color: AppColor.textscand),
                        label: Text('Edit Profile', style: TextStyle(fontSize: 18, color: AppColor.textscand)),
                      ),
                    ),
                  ],
                ),
              ),

          )),
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// void main() => runApp(ProfileApp());
//
// class ProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfileScreen(),
//     );
//   }
// }
//
// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       body: Stack(
//         children: [
//           // Background Gradient
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.purple, Colors.blue],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           // Profile Card
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               width: 350,
//               height: 550,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.85),
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 15,
//                     spreadRadius: 5,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Profile Image
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage('assets/profile.jpg'),
//                   ),
//                   SizedBox(height: 20),
//                   // Name
//                   Text(
//                     'John Doe',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   // Username
//                   Text(
//                     '@johndoe123',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Phone number
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.phone, color: Colors.green),
//                       SizedBox(width: 10),
//                       Text(
//                         '+123 456 7890',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // Email
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.email, color: Colors.red),
//                       SizedBox(width: 10),
//                       Text(
//                         'johndoe@email.com',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 30),
//                   // Bio
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       'I am a passionate mobile developer with experience in Flutter and other cross-platform tools.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Floating Action Button
//           Positioned(
//             bottom: 30,
//             right: 30,
//             child: FloatingActionButton(
//               onPressed: () {},
//               backgroundColor: Colors.purpleAccent,
//               child: Icon(Icons.edit, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

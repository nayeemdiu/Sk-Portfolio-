// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:skportfolio/screen/resume_screen.dart';
//
// class MenuScreen extends StatelessWidget {
//    MenuScreen({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//
//     return Padding(
//       padding: const EdgeInsets.only(top: 40.0,left: 5,right: 5),
//       child: Column(
//         children: [
//
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               height: height* 0.20,
//               width: width*0.8,
//               child: Column(
//                 children: [
//                   IconButton(onPressed: (){}, icon: Icon(Icons.menu,size: 22,),color: Colors.white,),
//                   SizedBox(height: 7,),
//                   IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,size: 22,),color: Colors.white,),
//                 ],
//               ),
//             ),
//             SizedBox(height: 3,),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               height: height* 0.65,
//               width: width*0.8,
//
//               child: Column(
//                 children: [
//
//                   InkWell(
//                     onTap: (){
//
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 12.0,),
//                       child: Icon(Icons.account_balance_outlined,size: 22,color: Colors.white,),
//                     ),
//                   ),
//                   Text("About",style: TextStyle(fontSize: 15,color: Colors.white,),),
//                   SizedBox(height: 8,),
//
//                   InkWell(
//                     onTap: (){
//                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResumeScreen(),));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(Icons.portrait,size: 22,color: Colors.white,),
//                     ),
//                   ),
//                   Text("Resume",style: TextStyle(fontSize: 15,color: Colors.white,),),
//                   SizedBox(height:8,),
//
//                   InkWell(
//                     onTap: (){
//
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(Icons.work,size: 22,color: Colors.white,),
//                     ),
//                   ),
//                   Text("Project",style: TextStyle(fontSize: 15,color: Colors.white,),),
//                   SizedBox(height: 8,),
//
//
//                   InkWell(
//                     onTap: (){
//
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(Icons.medical_services_outlined,size: 22,color: Colors.white,),
//                     ),
//                   ),
//                   Text("Services",style: TextStyle(fontSize: 15,color: Colors.white,),),
//                   SizedBox(height: 8,),
//
//
//
//                   InkWell(
//                     onTap: (){
//
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(Icons.contact_emergency,size: 22,color: Colors.white,),
//                     ),
//                   ),
//                   Text("Contact",style: TextStyle(fontSize: 15,color: Colors.white,),),
//
//                 ],
//               ),
//
//             ),
//         ],
//       )
//     );
//   }
// }

import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final Function(int) onItemSelected;

  MenuScreen({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 5, right: 5),
      child: Column(
        children: [
          // Header Menu Container
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            height: height * 0.20,
            width: width * 0.8,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu, size: 22),
                  color: Colors.white,
                ),
                SizedBox(height: 7),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, size: 22),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 3),
          // Main Menu Container
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            height: height * 0.65,
            width: width * 0.8,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onItemSelected(0); // About Me
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Icon(
                      Icons.account_balance_outlined,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text("About", style: TextStyle(fontSize: 15, color: Colors.white)),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    onItemSelected(1); // Services
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.medical_services_outlined,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text("Services", style: TextStyle(fontSize: 15, color: Colors.white)),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    onItemSelected(2); // Resume
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.portrait,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text("Resume", style: TextStyle(fontSize: 15, color: Colors.white)),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    onItemSelected(3); // Projects
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.work,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text("Projects", style: TextStyle(fontSize: 15, color: Colors.white)),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    onItemSelected(4); // Contact
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.contact_emergency,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text("Contact", style: TextStyle(fontSize: 15, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

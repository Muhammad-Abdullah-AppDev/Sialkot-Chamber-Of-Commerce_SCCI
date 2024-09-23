// import 'package:flutter/material.dart';
// import 'package:scci_app/constants/appColors.dart';
// import 'package:scci_app/pages/home_screen.dart';
//
// class LoginScreen2 extends StatefulWidget {
//   const LoginScreen2({super.key});
//
//   @override
//   State<LoginScreen2> createState() => _LoginScreenState2();
// }
//
// class _LoginScreenState2 extends State<LoginScreen2>
//     with SingleTickerProviderStateMixin {
//
//   late AnimationController _animationController;
//   late Animation<Offset> _text1Animation;
//   late Animation<Offset> _text2Animation;
//
//   bool isPassVisible = false;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 1));
//
//     _text1Animation = Tween<Offset>(
//       begin: Offset(1, 0), // Start from the right
//       end: Offset.zero, // Slide to the left
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Interval(0.0, 0.5), // You can adjust the start and end times
//       ),
//     );
//
//     _text2Animation = Tween<Offset>(
//       begin: Offset(1, 0), // Start from the right
//       end: Offset.zero, // Slide to the left
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Interval(0.5, 1.0), // You can adjust the start and end times
//       ),
//     );
//
//     _animationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.20,
//                 width: MediaQuery.of(context).size.width * 1,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.asset(
//                       'assets/images/scci_logo2.png',
//                       height: 130,
//                       width: 130,
//                     ),
//                     SizedBox(width: 10,),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SlideTransition(
//                           position: _text1Animation,
//                           child: Text(
//                             'The Sialkot Chamber',
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: AppColors.primaryColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         SlideTransition(
//                           position: _text2Animation,
//                           child: Text(
//                             'Of Commerce & Industry',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: AppColors.golden,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.8,
//                 decoration: BoxDecoration(
//                     color: Color(0xFF19215e).withOpacity(0.4),
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(80),
//                       topLeft: Radius.circular(80),)
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.75,
//                       width: MediaQuery.of(context).size.width * 1,
//                       decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [
//                               AppColors.appColor,
//                               AppColors.primaryColor,
//                               AppColors.appColor,
//                               AppColors.secondaryColor,
//                             ],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomCenter,
//                           ),
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(100),
//                               topLeft: Radius.circular(100),)
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 10, left: 10),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Form(
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                                   child: Column(
//                                     children: [
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                           child: Text('  Email : ',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.white
//                                             ),)),
//                                       TextFormField(
//                                         keyboardType: TextInputType.emailAddress,
//                                         controller: emailController,
//                                         decoration: InputDecoration(
//                                           fillColor: Colors.white70,
//                                             filled: true,
//                                             hintText: 'Enter Email',
//                                             hintStyle: TextStyle(color: AppColors.black,
//                                                 fontSize: 18),
//                                           border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(22.0),),
//                                             contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 15)
//                                         ),
//                                         style: TextStyle(color: AppColors.black),
//                                       ),
//                                       SizedBox(height: 25,),
//                                       Align(
//                                           alignment: Alignment.topLeft,
//                                           child: Text('  Password : ',
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 color: Colors.white
//                                             ),)),
//                                       TextFormField(
//                                         keyboardType: TextInputType.visiblePassword,
//                                         controller: passController,
//                                         obscureText: !isPassVisible,
//                                         decoration: InputDecoration(
//                                             suffixIcon: IconButton(onPressed: (){
//                                               setState(() {
//                                                 isPassVisible = !isPassVisible;
//                                               });
//                                             },
//                                                 icon: Icon(isPassVisible ?
//                                                 Icons.remove_red_eye_outlined :
//                                                 Icons.visibility_off,
//                                                   //color: Colors.blue,
//                                                 ), color: AppColors.black,),
//                                             fillColor: Colors.white70,
//                                             filled: true,
//                                             hintText: 'Enter Password',
//                                             hintStyle: TextStyle(color: AppColors.black,
//                                                 fontSize: 18),
//                                             border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(22.0),),
//                                             contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 15)
//                                         ),
//                                         style: TextStyle(color: AppColors.black),
//                                       ),
//                                       SizedBox(height: 40,),
//                                       InkWell(
//                                         onTap: (){
//                                           Navigator.push(context,
//                                               MaterialPageRoute(builder: (context) => HomeScreen()));
//                                         },
//                                         child: Container(
//                                           height: 48,
//                                           width: MediaQuery.of(context).size.width * 0.8,
//                                           decoration: BoxDecoration(
//                                             color: AppColors.white,
//                                             borderRadius: BorderRadius.circular(20)
//                                           ),
//                                           child: Center(child: Text('Login',
//                                           style: TextStyle(fontSize: 22,
//                                           fontWeight: FontWeight.bold,
//                                           color: AppColors.primaryColor),)),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ))
//                           ],),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//
//           ]
//       ),
//         ),
//       )
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }

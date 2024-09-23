import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scci_app/components/my_text_field.dart';
import 'package:scci_app/constants/appColors.dart';
import 'package:scci_app/pages/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _text1Animation;
  late Animation<Offset> _text2Animation;

  bool isPassVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final List<String> imagePaths = [
    'assets/images/scci1.png',
    'assets/images/murray_clg.png',
    'assets/images/sialkot_clock.png',
    'assets/images/sialkot_clock2.png',
  ];

  int currentIndex = 0;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % imagePaths.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _text1Animation = Tween<Offset>(
      begin: Offset(1, 0), // Start from the right
      end: Offset.zero, // Slide to the left
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5), // You can adjust the start and end times
      ),
    );

    _text2Animation = Tween<Offset>(
      begin: Offset(1, 0), // Start from the right
      end: Offset.zero, // Slide to the left
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0), // You can adjust the start and end times
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          AnimatedSwitcher(
            duration: Duration(seconds: 3),
            child: Image.asset(
              imagePaths[currentIndex],
              key: Key(imagePaths[currentIndex]),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-0.1, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.21,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Image.asset('assets/images/scci_logo.png', height: 110, width: 110,),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideTransition(position: _text1Animation,
                      child: Text('The Sialkot Chamber',
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold
                        ),),),
                    SlideTransition(position: _text2Animation,
                      child: Text('Of Commerce & Industry',
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.golden,
                            fontWeight: FontWeight.bold
                        ),),)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.42,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyTextField(
                          controller: emailController,
                          hintText: 'Enter Email',
                        textKeyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Email is required";
                          }
                        },),
                        SizedBox(height: 30),
                        MyTextField(
                          controller: passController,
                          hintText: 'Enter Password',
                          obscurText: isObsecure,
                          textKeyboardType: TextInputType.visiblePassword,
                          labelText: 'Password',
                          sufixIcon: IconButton(
                              onPressed: (){
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          }, icon: isObsecure
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility_outlined),
                          color: isObsecure ? Colors.grey : Colors.white,),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Password is required";
                            }
                          },),
                        SizedBox(height: 50),
                        InkWell(
                          onTap: (){
                            setState(() {
                              isLoading = true;
                            });
                            Timer(Duration(seconds: 1), () {
                              setState(() {
                                isLoading = false;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                Fluttertoast.showToast(
                                    msg: "Welcome To SCCI",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: AppColors.golden,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              });
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 55,
                            decoration: BoxDecoration(
                              color: AppColors.golden.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Center(child: isLoading
                              ? CircularProgressIndicator(color: AppColors.white,)
                                : Text('Sign In',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold),)),
                          ),
                        )
                        // TextFormField(
                        //   controller: emailController,
                        //   keyboardType: TextInputType.emailAddress,
                        //   style: TextStyle(color: Colors.white),
                        //   decoration: InputDecoration(
                        //     fillColor: AppColors.black.withOpacity(0.4),
                        //     filled: true,
                        //     labelText: 'Email',
                        //     hintText: 'Enter your email',
                        //     hintStyle: TextStyle(color: Colors.white),
                        //     labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(20.0)
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide()
                        //     )
                        //   ),
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Please enter your email';
                        //     }
                        //     return null;
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

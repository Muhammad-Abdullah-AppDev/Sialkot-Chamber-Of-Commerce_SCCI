import 'package:flutter/material.dart';
import 'package:scci_app/components/myDrawer.dart';
import 'package:scci_app/constants/appColors.dart';
import 'package:scci_app/pages/certificate_of_origin.dart';
import 'package:scci_app/pages/eBusiness_invitation_screen.dart';
import 'package:scci_app/pages/membership_application.dart';
import 'package:scci_app/pages/membership_renewal.dart';
import 'package:scci_app/pages/visa_letter_verify.dart';
import 'package:scci_app/pages/visa_recommendation.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Offset> _text1Animation;
  late Animation<Offset> _text2Animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _text1Animation = Tween<Offset>(
      begin: Offset(-1, 0), // Start from the left
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: AppColors.white,
      ),
      body: Stack(
          children: [
            BackgroundContainer(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  SlideTransition(
                    position: _text1Animation,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => VisaRecommendation()));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.golden,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 0,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 1,
                                  blurRadius: 10
                                )
                              ]
                            ),
                            child: Row(
                              children: [
                                Image(image: AssetImage("assets/images/visa.png"),),
                                SizedBox(width: 10,),
                                Text("Visa Recommendation",
                                  style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SlideTransition(
                    position: _text2Animation,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EbusinessInvitation()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("E-Business Invite",
                                    style: TextStyle(fontSize: 20),),
                                  Image(image: AssetImage("assets/images/business_invite.png"),),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 5
                                  )
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  SlideTransition(
                    position: _text1Animation,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MembershipApplication()));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                            child: Row(
                              children: [
                                Image(image: AssetImage("assets/images/membership_app.png",),
                                height: 60,),
                                SizedBox(width: 10,),
                                Text("Membership Apply",
                                  style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SlideTransition(
                    position: _text2Animation,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MembershipRenewal()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Membership Renewal",
                                    style: TextStyle(fontSize: 20),),
                                  Image(image: AssetImage("assets/images/renewal.png"),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.green,
                                boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 1,
                                  blurRadius: 10
                              )
                            ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  SlideTransition(
                    position: _text1Animation,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => VisaLetterVerify()));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                            child: Row(
                              children: [
                                Image(image: AssetImage("assets/images/verify.png",),
                                  height: 60,),
                                SizedBox(width: 10,),
                                Text("Visa Letter Verification",
                                  style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SlideTransition(
                    position: _text2Animation,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CertificateOfOrigin()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Certificate Of Origin",
                                    style: TextStyle(fontSize: 20),),
                                  Image(image: AssetImage("assets/images/certificate.png"),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 10
                                  )
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class BackgroundContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.blueAccent,
            AppColors.primaryColor,
            Colors.blue,
            AppColors.appColor
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
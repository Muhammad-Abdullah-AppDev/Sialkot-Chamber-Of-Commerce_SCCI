import 'package:flutter/material.dart';
import 'package:scci_app/pages/certificate_of_origin.dart';
import 'package:scci_app/pages/eBusiness_invitation_screen.dart';
import 'package:scci_app/pages/membership_application.dart';
import 'package:scci_app/pages/membership_renewal.dart';
import 'package:scci_app/pages/visa_letter_verify.dart';
import 'package:scci_app/pages/visa_recommendation.dart';

import '../constants/appColors.dart';
import '../pages/auth/login_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white70,
      elevation: 32,
      shadowColor: AppColors.white,
      child: Container(
        color: Colors.white70,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                currentAccountPictureSize: Size.square(80),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                ),
                margin: EdgeInsets.zero,
                accountName: Text("",
                  //fkroll,
                  style: TextStyle(fontSize: 16),
                ),
                accountEmail: Text(" Welcome!",
                  //email,
                  style: TextStyle(fontSize: 16),
                ),
                // currentAccountPicture: Image.network(imageUrl),
                currentAccountPicture: CircleAvatar(
                  // radius: 20,
                  child: Image.asset('assets/images/profile_avatar.png',
                    height: 50,
                    width: 50,),
                ),
              ),
            ),

            ListTile(
              onTap: ()  {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VisaRecommendation()));
              },
              leading: Icon(
                Icons.recommend_outlined,
                color: AppColors.appColor,
              ),
              title: Text(
                "Visa Recommendation",
              ),
            ),
            ListTile(
              onTap: ()  {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EbusinessInvitation()));
              },
              leading: Icon(
                Icons.insert_invitation_outlined,
                color: AppColors.appColor,
              ),
              title: Text(
                "E-Business Invitation",
              ),
            ),
            ListTile(
              onTap: ()  {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MembershipApplication()));
              },
              leading: Icon(
                Icons.local_post_office_outlined,
                color: AppColors.appColor,
              ),
              title: Text(
                "Membership Application",
              ),
            ),
            ListTile(
              onTap: ()  {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MembershipRenewal()));
              },
              leading: Icon(
                Icons.autorenew,
                color: AppColors.appColor,
              ),
              title: Text(
                "Membership Renewal",
              ),
            ),
            ListTile(
              onTap: ()  {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VisaLetterVerify()));
              },
              leading: Icon(
                Icons.verified_user_outlined,
                color: AppColors.appColor,
              ),
              title: Text(
                "Visa Letter Verification",
              ),
            ),
            ListTile(
              onTap: ()  {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CertificateOfOrigin()));
              },
              leading: Icon(
                Icons.verified_outlined,
                color: AppColors.appColor,
              ),
              title: Text(
                "Certificate Of Origin",
              ),
            ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                await Future.delayed(Duration(milliseconds: 1));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              leading: Icon(
                Icons.logout,
                color: AppColors.errorColor,
              ),
              title: Text(
                "Logout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

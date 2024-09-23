import 'package:flutter/material.dart';
import 'package:scci_app/constants/appColors.dart';

class MembershipApplication extends StatefulWidget {
  const MembershipApplication({super.key});

  @override
  State<MembershipApplication> createState() => _MembershipApplicationState();
}

class _MembershipApplicationState extends State<MembershipApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: Text('Membership Application'),
      ),
      body: Text(''),
    );
  }
}

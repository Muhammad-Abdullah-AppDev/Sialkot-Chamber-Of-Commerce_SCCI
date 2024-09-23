import 'package:flutter/material.dart';
import 'package:scci_app/constants/appColors.dart';

class MembershipRenewal extends StatefulWidget {
  const MembershipRenewal({super.key});

  @override
  State<MembershipRenewal> createState() => _MembershipRenewalState();
}

class _MembershipRenewalState extends State<MembershipRenewal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: Text('Membership Renewal'),
      ),
      body: Text(''),
    );
  }
}

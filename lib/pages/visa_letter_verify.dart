import 'package:flutter/material.dart';
import 'package:scci_app/constants/appColors.dart';

class VisaLetterVerify extends StatefulWidget {
  const VisaLetterVerify({super.key});

  @override
  State<VisaLetterVerify> createState() => _VisaLetterVerifyState();
}

class _VisaLetterVerifyState extends State<VisaLetterVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: AppColors.white,
        title: Text('Visa Letter Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  boxShadow: [BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 4,
                      color: Colors.black54
                  )]
              ),
              child: TextFormField(
                //keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Search by Visa Letter No',
                  fillColor: Colors.grey.withOpacity(0.5),
                  filled: true
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: 140,
              decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 4,
                  color: Colors.grey
                )]
              ),
              child: Center(
                child: Text('SEARCH',
                  style: TextStyle(color: AppColors.white,
                      fontSize: 16),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

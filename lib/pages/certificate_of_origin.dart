import 'package:flutter/material.dart';

import '../constants/appColors.dart';

class CertificateOfOrigin extends StatefulWidget {
  const CertificateOfOrigin({super.key});

  @override
  State<CertificateOfOrigin> createState() => _CertificateOfOriginState();
}

class _CertificateOfOriginState extends State<CertificateOfOrigin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: AppColors.white,
        title: Text('Certificate Of Origin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 220,
                  color: Colors.grey.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55, top: 10, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Exporter's Membership\nNumber:",
                          style: TextStyle(fontSize: 15),),
                        SizedBox(height: 10,),
                        TextFormField(
                          //keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Enter No',
                              fillColor: Colors.white,
                              filled: true
                          ),
                        ),
                        SizedBox(height: 35,),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [BoxShadow(
                                  spreadRadius: 3,
                                  blurRadius: 4,
                                  color: Colors.grey
                              )]
                          ),
                          child: Center(
                            child: Text('NEXT',
                              style: TextStyle(color: AppColors.white,
                                  fontSize: 16),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: 220,
                  color: AppColors.appColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

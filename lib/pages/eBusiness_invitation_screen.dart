import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scci_app/constants/appColors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
const fileName = 'E-BUSINESS INVITATION LETTER.pdf';
const imageUrl = 'https://scci.com.pk/wp-content/uploads/2022/09/ebil-v1.1.pdf';

class EbusinessInvitation extends StatefulWidget {
  const EbusinessInvitation({super.key});

  @override
  State<EbusinessInvitation> createState() => _EbusinessInvitationState();
}

class _EbusinessInvitationState extends State<EbusinessInvitation> {

  double progress = 0;
  String fileStoredPath = '';

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = '';

  // This method uses Dio to download a file from the given URL
  // and saves the file to the provided `savePath`.
  Future download(Dio dio, String url, String savePath) async {
    debugPrint('Success');
    debugPrint('URL: $url');
    debugPrint('Saved Path: $savePath');
    fileStoredPath = savePath;
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) { return status! < 500; }
        ),
      );
      var file = File(savePath).openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      debugPrint('Success: $file');
      await file.close();

    } catch (e) {
      debugPrint('Error Occured: $e');
    }
  }

  // You can update the download progress here so that the user is
  // aware of the long-running task.
  void updateProgress(done, total) {
    progress = done / total;
    setState(() {
      if (progress >= 1) {
        progressString = '✅ File has finished downloading.';
        didDownloadPDF = true;
      } else {
        progressString = 'Download progress: ' + (progress * 100).toStringAsFixed(0) + '% done.';
      }
    });
  }

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: AppColors.white,
        title: Text('E-Business Invitation Letter'),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dear Member,\n\nI wish to share with you that Federal Government of Pakistan through National Data Base Registration Authority (NADRA) has developed the "
                  "E-Business Invitation Letter (E-BIL) system which would allow foreigners to apply online for E-Business Invitation Letter which is a mandatory requirement for Pakistan Business Visa.\n",
                textAlign: TextAlign.justify,),
              Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                      text: "The system has been implemented from March 2020, and is mandatory for all Foreign Nationals intending to visit Pakistan for business purposes. The E-Bil Interface can be assessed through ",
                      children: <InlineSpan>[
                        TextSpan(
                          text: "http://ebil.nadra.gov.pk/.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.appColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _launchURL("http://ebil.nadra.gov.pk/"); // Open the URL on tap
                            },
                        )
                      ]
                  )
              ),
              Text("\nThe Ministry of Commerce has informed that for now onwards, the foreign clients would have to log on to the interface and fill in the complete form, "
                  "mention the details of the invitee and attach the relevant documents to register for Official E-Bil Issuance. A complete and detailed guide of the system is enclosed herewith for your reference.",
              textAlign: TextAlign.justify,),
              Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                      text: "\nFor further information ",
                      children: <InlineSpan>[
                        TextSpan(
                          text: " click here to download the manual",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.appColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        //await _launchInWebView(Uri.parse("https://scci.com.pk/wp-content/uploads/2022/09/ebil-v1.1.pdf"));
                        _launchURL("https://scci.com.pk/wp-content/uploads/2022/09/ebil-v1.1.pdf");

                        Fluttertoast.showToast(
                            msg: "Waiting for downloading pdf",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.black,
                            fontSize: 16.0
                        );
                        //     if (!didDownloadPDF) {
                        //       debugPrint('Download PDF');
                        //       final externalDir = await getExternalStorageDirectory();
                        //       final savePath = '${externalDir!.path}/$fileName';
                        //       download(Dio(), imageUrl, savePath);
                        //     }
                      },
                        ),
                        TextSpan(
                          text: " and for more queries, you may contact the below mentioned:",
                        ),
                      ]
                  ),
              ),
              Text.rich(
                TextSpan(
                    text: "\nMr. Moazzam Ishaq",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <InlineSpan>[
                      TextSpan(text: "\nAssistant Secretary",
                          style: TextStyle(fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
                      TextSpan(text: "\n052-4261881 (Ext. 112)",
                          style: TextStyle(fontWeight: FontWeight.normal)),

                      TextSpan(text: "\n\nTariq Mahmood Malik",),
                      TextSpan(text: "\nSecretary General",
                          style: TextStyle(fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
                      TextSpan(text: "\nThe Sialkot Chamber of Commerce & Industry",
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ]
                ),
              ),
            ],
          ),
            ),
        ),
    );
  }

  _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false, forceWebView: false, universalLinksOnly: false, enableDomStorage: false);
        Fluttertoast.showToast(
            msg: "PDF Downloaded successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.black,
            fontSize: 16.0
        );
      } else {
        Fluttertoast.showToast(
            msg: "Failed To Downloaded PDF",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.black,
            fontSize: 16.0
        );
        throw 'Could not launch $url';
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Some Error Occurred While downloading",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0
      );
      debugPrint('Error launching URL: $e');
    }
  }

}

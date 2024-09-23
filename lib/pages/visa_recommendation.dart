import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/appColors.dart';

class VisaRecommendation extends StatefulWidget {
  const VisaRecommendation({super.key});

  @override
  State<VisaRecommendation> createState() => _VisaRecommendationState();
}

class _VisaRecommendationState extends State<VisaRecommendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: AppColors.white,
        title: Text('Visa Recommend Letter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Visa Recommendatory Letters",
                style: TextStyle(fontWeight: FontWeight.bold),),
              Text("\nThe Sialkot Chamber of Commerce & Industry issues Visa Recommendatory Letters in favor of foreign Embassies/High Commissions/Consulates, "
                  "in Pakistan, to support the Visa Applications of the members. Normally, it will take one week for processing Visa Recommendatory Letter’s application of members.",
                  textAlign: TextAlign.justify,),
              Text("\nHow to Get the Visa Recommendatory Letter?",
                style: TextStyle(fontWeight: FontWeight.bold),),
              Text("\nAny member of SCCI may file his application for the issuance of Visa Recommendatory Letter. The members (Proprietors/Partners/Directors) are required to submit "
                  "the following documents for the issuance of Visa Recommendatory Letter. The managers applying for Visa Recommendatory Letter are required to submit some additional documents "
                  "which are also given in the end.\n\nRequest Letter (at their own Letter head) signed by the Authorized Representative in the Chamber. Duly filled",
                textAlign: TextAlign.justify,),

              Text.rich(
                textAlign: TextAlign.justify,
                TextSpan(
                    text: "\n1. Application Form (Click here to fill the application online Or ",
                    children: <InlineSpan>[
                      TextSpan(
                        text: " click here to download the application form",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.appColor),
                      recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              _launchURL(
                                  "https://scci.com.pk/wp-content/uploads/2019/04/Visa-Recomendatary-Letter-form.pdf");

                              Fluttertoast.showToast(
                                  msg: "Waiting for downloading pdf",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.black,
                                  fontSize: 16.0
                              );
                            }
                      ),
                      TextSpan(
                        text: " ake the print out on A4 size paper in black & white. Don’t make any amendment/modification in the form. "
                            "Fill the Form in capital letters. Two copies of duly filled Undertaking Form",
                      ),
                    ]
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "\n2. (",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <InlineSpan>[
                      TextSpan(text: "click to download the undertaking form",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: AppColors.appColor),
                      recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                              _launchURL("https://scci.com.pk/wp-content/uploads/2019/04/Undertaking-for-Visa-Recommendatory-Letter.pdf");

                              Fluttertoast.showToast(
                                  msg: "Waiting for downloading pdf",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.black,
                                  fontSize: 16.0
                              );
                          }),
                      TextSpan(text: ") with following requirements.",
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ]
                ),
              ),
              Text("\n•  Copy of National Identity Card with original"
                  "\n•  Copy of Passport with original"
                  "\n•  If Passport changed, photocopy of new passport\n   containing endorsement of previous passport"
                  "\n•  Export performance of current/last financial/\n   calendar year duly attested by the Bank"
                  "\n•  Bank Confidential Report (mentioning all partners\n   as per our record)"
                  "\n•  Invitation from the foreign customer"),
              Text.rich(
                textAlign: TextAlign.justify,
                TextSpan(
                    text: "\nNote",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <InlineSpan>[
                      TextSpan(text: "\n\nThe office Bearers of Chamber may interview any applicant, if they so desire, while considering the application and call for the supporting documents.",
                          style: TextStyle(fontWeight: FontWeight.normal,)),
                    ]
                ),
              ),
              Text('\nThe President and the office bearers of the Chamber are authorized by the Executive Committee to meet the genuine needs of the member firms.'
                  '\nHowever, they shall exercise discretion and take necessary measures so that this important facility is not misused in any way and image of this Chamber is not thereby spoiled.'
                  '\n\n•  Bank Guarantee showing that Manager is also\n   operating Bank Account on behalf of firm/\n   company for the last one year'
                  '\n\n•  Proof of National Tax Number (NTN) that he\n   is paying Income Tax'
                  '\n\n•  Service Certificate with monthly drawing salary'
                  '\n\n•  The Undertaking Form should be signed by the\n   firm’s authorized representative in the Chamber'
                  '\n\n•  Signature of firm’s authorized representative on\n   the request letter as well as on the undertaking\n   must be verified from the Chamber’s record'
                  '\n\nThe Applications for Visa Recommendatory Letters of Managers are always put up before the Senior Vice President/Visa Committee for final decision',
                textAlign: TextAlign.justify,),
              Text.rich(
                textAlign: TextAlign.justify,
                TextSpan(
                    text: "\nChamber’s Fee for Visa Recommendatory Letter",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <InlineSpan>[
                      TextSpan(text: "\n\nOnce, the application for the issuance of Visa Recommendatory Letter is approved, the members are required to deposit the fee for Visa Recommendatory Letter, as given below:",
                          style: TextStyle(fontWeight: FontWeight.normal,)),
                      TextSpan(text: "\n\nSchengen countries Rs. 3,000/- \nAll other countries Rs. 3,000/-",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]
                ),
              ),
            ],
          ),
        ),
      )
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

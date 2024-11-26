import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../Widgets/CoreButton.dart';
import '../main.dart';
import 'Otp.dart';

class Register extends StatefulWidget {
  final String phoneNumber;
  final String showedPhoneNumber;
  const Register({super.key, required this.phoneNumber, required this.showedPhoneNumber});

  @override
  _RegisterState createState() => _RegisterState(phoneNumber, showedPhoneNumber);
}

class _RegisterState extends State<Register> {

  final String _phoneNumber;
  final String _showedPhoneNumber;

  _RegisterState(this._phoneNumber, this._showedPhoneNumber);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneNumber = "+1";
  String showedPhoneNumber = "";
  String _verificationId = '';
  bool _isCodeSent = false;
  bool _isLoading = false;


  void addInfo() async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      DocumentReference docRef = db.collection(MyApp.infoData.category).doc();
      await docRef.set({
        'firstName': MyApp.infoData.firstName,
        'lastName': MyApp.infoData.lastName,
        'phone': MyApp.infoData.phone,
        'email': MyApp.infoData.email,
        'city': MyApp.infoData.city,
        'street': MyApp.infoData.street,
        'zipcode': MyApp.infoData.zipcode,
        'about': MyApp.infoData.about,
        'questions': MyApp.infoData.questions,
      });
      print('Document added successfully!');
    } catch (e) {
      print('Error adding document: $e');
    }
  }



  @override
  void initState() {
    phoneNumber = _phoneNumber;
    showedPhoneNumber = _showedPhoneNumber;
    super.initState();
  }
  void _sendOtp() async {
    var number = "+1$phoneNumber";

    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          debugPrint("Phone number automatically verified");
          await _auth.signInWithCredential(credential);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Phone number verified automatically")),
          );
          setState(() {
            _isLoading = false;
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          addInfo();
          debugPrint("Verification failed:$number ${e.message}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification failed:$number ${e.message}")),
          );
          setState(() {
            _isLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
            _isCodeSent = true;
            _isLoading = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(
                phoneNumber: phoneNumber,
                verificationId: _verificationId,
              ),
            ),
          );
          debugPrint("OTP sent to the phone number");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content:
                Text("Auto-retrieval timed out. Enter the code manually.")),
          );
        },
      );
    } catch (e) {
      debugPrint("Error while sending OTP: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: const Color(0xFF6A6969),
    );

    final textStyle3 = GoogleFonts.lato(
      fontSize: MediaQuery.of(context).size.width/16,
      fontWeight: FontWeight.w700,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: const Color(0xFF6A6969),
    );

    final style2 = GoogleFonts.merriweather(
      fontSize: MediaQuery.of(context).size.width/20,
      fontWeight: FontWeight.w700,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: const Color(0xFF4A4A4A),
    );

    return !_isLoading ? Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
            child: Center(
              child: SizedBox(
                width: kIsWeb ? MediaQuery.of(context).size.width/1.4 : MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                   kIsWeb ?const SizedBox() : Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 32,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Lottie.asset("assets/pink_rotate_phone.json",
                          fit: BoxFit.fitHeight),
                    ),
                    const SizedBox(height: 24),
                    Text('Verify Phone Number', style: style2),
                    const SizedBox(height: 40),
                    Text(
                      "Add your phone number. We'll send you a verification code so we know you're real.",
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            showedPhoneNumber,
                            style: textStyle3,
                          ),
                          const SizedBox(height: 60),
                          SizedBox(
                            width: double.infinity,
                            child: SizedBox(
                              height: 58,
                              child: CoreButton(
                                textSize: 18,
                                text: "Send OTP",
                                onTap: _sendOtp,
                                lineColor: const Color(0xFFFF0083),
                                backgroundColor: const Color(0xFFFF0083),
                                textColor: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    ) : Container(
      color: Colors.white,
      child: Center(child: Lottie.asset("assets/briliant.json",
        fit: BoxFit.fitHeight),
    ),);
  }
}

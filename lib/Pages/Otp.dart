import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../Widgets/CoreButton.dart';
import '../main.dart';

class Otp extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const Otp(
      {super.key, required this.phoneNumber, required this.verificationId});

  @override
  _OtpState createState() => _OtpState(verificationId: verificationId);
}

class _OtpState extends State<Otp> {
  final String verificationId;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());

  String _verificationId = "";
  bool _isCodeSent = false;
  bool _isLoading = false;
  int _resendCooldown = 30;
  Timer? _timer;
  bool verifySuccess = true;

  _OtpState({required this.verificationId});

  @override
  void initState() {
    _verificationId = verificationId;
    _startResendTimer();
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    setState(() {
      _resendCooldown = 30;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendCooldown > 0) {
          _resendCooldown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  String _getOtp() {
    return _otpControllers.map((controller) => controller.text).join();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _sendOtp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          _showSnackBar("Phone number automatically verified!");
        },
        verificationFailed: (FirebaseAuthException e) {
          _showSnackBar("Verification failed: ${e.message}");
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
          _showSnackBar("OTP sent to your phone number.");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
      _startResendTimer();
    } catch (e) {
      _showSnackBar("Error sending OTP: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _getOtp().trim(),
      );

      await _auth.signInWithCredential(credential);
      setState(() {
        verifySuccess = true;
        MyApp.infoData.phone = widget.phoneNumber;
        addInfo();
      });
      _showSnackBar("Phone number verified successfully!");
    } catch (e) {
      _showSnackBar("Error! OTP code Invalid");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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

  Widget _textFieldOTP(
      {required bool first, required bool last, required int index}) {
    return Container(
      height: kIsWeb
          ? MediaQuery.of(context).size.width / 17
          : MediaQuery.of(context).size.width / 9,
      width: kIsWeb
          ? MediaQuery.of(context).size.width / 16
          : MediaQuery.of(context).size.width / 9,
      alignment: Alignment.center,
      // Ensures text is centered inside the container
      child: AspectRatio(
        aspectRatio: 1.0, // Keeps the container square
        child: Center(
          child: TextField(
            controller: _otpControllers[index],
            autofocus: index == 0,
            // Autofocus only the first field
            onChanged: (value) {
              if (value.isNotEmpty && value.length == 1) {
                if (!last) {
                  FocusScope.of(context).nextFocus(); // Move to next field
                } else {
                  FocusScope.of(context).unfocus(); // Dismiss keyboard
                }
              } else if (value.isEmpty && !first) {
                FocusScope.of(context)
                    .previousFocus(); // Move to previous field
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            // Horizontally center the text
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: const Offstage(),
              // Hides character counter
              contentPadding: EdgeInsets.zero,
              // Removes padding for better alignment
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Color(0xFFFF0083)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final style2 = GoogleFonts.merriweather(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: const Color(0xFF4A4A4A),
    );

    final textStyle = GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: const Color(0xFF6A6969),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: !verifySuccess
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                  child: Center(
                    child: Column(
                      children: [
                        kIsWeb
                            ? const SizedBox()
                            : Align(
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
                          width: 140,
                          height: 140,
                          child: Lottie.asset("assets/sms.json",
                              fit: BoxFit.fitHeight),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Verification',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Enter your OTP code number",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 28),
                        Container(
                          width: kIsWeb
                              ? MediaQuery.of(context).size.width / 2.5
                              : MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 28, bottom: 28),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(6, (index) {
                                  return _textFieldOTP(
                                    first: index == 0,
                                    last: index == 5,
                                    index: index,
                                  );
                                }),
                              ),
                              const SizedBox(height: 22),
                              (_isLoading
                                  ? Center(
                                      child: Lottie.asset("assets/loader.json"))
                                  : SizedBox(
                                      width: double.infinity,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: SizedBox(
                                          height: 58,
                                          child: CoreButton(
                                            textSize: 18,
                                            text: "Verify",
                                            onTap: _verifyOtp,
                                            lineColor: const Color(0xFFFF0083),
                                            backgroundColor:
                                                const Color(0xFFFF0083),
                                            textColor: Colors.white,
                                          ),
                                        ),
                                      )))
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          "Didn't you receive any code?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 18),
                        (_resendCooldown > 0
                            ? Text(
                                "Resend in $_resendCooldown seconds",
                                style: const TextStyle(color: Colors.grey),
                              )
                            : GestureDetector(
                                onTap: () {
                                  _sendOtp();
                                  _startResendTimer();
                                },
                                child: const Text(
                                  "Resend New Code",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF0083),
                                  ),
                                ),
                              ))
                      ],
                    ),
                  ),
                ),
              )
            : kIsWeb
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 32),
                          child: Column(
                            children: [
                              Container(
                                child: Lottie.asset(
                                    "assets/home_scan_success.json",
                                    fit: BoxFit.fitHeight),
                              ),
                              Text('Done', style: style2),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Congratulations, you have passed all stages of verification. We will contact you.",
                                style: textStyle,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SizedBox(
                                      height: 58,
                                      child: CoreButton(
                                        textSize: 18,
                                        text: "Finish",
                                        onTap: () {},
                                        lineColor: const Color(0xFFFF0083),
                                        backgroundColor:
                                            const Color(0xFFFF0083),
                                        textColor: Colors.white,
                                      ),
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 100),
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 32),
                          child: Column(
                            children: [
                              Container(
                                child: Lottie.asset(
                                    "assets/home_scan_success.json",
                                    fit: BoxFit.fitHeight),
                              ),
                              Text('Done', style: style2),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Congratulations, you have passed all stages of verification. We will contact you.",
                                style: textStyle,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SizedBox(
                                      height: 58,
                                      child: CoreButton(
                                        textSize: 18,
                                        text: "Finish",
                                        onTap: () {},
                                        lineColor: const Color(0xFFFF0083),
                                        backgroundColor:
                                            const Color(0xFFFF0083),
                                        textColor: Colors.white,
                                      ),
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ),
      ),
    );
  }
}

import 'package:fixfinder/Pages/PhoneAuthScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/CoreButton.dart';

class UserAboutPerson extends StatefulWidget {
  const UserAboutPerson({super.key});

  @override
  State<UserAboutPerson> createState() => _UserAboutPersonState();
}

class _UserAboutPersonState extends State<UserAboutPerson> {
  final _formKey = GlobalKey<FormState>();
  var phoneNumber = "";
  var showedPhoneNumber = "";

  @override
  Widget build(BuildContext context) {

    void closeKeyboard(BuildContext context) async {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }
    final textStyleQuestion = GoogleFonts.merriweather(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: Colors.black54,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Please tell us a little about your project.',
                  style: textStyleQuestion,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextField2(
                          hintText: 'FIRST NAME',
                          prefixIcon: Icons.person_outline,
                          context: context,
                          validator: nameValidator,
                        ),
                      ),
                      const SizedBox(width: 10),  // Spacing between the text fields
                      Expanded(
                        child: buildTextField2(
                          hintText: 'LAST NAME',
                          prefixIcon: Icons.person_outline,
                          context: context,
                          validator: nameValidator,
                        ),
                      ),
                    ],
                  ),
                ),
                buildTextField1(
                  hintText: 'EMAIL ADDRESS',
                  prefixIcon: Icons.email_outlined,
                  context: context,
                  validator: emailValidator,
                ),
                buildTextFieldPhone(
                  hintText: 'PHONE NUMBER',
                  prefixIcon: Icons.phone_android,
                  context: context,
                  validator: phoneValidator,
                  formatter: [
                    MaskedInputFormatter('(#00)-000-0000')
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 58,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: CoreButton(
                            textSize: 18,
                            text: "Previous",
                            onTap: () async {
                              closeKeyboard(context);
                              await Future.delayed(const Duration(milliseconds: 100)); // Optional: ensure keyboard close animation completes
                              Navigator.pop(context);
                            },
                            lineColor: const Color(0xFFFF0083),
                            backgroundColor: Colors.white,
                            textColor: const Color(0xFFFF0083)
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                          height: 58,
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: CoreButton(
                              textSize: 18,
                              text: "Next",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, you can perform further actions here
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                  );

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Register(phoneNumber: phoneNumber,showedPhoneNumber: showedPhoneNumber,),
                                      )
                                  );
                                }
                              },
                              lineColor: const Color(0xFFFF0083),
                              backgroundColor: const Color(0xFFFF0083),
                              textColor: Colors.white
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldPhone({
    required String hintText,
    required IconData prefixIcon,
    required BuildContext context,
    required String? Function(String?) validator,
    List<TextInputFormatter>? formatter,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFFF0083), width: 2.0),
          ),
          isDense: true,
          fillColor: const Color(0XFFFFFFFF),
          filled: true,
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon, size: 26),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        inputFormatters: formatter,
        validator: validator,
        keyboardType: TextInputType.phone,
      ),
    );
  }


  Widget buildTextField1({
    required String hintText,
    required IconData? prefixIcon,
    required BuildContext context,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFFF0083), width: 2.0),
          ),
          isDense: true,
          fillColor: const Color(0XFFFFFFFF),
          filled: true,
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 26) : null,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        validator: validator,
      ),
    );
  }


  Widget buildTextField2({
    required String hintText,
    required IconData? prefixIcon,
    required BuildContext context,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFFF0083), width: 2.0),
          ),
          isDense: true,
          fillColor: const Color(0XFFFFFFFF),
          filled: true,
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 26) : null,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        validator: validator,
      ),
    );
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? emailValidator(String? value) {
    String pattern = r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty || !RegExp(r'^\(\d{3}\)-\d{3}-\d{4}$').hasMatch(value)) {
      return 'Enter a valid US phone number (e.g., (818)-855-5055)';
    }
    var ph =  value.replaceAll(RegExp(r'\D'), '');
    phoneNumber = ph;
    showedPhoneNumber = value;
    return null;
  }
}

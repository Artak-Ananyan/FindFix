import 'package:fixfinder/Pages/UserAboutPerson.dart';
import 'package:fixfinder/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../Widgets/CoreButton.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class UserAboutAddress extends StatefulWidget {
  const UserAboutAddress({super.key});

  @override
  State<UserAboutAddress> createState() => _UserAboutAddressState();
}

class _UserAboutAddressState extends State<UserAboutAddress> with TickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  final TextEditingController inputEmail = TextEditingController();
  var isLoaded = false;
  bool isActivate = false;
  late AnimationController _controlle2;



  @override
  void initState() {
    super.initState();
    _delayLoading();
    _controlle2 = AnimationController(vsync: this);

  }

  Future<void> _delayLoading() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Set an appropriate delay duration
    setState(() {
      isLoaded = true; // Set isLoaded to true after the delay
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyleQuestion = GoogleFonts.merriweather(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: Colors.black54,
    );

    void closeKeyboard(BuildContext context) async {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: !isActivate
            ? Stack(
                children: [
                  Container(
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
                          buildTextField(
                            margin: MediaQuery.of(context).size.width / 6,
                            hintText: 'STREET',
                            prefixIcon: Icons.home_outlined,
                            context: context,
                            validator: streetValidator,
                          ),
                          buildTextField(
                            margin: MediaQuery.of(context).size.width / 6,
                            hintText: 'CITY',
                            prefixIcon: Icons.location_city_outlined,
                            context: context,
                            validator: basicValidator, // Assuming simple non-empty validation
                          ),
                          buildTextField(
                            margin: MediaQuery.of(context).size.width / 6,
                            hintText: 'ZIP CODE',
                            prefixIcon: Icons.signpost_outlined,
                            context: context,
                            validator: zipCodeValidator,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 40,
                              left: kIsWeb
                                  ? MediaQuery.of(context).size.width / 9
                                  : MediaQuery.of(context).size.width / 40,
                              right: kIsWeb
                                  ? MediaQuery.of(context).size.width / 9
                                  : MediaQuery.of(context).size.width / 40,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 58,
                                  width: kIsWeb
                                      ? MediaQuery.of(context).size.width / 2.7
                                      : MediaQuery.of(context).size.width / 2 -
                                          30,
                                  child: CoreButton(
                                      textSize: 18,
                                      text: "Previous",
                                      onTap: () async {
                                        closeKeyboard(context);
                                        await Future.delayed(const Duration(
                                            milliseconds:
                                                100)); // Optional: ensure keyboard close animation completes
                                        Navigator.pop(context);
                                      },
                                      lineColor: const Color(0xFFFF0083),
                                      backgroundColor: Colors.white,
                                      textColor: const Color(0xFFFF0083)),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                    height: 58,
                                    width: kIsWeb
                                        ? MediaQuery.of(context).size.width /
                                            2.7
                                        : MediaQuery.of(context).size.width / 2 - 30,
                                    child: CoreButton(
                                        textSize: 18,
                                        text: "Next",
                                        onTap: () {
                                          if (_formKey.currentState!.validate()) {
                                            // If the form is valid, you can perform further actions here
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Processing Data')),
                                            );

                                            setState(() {

                                              isActivate = true;
                                            });
                                          }

                                        },
                                        lineColor: const Color(0xFFFF0083),
                                        backgroundColor: const Color(0xFFFF0083),
                                        textColor: Colors.white))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                color: const Color(0xfff7f7f7),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Lottie.asset(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    "assets/briliant.json",
                    controller: _controlle2,
                    onLoaded: (composition) {
                      _controlle2
                        ..duration = composition.duration
                        ..forward().whenComplete(() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserAboutPerson()),
                            ));
                    },
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildTextField({
    required String hintText,
    required IconData prefixIcon,
    required BuildContext context,
    required double margin,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kIsWeb ? margin : 20.0, vertical: 8.0),
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
        validator: validator,
      ),
    );
  }



  String? streetValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Street cannot be empty';
    }
    MyApp.infoData.street = value;
    return null;
  }

  String? basicValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }

    MyApp.infoData.city = value;
    return null;
  }

  String? zipCodeValidator(String? value) {
    String pattern = r'^\d{5}(-\d{4})?$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid ZIP code (e.g., 12345 or 12345-6789)';
    }
    MyApp.infoData.zipcode = value;
    return null;
  }
}

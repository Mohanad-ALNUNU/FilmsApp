import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

final signUpTextControllerMap = {
  'First Name': TextEditingController(),
  'Last Name': TextEditingController(),
  'Email': TextEditingController(),
  'Password': TextEditingController(),
  'Password Verify': TextEditingController(),
};
final siqnInTextControllerMap = {
  'Email': TextEditingController(),
  'Password': TextEditingController(),
};

class _SignInState extends State<SignIn> {
  bool isSignIn = true;
  Color _buttonColor = const Color.fromARGB(255, 255, 50, 70);
  BorderRadius _borderRadius = BorderRadius.circular(0);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    void changeColor(signList) {
      int filledFieldsNumber = 0;
      _buttonColor = const Color.fromARGB(255, 255, 50, 70);
      var colorElementUnit = (250 ~/ signList.length);
      int red, green, blue;
      signList.forEach((key, value) {
        if (value.value.text.isNotEmpty) {
          filledFieldsNumber++;
        }
      });
      //changing RGB value
      red = (_buttonColor.red > 0 + colorElementUnit)
          ? _buttonColor.red - (colorElementUnit * filledFieldsNumber)
          : 0;
      blue = (_buttonColor.blue > 255 - colorElementUnit)
          ? _buttonColor.blue + (colorElementUnit * filledFieldsNumber)
          : 255;

      setState(() {
        _buttonColor = Color.fromARGB(255, red, _buttonColor.green, blue);
        _borderRadius = BorderRadius.circular(filledFieldsNumber * 3);
      });
    }

    List<Widget> buildSiqnInFields(
        Map<String, TextEditingController> textControllers) {
      final signeInInputFields = <Widget>[];
      textControllers.forEach((key, value) {
        signeInInputFields.add(
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              onChanged: (val) {
                changeColor(isSignIn
                    ? siqnInTextControllerMap
                    : signUpTextControllerMap);
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "please enter valide value";
                } else {
                  return null;
                }
              },
              controller: value,
              decoration: InputDecoration(hintText: key),
            ),
          ),
        );
      });

      return signeInInputFields;
    }

    void switchSignType() {
      setState(() {
        isSignIn = !isSignIn;
      });
    }

    print("_screenWidth");
    print(_screenWidth);
    print(_screenHeight);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isSignIn ? "Sign In" : "Sign Up",
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.w100),
                ),
                Column(
                  children: buildSiqnInFields(isSignIn
                      ? siqnInTextControllerMap
                      : signUpTextControllerMap),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: _screenWidth / 2.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: _buttonColor,
                          borderRadius: _borderRadius,
                        ),
                        duration: const Duration(milliseconds: 350),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent.withOpacity(0),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate() && isSignIn) {
                              signeIn(context);
                            }
                            if (_formKey.currentState!.validate() && !isSignIn) {
                              //signeUn();
                            }
                          },
                          child: Text(
                            isSignIn ? "Sign In" : "Sign Up",
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    TextButton(
                        onPressed: switchSignType,
                        child: Text(
                            isSignIn ? 'Sign up now !' : 'Have account ?')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void signeIn(context) {
  //Do sign in then change page
  Navigator.of(context).pushReplacementNamed('/home');
}

import 'package:flutter/material.dart';
import 'package:water_distribution_management/ui/widgets/divider_with_text.dart';
import 'package:water_distribution_management/ui/widgets/logo_block.dart';
import 'package:water_distribution_management/utils/colors.dart';
import 'package:water_distribution_management/utils/validators.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isLogIn = false;
  bool _isObscured = true;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: Column(
        children: [
          LogoBlock(
            isMinimized: true,
          )
        ],
      ),
    );
  }

  Widget _loginSignUpBlock() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 300, left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'مرحبا بك في ..',
                style: TextStyle(fontSize: 14),
              )),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Text(
                'تطبيق توزيع المياه الذكي',
                style: TextStyle(fontSize: 24),
              )),
          const SizedBox(
            height: 22,
          ),
          const DividerWithText(text: "تسجيل الدخول"),
          const SizedBox(
            height: 22,
          ),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formState,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _formState.currentState!.validate();
                  _validateInput();
                });
              },
              controller: _email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
                if (!Validator.emailFieldValidation(value)) {
                  return "الرجاء ادخال رقم مشترك صحيح";
                }
                return null;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "مثال: 123456789",
                  hintStyle:
                      TextStyle(color: kPrimaryDarkerColor.withOpacity(0.4))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _validateInput();
                });
              },
              controller: _password,
              obscureText: _isObscured,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                      color: kPrimaryColor,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: const TextStyle(color: kPrimaryDarkerColor)),
            ),
          )
        ],
      ),
    );
  }

  Widget _signUpForm() {
    return Form(
      key: _formState,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _formState.currentState!.validate();
                  _validateInput();
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
                if (!Validator.isFullNameValid(value)) {
                  return "Please enter a valid Full name";
                }
                return null;
              },
              controller: _fullName,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Full Name",
                  hintStyle: TextStyle(color: kPrimaryDarkerColor)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _formState.currentState!.validate();
                  _validateInput();
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
                if (!Validator.emailFieldValidation(value)) {
                  return "Please enter a valid email";
                }
                return null;
              },
              controller: _email,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(color: kPrimaryDarkerColor)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _formState.currentState!.validate();
                  _validateInput();
                });
              },
              keyboardType: TextInputType.number,
              controller: _phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
                if (!Validator.phoneNumerValidation(value)) {
                  return "Please enter a valid Phone Number";
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: kPrimaryDarkerColor)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _formState.currentState!.validate();
                  _validateInput();
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
                if (!Validator.validatePassword(value)) {
                  return "Please enter a valid Password";
                }
                return null;
              },
              controller: _password,
              obscureText: _isObscured,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                      color: kPrimaryColor,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: const TextStyle(color: kPrimaryDarkerColor)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _formState.currentState!.validate();
                  _validateInput();
                });
              },
              controller: _confirmPassword,
              obscureText: true,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: kPrimaryDarkerColor)),
            ),
          ),
        ],
      ),
    );
  }

  void manageNavigation(String email) {}

  bool _validateInput() {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:water_distribution_management/ui/login_sign_up/widgets/welcome_block.dart';
import 'package:water_distribution_management/ui/widgets/divider_with_text.dart';
import 'package:water_distribution_management/ui/widgets/logo_block.dart';
import 'package:water_distribution_management/utils/buttons.dart';
import 'package:water_distribution_management/utils/colors.dart';
import 'package:water_distribution_management/utils/validators.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool _isObscured = true;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _registrationNumber = TextEditingController();
  bool _isLogin = true;
  bool _isCustomer = true;
  bool _customerCreateAccount = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kWhiteColor,
        child: Column(
          children: [
            const SizedBox(
              height: 32.0,
            ),
            const LogoBlock(
              isMinimized: true,
            ),
            const SizedBox(
              height: 32.0,
            ),
            const WelcomeBlock(),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DividerWithText(
                  text: _isLogin ? "تسجيل الدخول" : "انشاء حساب"),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _isLogin ? _loginForm() : _signUpForm()),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: QPrimaryButton.icon(
                          icon: const Icon(Icons.login),
                          fontWeight: FontWeight.bold,
                          label: _isLogin ? "تسجيل الدخول" : "انشاء حساب",
                          onPressed: () => print('Login : $_isLogin'),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isCustomer = !_isCustomer;
                          if (!_isLogin) _isLogin = true;
                        });
                      },
                      child: Text(
                        _isCustomer
                            ? "تسجيل دخول الموظفين"
                            : "تسجيل دخول المستهلكين",
                        style:
                            const TextStyle(color: kPrimaryColor, fontSize: 16),
                      )),
                  _isLogin
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: const Text(
                            "انشاء حساب",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 16),
                          ))
                      : const SizedBox(),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _isCustomer ? "رقم اشتراك المستهلك" : "البريد الإلكتروني",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TextFormField(
              keyboardType: _isCustomer
                  ? TextInputType.number
                  : TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  _formState.currentState!.validate();
                  _validateInput();
                });
              },
              controller: _isCustomer ? _registrationNumber : _email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
                if (_isCustomer) {
                  if (!Validator.isNumericWithLength(value, 9)) {
                    return "الرجاء ادخال رقم المشترك الصحيح";
                  }
                } else {
                  if (!Validator.emailFieldValidation(value)) {
                    return "الرجاء ادخال البريد الإلكتروني الصحيح";
                  }
                }
                return null;
              },
              decoration: const InputDecoration(
                disabledBorder: InputBorder.none,
                border: InputBorder.none, // No borders
              ),
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          const Text(
            "كلمة المرور",
            style: TextStyle(
              color: Colors.grey, // Baby blue color
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                    color: Colors.lightBlue,
                  ),
                ),
                border: InputBorder.none, // No borders
                hintStyle: TextStyle(color: Colors.lightBlue.withOpacity(0.4)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpForm() {
    return Form(
      key: _formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            alignment: Alignment.center,
            child: DropdownButton(
                value: _customerCreateAccount,
                hint: const Text('اختر نوع الحساب'),
                items: const [
                  DropdownMenuItem(
                    value: true,
                    child: Text('مستهلك'),
                  ),
                  DropdownMenuItem(value: false, child: Text('موظف')),
                ],
                onChanged: (value) {
                  setState(() {
                    _customerCreateAccount = value ?? false;
                  });
                }),
          ),
          Text(
            _customerCreateAccount
                ? "رقم اشتراك المستهلك"
                : "البريد الالكتروني للموظف",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                  return "الرجاء ادخال بريد الكتروني صحيح";
                }
                return null;
              },
              controller: _email,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Text(
            "الاسم الكامل",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                  return "الرجاء ادخال الاسم الكامل بشكل صحيح";
                }
                return null;
              },
              controller: _fullName,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Text(
            "كلمة المرور",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
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
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Text(
            "تأكيد كلمة المرور",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
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
              ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/constants.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:grocery/screens/auth_ui/signup/signup.dart';
import 'package:grocery/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:grocery/screens/home/home.dart';
import 'package:grocery/widgets/primary_button/primary_button.dart';
import 'package:grocery/widgets/top_title/top_title.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isHidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(title: "Login", subtitle: "Welcome to Ecommerce"),
              const SizedBox(
                height: 46,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                  label: Text("E-mail"),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_open_outlined,
                    ),
                    label: const Text("Password"),
                    suffixIcon: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isHidePassword = !isHidePassword;
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: isHidePassword
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ))),
                obscureText: isHidePassword,
              ),
              const SizedBox(
                height: 36,
              ),
              PrimaryButton(
                title: "Login",
                onPressed: () async{
                  bool isValidated = loginValidation(email.text, password.text);
                  if(isValidated){
                    bool isLogined = await FirebaseAuthHelper.instance.login(email.text, password.text, context);
                    if(isLogined){
                      Routes.instance.pushAndRemoveUntil(CustomBottomBar(), context);
                    }
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const Center(child: Text("Don't have an account?")),
              // const SizedBox(
              //   height: 5,
              // ),
              Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Routes.instance.push(const Signup(), context);
                  },
                  child: Text(
                    "create an account",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

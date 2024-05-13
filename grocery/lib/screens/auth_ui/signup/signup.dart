// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/constants.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/screens/custom_bottom_bar/custom_bottom_bar.dart';
// import 'package:grocery/screens/auth_ui/login/login.dart';
import 'package:grocery/screens/home/home.dart';
import 'package:grocery/widgets/primary_button/primary_button.dart';
import 'package:grocery/widgets/top_title/top_title.dart';

import '../../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isHidePassword = true;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(title: "Create Account", subtitle: "Welcome to Ecommerce"),
              const SizedBox(
                height: 46,
              ),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                  ),
                  label: Text("Name"),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline,
                  ),
                  label: Text("E-mail"),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                  ),
                  label: Text("Phone"),
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
                title: "Create an account",
                onPressed: () async {
                  bool isVaildated = signUpVaildation(
                      email.text, password.text, name.text, phone.text);
                  if (isVaildated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .signUp(name.text, email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          const CustomBottomBar(),context);
                    }
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const Center(child: Text("I already have an account.")),
              // const SizedBox(
              //   height: 5,
              // ),
              Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Login",
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

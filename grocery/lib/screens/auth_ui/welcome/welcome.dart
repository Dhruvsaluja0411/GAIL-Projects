import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/asset_images.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/screens/auth_ui/login/login.dart';
import 'package:grocery/screens/auth_ui/signup/signup.dart';
import 'package:grocery/widgets/primary_button/primary_button.dart';
import 'package:grocery/widgets/top_title/top_title.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: kTextTabBarHeight + 12,
            // ),
            const TopTitles(title: "Welcome", subtitle: "Buy any items from app"),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 140,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage(AssetsImages.instance.welcomeImage),
                    radius: 135,
                  )),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 35,
                    )),
                const SizedBox(
                  width: 10,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Image.asset(
                    AssetsImages.instance.googleLogo,
                    scale: 28,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            PrimaryButton(title: 'Login',onPressed: (){
              Routes.instance.push(Login(), context);
            },),
            SizedBox(height: 12,),
            PrimaryButton(title: 'Signup',onPressed: (){
              Routes.instance.push(Signup(), context);
            },),
          ],
        ),
      ),
    );
  }
}

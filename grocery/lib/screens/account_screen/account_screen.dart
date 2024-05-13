import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/screens/auth_ui/welcome/welcome.dart';
import 'package:grocery/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:provider/provider.dart';

import '../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import '../../provider/app_provider.dart';
import '../../widgets/primary_button/primary_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(onPressed: (){
      //     FirebaseAuthHelper.instance.signOut();
      //   setState(() {
      //     // Routes.instance.push(Welcome(), context);
      //   });
                      
      //   },child: Text("logout"),),
      // ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                // appProvider.getUserInformation.image == null
                    // ? 
                    const Icon(
                        Icons.person_outline,
                        size: 120,
                      ),
                    // : CircleAvatar(
                  
                      //   backgroundImage:
                      //       NetworkImage(appProvider.getUserInformation.image!),
                      //   radius: 60,
                      // ),
                Text(
                  // appProvider.getUserInformation.name,
                  "User",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  // appProvider.getUserInformation.email,
                  "test@example.com"
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 130,
                  child: PrimaryButton(
                    title: "Edit Profile",
                    onPressed: () {
                      // Routes.instance
                      //     .push(widget: const EditProfile(), context: context);
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    // Routes.instance
                    //     .push(widget: const OrderScreen(), context: context);
                  },
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: const Text("Your Orders"),
                ),
                ListTile(
                  onTap: () {
                    // Routes.instance.push(
                    //     widget: const FavouriteScreen(), context: context);
                  },
                  leading: const Icon(Icons.favorite_outline),
                  title: const Text("Favourite"),
                ),
                ListTile(
                  onTap: () {
                    // Routes.instance
                    //     .push(widget: const AboutUs(), context: context);
                  },
                  leading: const Icon(Icons.info_outline),
                  title: const Text("About us"),
                ),
                ListTile(
                  onTap: () {
                  //   Routes.instance
                  //       .push(widget: const ChangePassword(), context: context);
                  },
                  leading: const Icon(Icons.change_circle_outlined),
                  title: const Text("Change Password"),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuthHelper.instance.signOut();
                    setState(() {
                      // Routes.instance.pushAndRemoveUntil(Welcome(), context);
                      // Navigator.pop(context);
                    });
                  },
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("Log out"),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text("Version 1.0.0")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

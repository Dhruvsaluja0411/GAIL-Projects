import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/theme.dart';
import 'package:grocery/firebase_helper/firebase_option/firebase_options.dart';
import 'package:grocery/provider/app_provider.dart';
import 'package:grocery/screens/auth_ui/welcome/welcome.dart';
import 'package:grocery/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:grocery/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.PlatformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=> AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grocery',
        theme: themeData,
        home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const CustomBottomBar();
              }
              return const Welcome();
            },
          ),
      ),
    );
  }
}


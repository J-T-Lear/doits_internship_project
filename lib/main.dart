//project pages
import 'package:doits_internship_project/loginpage.dart';
// import 'package:doits_internship_project/user-createdocument.dart';
// import 'package:doits_internship_project/user-dashboard.dart';
// import 'package:doits_internship_project/loginpage.dart';
// import 'package:doits_internship_project/admin-usercreatepage.dart';
// import 'package:doits_internship_project/admin-dashboard.dart';
// import 'package:doits_internship_project/admin-usercreatepage.dart';
// import 'package:doits_internship_project/admin-userspage.dart';

//flutter stuff
import 'package:flutter/material.dart';

//firebase stuff
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PEO DoITS',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'PEO'),
    );
  }
}

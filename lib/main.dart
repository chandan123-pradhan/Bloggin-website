import 'package:blog_web/ui/blog_details_page.dart';
import 'package:blog_web/ui/home_page.dart';
import 'package:blog_web/ui/write_blog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb
        ? const FirebaseOptions(
            apiKey: "AIzaSyAyoZWAYDbaGcrvZFXax21-p8DS5CZmBuo",
            authDomain: "bloggingweb-61c8d.firebaseapp.com",
            databaseURL:
                "https://bloggingweb-61c8d-default-rtdb.firebaseio.com",
            projectId: "bloggingweb-61c8d",
            storageBucket: "bloggingweb-61c8d.appspot.com",
            messagingSenderId: "1066189781308",
            appId: "1:1066189781308:web:f70a596bf2b0171097c639",
            measurementId: "G-7QG4TQ7HSY")
        : null,
  );
  // await  Firebase.initializeApp(
  //   // Replace with actual values
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyAyoZWAYDbaGcrvZFXax21",
  //     appId: "1:1066189781308:web:f70a596bf2b0171097c639",
  //     messagingSenderId: "G-7QG4TQ7HSY",
  //     projectId: "bloggingweb-61c8d",
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => HomePage(),
        '/write_blog': (context) => WriteBlog(),
        '/blog_details': (context) {
          return BlogDetailsPage(
       
          );
        }
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomePage()
    );
  }
}

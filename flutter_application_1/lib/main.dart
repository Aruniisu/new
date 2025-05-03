import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'signup.dart';
import 'register.dart';
import 'welcome.dart';
import 'freecourses.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        '/dashboard': (_) => DashboardScreen(),
        '/signup': (_) => SignUpScreen(),
        '/register': (_) => LoginScreen(),
        '/courses': (_) => FreeCoursesScreen(),
      },
    );
  }
}

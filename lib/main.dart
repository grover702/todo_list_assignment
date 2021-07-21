import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_assignment/services/shared_pref_view_model.dart';
import 'package:todo_list_assignment/views/pages/landing/landing_base_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SharedPreferenceProvider()),
      ],
      child: GetMaterialApp(
        title: 'Todo List Assignment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: LandingBasePage(),
      ),
    );
  }
}

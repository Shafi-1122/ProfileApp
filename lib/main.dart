import 'package:avodha_test/services/providers/userdetailsprovider.dart';

import 'package:avodha_test/view/profilepage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserdetailsProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Profile2(),
        ));
  }
}

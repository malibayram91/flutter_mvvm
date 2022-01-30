import 'package:flutter/material.dart';
import 'package:project/models/moviesList/movies_main.dart';
import 'package:project/res/app_context_extension.dart';
import 'package:project/view/details/movie_details_screen.dart';
import 'package:project/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
      ),
      initialRoute: HomeScreen.id,
      title: context.resources.strings.helloString,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        MovieDetailsScreen.id: (context) => MovieDetailsScreen(
            ModalRoute.of(context)!.settings.arguments as Movie),
      },
    );
  }
}

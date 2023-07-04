
import 'package:flutter/material.dart';
import 'package:intro_app/core/di.dart';
import 'package:intro_app/ui/intro_screen.dart';
import 'package:intro_app/ui/intro_screens/provider/page_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BackCover Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PageProvider(),
          )
        ],
        child: Consumer<PageProvider>(
          builder: (context, pageProvider, child) {
            if (pageProvider.isLoading ?? false) {
              return const Center(child: CircularProgressIndicator());
            } else if (pageProvider.isFresher ?? true) {
              return const IntroScreen();
            } else {
              ///homepage
              return const Scaffold(
                body: Center(
                  child: Text('HomePage'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
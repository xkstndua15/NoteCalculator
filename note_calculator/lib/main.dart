import 'package:flutter/material.dart';
import 'package:note_calendar/di/provider_setup.dart';
import 'package:note_calendar/presentation/1.%20main/main_view.dart';
import 'package:provider/provider.dart';
import 'ui/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = await getProviders();

  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: background,
        canvasColor: background,
        floatingActionButtonTheme: Theme.of(context)
            .floatingActionButtonTheme
            .copyWith(backgroundColor: textWhite, foregroundColor: background),
        appBarTheme:
            Theme.of(context).appBarTheme.copyWith(backgroundColor: background),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textWhite),
        bottomNavigationBarTheme:
            Theme.of(context).bottomNavigationBarTheme.copyWith(
                  backgroundColor: bottomNavBar,
                  showSelectedLabels: true,
                  unselectedItemColor: textWhite,
                  selectedItemColor: amber,
                ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 25),
            fixedSize: const Size(100.0, 90.0),
            primary: Colors.grey[800],
            shape: const CircleBorder(),
            elevation: 0,
          ),
        ),
      ),
      home: const MainView(),
    );
  }
}

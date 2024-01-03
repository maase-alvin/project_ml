import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'Theme/theme.dart';
import 'UI/IntroducationScreen.dart';
import 'bloc/theme_change_bloc.dart';
import 'bloc/theme_change_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xFFFFFFFF),
      // Color for Android
      statusBarBrightness: Brightness.dark,
      // Dark == white status bar -- for IOS.
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFFFFFFF),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    // FlutterStatusbarcolor.setStatusBarColor(Color(0xFFFFFFFF));
    // FlutterStatusbarcolor.setNavigationBarColor(Color(0xFFFFFFFF));
    // ignore: missing_required_param
    return BlocProvider<ThemeChangeBloc>(
      create: (_) => ThemeChangeBloc(),
      child: BlocBuilder<ThemeChangeBloc, ThemeChangeState>(
          builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "MyDoc",
          home: IntroducationScreen(),
          themeMode: state.themeState.themeMode,
          darkTheme: darkTheme,
          theme: lightTheme,
        );
      }),
    );
  }
}

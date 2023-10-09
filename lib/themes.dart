import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black12,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black12,
            statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.black12,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor:Colors.black12,
        unselectedItemColor: Colors.grey
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white
        )
    ),
  fontFamily: 'josef',
);
ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor:Colors.white,
        unselectedItemColor: Colors.grey
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black
        )
    ),
  fontFamily: 'josef',
);
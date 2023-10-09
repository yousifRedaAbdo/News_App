//
// import 'package:flutter/material.dart';
// import 'package:training/cache_helper.dart';
// import 'package:training/shop_App/login.dart';
//
// void printFullText(String text)
// {
//   final pattern = RegExp('.{1,800}');
//   pattern.allMatches(text).forEach((match) => print(match.group(0)));
// }
// String? token = '';
// String? uId = '';
//
// void signOut (context)
// {
//   cacheHelper.removeData(Key: 'token').then((value) {
//     if (value)
//       {
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) => LoginScreen(),
//           ),
//               (Route<dynamic> route) => false,
//         );
//       }
//   });
// }
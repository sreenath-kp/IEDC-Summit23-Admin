import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pallete {
  // Colors
  static const backgroundColor = Color(0xFF1F202B);
  static const greyColor = Color.fromRGBO(26, 39, 45, 1);
  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.dmSansTextTheme(),
    scaffoldBackgroundColor: backgroundColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: backgroundColor,
    ),
  );
}

// class Pallete {
//   // Colors
//   static const backgroundColor = Color(0xFF1F202B);
//   static const greyColor = Color.fromRGBO(26, 39, 45, 1);
//   static const whiteColor = Color.fromRGBO(255, 255, 255, 1);

//   // Light Theme
//   static var lightModeAppTheme = ThemeData.light().copyWith(
//     textTheme: GoogleFonts.dmSansTextTheme().copyWith(
//       bodyLarge: const TextStyle(color: Colors.black),
//       bodyMedium: const TextStyle(color: Colors.black),
//       bodySmall: const TextStyle(color: Colors.black),
//     ),
//     scaffoldBackgroundColor: whiteColor, // Light background color
//     cardColor: backgroundColor, // Card color for light theme

//     appBarTheme: const AppBarTheme(
//       backgroundColor: backgroundColor,
//       iconTheme: IconThemeData(
//         color: Color.fromARGB(
//           255,
//           130,
//           130,
//           130,
//         ), // App bar icon color for light theme
//       ),
//     ),

//     buttonTheme: const ButtonThemeData(
//       // Customize button styles for light theme
//       buttonColor: Colors.blue,
//       textTheme: ButtonTextTheme.primary,
//     ),
//     textButtonTheme: TextButtonThemeData(
//       // Customize text button styles for light theme
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//         ),
//         backgroundColor: MaterialStateProperty.all(
//           backgroundColor,
//         ),
//         foregroundColor: MaterialStateProperty.all(
//           const Color.fromARGB(255, 255, 255, 255),
//         ),
//       ),
//     ),

//     iconButtonTheme: const IconButtonThemeData(
//       style: ButtonStyle(
//         iconColor: MaterialStatePropertyAll(Colors.black),
//       ),
//     ),
//   );

//   // Dark Theme
//   static var darkModeAppTheme = ThemeData.dark().copyWith(
//     textTheme: GoogleFonts.dmSansTextTheme().copyWith(
//       bodyLarge: const TextStyle(color: Colors.white),
//       bodyMedium: const TextStyle(color: Colors.white),
//       bodySmall: const TextStyle(color: Colors.white),
//     ),
//     scaffoldBackgroundColor: backgroundColor, // Dark background color
//     cardColor: greyColor, // Card color for dark theme
//     appBarTheme: const AppBarTheme(
//       backgroundColor: backgroundColor,
//       iconTheme: IconThemeData(
//         color: whiteColor, // App bar icon color for dark theme
//       ),
//     ),

//     buttonTheme: const ButtonThemeData(
//       // Customize button styles for dark theme
//       buttonColor: Color.fromARGB(255, 255, 255, 255),
//     ),
//     textButtonTheme: TextButtonThemeData(
//       // Customize text button styles for dark theme
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//         ),
//         backgroundColor: MaterialStateProperty.all(
//           const Color.fromARGB(255, 255, 255, 255),
//         ),
//         foregroundColor: MaterialStateProperty.all(
//           const Color.fromRGBO(0, 0, 0, 1),
//         ),
//       ),
//     ),
//     listTileTheme: const ListTileThemeData().copyWith(textColor: Colors.white),
//   );
// }

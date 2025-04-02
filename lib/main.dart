import 'package:catmo_ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const SignInScreen(),
      theme: ThemeData.light().copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF550703), // "OK" & "CANCEL" buttons
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: Colors.white, // Dialog background color
          headerBackgroundColor: const Color(
            0xFF550703,
          ), // Header background color
          headerForegroundColor: Colors.white, // Header text color
          surfaceTintColor: Colors.transparent, // Removes any overlay color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Dialog shape
          ),
          dayForegroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white; // Selected day text color
            }
            return null; // Default text color
          }),
          dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFF550703); // Selected day background color
            }
            return null; // Default background color
          }),
          todayForegroundColor: WidgetStateProperty.all(Colors.white),
          todayBackgroundColor: WidgetStateProperty.all(Color(0xFF550703)),
          todayBorder: BorderSide(color: Colors.orange),
          yearForegroundColor: WidgetStateProperty.resolveWith<Color?>((
            states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white; // Selected year text color
            }
            return null; // Default text color
          }),
          yearBackgroundColor: WidgetStateProperty.resolveWith<Color?>((
            states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFF550703); // Selected year background color
            }
            return null; // Default background color
          }),
          yearStyle: const TextStyle(fontSize: 16),
          weekdayStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

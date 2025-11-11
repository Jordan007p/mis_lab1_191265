import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'screens/exam_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Intl locale data to prevent LocaleDataException.
  final String deviceLocale = PlatformDispatcher.instance.locale.toString();
  try {
    await initializeDateFormatting(deviceLocale);
    Intl.defaultLocale = deviceLocale;
  } catch (_) {
    // Fallback to en_US if the device locale is not available.
    await initializeDateFormatting('en_US');
    Intl.defaultLocale = 'en_US';
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Schedule',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const ExamListScreen(),
    );
  }
}
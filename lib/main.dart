import 'package:flutter/material.dart';
import 'profile_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Widget',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
      home: const CustomWidgetPage(),
    );
  }
}

class CustomWidgetPage extends StatelessWidget {
  const CustomWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EFF7), // โทนชมพูอ่อนแบบตัวอย่าง
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Custom Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: const ProfileCard(
            name: 'Suwaphat Watthakicharoen',
            role: 'Programmer',
            email: 'suwaphat@gmail.com',
            phone: '0644535827',
            avatarUrl: 'assets/images/Guy.jpg',
            showDemoRibbon: true,
          ),
        ),
      ),
    );
  }
}

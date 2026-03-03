import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ลานวัฒนธรรมดิจิทัล ไฮหย่อง',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Match the brown header color as seed
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8B4513)),
        useMaterial3: true,
        // Match the body background color #f4f4f4
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Function to launch URLs
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using SafeArea to avoid notches and system bars
      body: SafeArea(
        child: Column(
          children: [
            // Header Section (matches <header>)
            Container(
              width: double.infinity,
              color: const Color(0xFF8B4513), // Brown background
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                children: const [
                  Text(
                    'ลานวัฒนธรรมดิจิทัล',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28, // Equivalent to h1
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'เทศบาลตำบลไฮหย่อง อ.พังโคน จ.สกลนคร',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Equivalent to p in header
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Main Content (matches <section>s)
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSection(
                        title: 'รับชมผ่าน YouTube',
                        buttonText: 'ดูคลิป',
                        // Placeholder link - replace with actual link when available
                        onPressed: () => _launchUrl('https://youtube.com'),
                      ),
                      const SizedBox(height: 20),
                      _buildSection(
                        title: 'ติดตาม Facebook',
                        buttonText: 'ติดตามเพจ',
                        // Placeholder link - replace with actual link when available
                        onPressed: () => _launchUrl('https://facebook.com'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer Section (matches <footer>)
            Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              child: const Text(
                'ติดต่อ 042-771680',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build sections
  Widget _buildSection({required String title, required String buttonText, required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24, // Equivalent to h2
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4A017), // Gold/Yellow background
              foregroundColor: Colors.black, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // Slight rounding
              ),
              elevation: 0, // Flat look
            ),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:beautyproducts/Colors/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PrivacyPolicyPage()));
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Appcolor.appcolor, // Matching 'Blopink' theme
        foregroundColor: Appcolor.backcolor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Blopink Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Last Updated: February 20, 2026',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const Divider(height: 30),
            
            _buildSectionTitle('1. Introduction'),
            _buildSectionBody(
              'Welcome to Blopink. Your privacy is important to us. This policy describes how we handle your personal information and protect your data privacy.',
            ),

            _buildSectionTitle('2. Data Collection'),
            _buildSectionBody(
              'We collect information you provide directly to us (like your username and email) and information automatically collected (like your device ID and app usage patterns).',
            ),

            _buildSectionTitle('3. Use of Information'),
            _buildSectionBody(
              'The information collected is used to maintain the app, provide customer support, and improve the user experience of Blopink.',
            ),

            _buildSectionTitle('4. Data Security'),
            _buildSectionBody(
              'We implement industry-standard security measures to protect your data. However, no method of transmission over the internet is 100% secure.',
            ),

            _buildSectionTitle('5. Third-Party Links'),
            _buildSectionBody(
              'Blopink may contain links to other sites. We are not responsible for the privacy practices of those external services.',
            ),

            _buildSectionTitle('6. Contact Us'),
            _buildSectionBody(
              'If you have questions about this policy, reach out to us at support@blopink.com.',
            ),

            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () => Navigator.pop(context),
                child: const Text('I Understand', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
      ),
    );
  }

  Widget _buildSectionBody(String body) {
    return Text(
      body,
      style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
    );
  }
}
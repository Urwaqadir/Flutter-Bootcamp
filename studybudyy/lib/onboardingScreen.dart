import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Import your login screen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _current = 0;

  // *** ONLY TWO PAGES ***
  final List<Map<String, String>> pages = [
    {
      'image': 'assets/logo1.png',
      'title': 'Numerous free trial courses',
      'desc': 'Free courses for you to find your way to learning',
    },
    {
      'image': 'assets/logo3.png',
      'title': 'Quick and easy learning',
      'desc':
          'Easy and fast learning at any time to help you improve various skills',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: pages.length,
          onPageChanged: (i) => setState(() => _current = i),
          itemBuilder: (_, i) => _OnboardingPage(
            image: pages[i]['image']!,
            title: pages[i]['title']!,
            desc: pages[i]['desc']!,
            showButtons: i == pages.length - 1,
          ),
        ),
      ),
      // dot indicators
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pages.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _current == i ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _current == i ? Colors.blue : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class _OnboardingPage extends StatelessWidget {
  final String image, title, desc;
  final bool showButtons;

  const _OnboardingPage({
    required this.image,
    required this.title,
    required this.desc,
    required this.showButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // skip button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              ),
              child: const Text('Skip'),
            ),
          ),
          const SizedBox(height: 24),
          Image.asset(image, height: 250),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const Spacer(),
          if (showButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Sign up', style: TextStyle(color: Colors.white),),
                ),
                ElevatedButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,                     // blue fill
    foregroundColor: Colors.white,                   // white text/ripple
    padding: const EdgeInsets.symmetric(
        horizontal: 36, vertical: 14),
  ),
  child: const Text('Log in'),
),
              ],
            ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

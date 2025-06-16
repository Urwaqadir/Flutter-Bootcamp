import 'package:flutter/material.dart';
import 'courseDetailPage.dart'; // Import your course details page

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _current = 0;

  final _pages = const [
    HomeScreen(),
    CourseScreen(),
    Placeholder(), // Search tab
    Placeholder(), // Message tab
    Placeholder(), // Account tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_current],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => _current = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Course'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}

/// ─────────────────────────────  Home  ────────────────────────────────
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _learningPlanTile(String title, String progress) {
    return ListTile(
      leading: const Icon(Icons.refresh, color: Colors.grey),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Text(progress, style: const TextStyle(color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        toolbarHeight: 0, // we’ll build our own header below
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Greeting Header ───────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
              decoration: const BoxDecoration(
                color: Color(0xFF2F6CFF),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Hi, Kristin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 23,
                        backgroundImage: AssetImage('assets/profileLogo.png'),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),

                  const Text(
                    "Let's start learning",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  // learned‑today card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Learned today',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: const TextSpan(
                            text: '46min ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: '/ 60min',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: 46 / 60,
                            minHeight: 6,
                            color: Colors.orange,
                            backgroundColor: Colors.grey.shade300,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'My courses',
                              style: TextStyle(color: Color(0xFF2F6CFF)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── What do you want to learn ────────────────────────────
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFFE1F0FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'What do you want to learn today?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2F6CFF),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Get Started'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          // ← NEW
                          image: AssetImage(
                            'assets/bannerPic.png',
                          ), //   put your file here
                          fit: BoxFit.cover, //   cover, contain, etc.
                        ),

                        // Optional fallback color while the image loads:
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Learning plan ─────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Learning Plan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _learningPlanTile('AI Development', '40/48'),
                  const Divider(height: 1),
                  _learningPlanTile('Flutter Coding Course', '6/24'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ─────────────────────────────  Course  ───────────────────────────────
class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int _chipIndex = 0;
  int _tabIndex = 0;

  final _categories = ['Language', 'Painting', 'Design', 'Coding'];
  final _tabs = ['All', 'Popular', 'New'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Find Your Courses',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('assets/profileLogo.png'),
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // ── Search bar ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find Course',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // ── Horizontal category list ───────────────────────────────
          SizedBox(
            height: 50,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder:
                  (_, i) => GestureDetector(
                    onTap: () => setState(() => _chipIndex = i),
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color:
                            i == _chipIndex
                                ? const Color(0xFFB0CDFF)
                                : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          _categories[i],
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
            ),
          ),

          // ── Tab chips (All/Popular/New) ────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Row(
              children: List.generate(
                _tabs.length,
                (i) => Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ChoiceChip(
                    label: Text(_tabs[i]),
                    selected: _tabIndex == i,
                    onSelected: (_) => setState(() => _tabIndex = i),
                  ),
                ),
              ),
            ),
          ),

          // ── Course list ────────────────────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _courseTile(
                  'AI Development',
                  'Robertson Connie',
                  '\$190',
                  '16 hours',
                  'assets/AI.png',

                ),
                _courseTile(
                  'Java Development',
                  'Nguyen Shane',
                  '\$190',
                  '16 hours',
                  'assets/Java.png',

                ),
                _courseTile(
                  'Pyhton Development',
                  'Bert Pullman',
                  '\$250',
                  '14 hours',
                  'assets/Python.png',

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _courseTile(
    String title,
    String author,
    String price,
    String duration,
    String img, // ← NEW
  ) {
    return GestureDetector(
      onTap: () {
        if (title == 'AI Development') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CourseDetailsPage()),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(img, width: 60, height: 60, fit: BoxFit.cover),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Text(author),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

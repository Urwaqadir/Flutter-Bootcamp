import 'package:flutter/material.dart';
import 'successfulPage.dart'; // Import the success page

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEDF2),
      body: SafeArea(
        child: Column(
          children: [
            // Header with background image
            Container(
              height: 220,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/AI.png'),
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.contain, // You can also try BoxFit.cover
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.volume_off,color: Colors.white),
                      Icon(Icons.bookmark_border,color: Colors.white,),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'BESTSELLER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'AI Development',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Course Info
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Product Design v1.0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "\$74.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "6h 14min · 24 Lessons",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    // About
                    const Text(
                      "About this course",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // Lessons
                    const LessonItem(
                      number: '01',
                      title: 'Welcome to the Course',
                      time: '6:10 mins',
                      isLocked: false,
                    ),
                    const LessonItem(
                      number: '02',
                      title: 'Process overview',
                      time: '6:10 mins',
                      isLocked: false,
                    ),
                    const LessonItem(
                      number: '03',
                      title: 'Discovery',
                      time: '6:10 mins',
                      isLocked: true,
                    ),
                    const Spacer(),

                    // Buy Button
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.star_border),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SuccessPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonItem extends StatelessWidget {
  final String number;
  final String title;
  final String time;
  final bool isLocked;

  const LessonItem({
    super.key,
    required this.number,
    required this.title,
    required this.time,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        number,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      title: Text(title),
      subtitle: Text(time),
      trailing: CircleAvatar(
        backgroundColor: isLocked ? Colors.grey.shade300 : Colors.blue,
        child: Icon(
          isLocked ? Icons.lock : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }
}

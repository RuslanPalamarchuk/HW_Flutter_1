import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: List.generate(100, (index) {
            currentIndex = index;
            return Container(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.9,
                      child: FractionalTranslation(
                        translation: Offset(0.0, -0.08),
                        child: Image.asset(
                          'images/lake.jpg',
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: buttonSection,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: SizedBox(
                      width: 65,
                      height: 65,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black87,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '#${currentIndex.toString()}.',
                          style: const TextStyle(
                            fontFamily: 'Mulish',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 16,
                    right: 16,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Container(
                        height: 115,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Oeschinen Lake Campground',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Kandersteg, Switzerland',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  '41',
                                  style: TextStyle(
                                    fontFamily: 'Mulish',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          ),
        ),
      ),
    );
  }
}

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Padding(
      padding: const EdgeInsets.only(right: 4, left: 8),
      child: _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 4, right: 8),
      child: _buildButtonColumn(Colors.black87, Icons.share, 'SHARE'),
    ),
  ],
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    ],
  );
}

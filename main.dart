import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<MyData> myList = [
    MyData(
        title: 'Task 1',
        subtitle: 'Practice with Eren Yeager',
        time: '12:30',
        color: const Color.fromARGB(255, 22, 142, 240)),
    MyData(
        title: 'Task 2',
        subtitle: 'Practice with Mikasa Ackerman',
        time: '15:30',
        color: const Color.fromARGB(255, 230, 146, 20)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '1302204038 - Luthfan Ramdhan Wahyudi',
      home: Scaffold(
        body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyDetailPage(myData: myList[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 30, backgroundColor: myList[index].color),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myList[index].title,
                              style:
                                  const TextStyle(fontSize: 24, color: Color.fromARGB(255, 17, 130, 223)),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyData {
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  MyData({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });
}

class MyDetailPage extends StatelessWidget {
  final MyData myData;

  const MyDetailPage({Key? key, required this.myData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myData.title,
              style: const TextStyle(fontSize: 25, color: Color.fromARGB(255, 24, 125, 208)),
            ),
            const SizedBox(height: 3),
            Text(
              myData.subtitle,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 3),
            Text(
              myData.time,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

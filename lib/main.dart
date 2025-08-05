import 'package:flutter/material.dart';

void main() {
  runApp(const MyResume());
}

class MyResume extends StatelessWidget {
  const MyResume({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ResumeHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResumeHomePage extends StatelessWidget {
  const ResumeHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            // รูปโปรไฟล์วงกลม
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 54, 27, 101),
                  width: 2,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/image/new.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ชื่อ-นามสกุล
            const Text(
              'นาย สันติภาพ ศรีสุข',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            // ข้อมูลส่วนตัว
            const InfoRow(
              icon: Icons.location_on,
              label: 'ภูมิลำเนา',
              value: 'จังหวัดกำแพงเพชร',
            ),
            const InfoRow(
              icon: Icons.theaters,
              label: 'งานอดิเรก',
              value: 'เล่นเกม, ฟังเพลง , ดูหนัง',
            ),
            const SizedBox(height: 32),
            // ประวัติการศึกษา
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '🎓 ประวัติการศึกษา',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const EducationItem(
              level: 'ประถมศึกษา',
              school: 'โรงเรียนวัดคูยาง',
              year: '2554',
            ),
            const EducationItem(
              level: 'มัธยมศึกษาตอนต้น',
              school: 'โรงเรียนกำแพงเพชรพิทยาคม',
              year: '2555',
            ),
            const EducationItem(
              level: 'มัธยมศึกษาตอนปลาย',
              school: 'โรงเรียนกำแพงเพชรพิทยาคม',
              year: '2558',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color.fromARGB(255, 25, 102, 168), size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text('$label: $value', style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String level;
  final String school;
  final String year;
  const EducationItem({
    super.key,
    required this.level,
    required this.school,
    required this.year,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.school,
              color: Color.fromARGB(255, 60, 13, 67),
              size: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 38, 102, 161),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(school, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                    'จบปี $year',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

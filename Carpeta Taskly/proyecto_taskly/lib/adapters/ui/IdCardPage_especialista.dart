import 'package:flutter/material.dart';

class IdCardPageEspecialista extends StatelessWidget {
  static const String routeName = 'IdCardPageEspecialista';

  const IdCardPageEspecialista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ID CARD',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'ID',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'ID Card (front)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF7F5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_a_photo,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ID Card (back)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF7F5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_a_photo,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff159a9c),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

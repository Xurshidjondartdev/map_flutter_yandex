import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(int currentIndex, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: const Center(
        child: Text('Detail Page'),
      ),
    );
  }
}
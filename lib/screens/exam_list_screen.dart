import 'package:flutter/material.dart';

import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatefulWidget {
  const ExamListScreen({super.key});

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  late List<Exam> _sorted;

  @override
  void initState() {
    super.initState();
    _sorted = List<Exam>.from(staticExams);
    _sorted.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  void _navigateToDetail(Exam exam) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 191265'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _sorted.length,
              itemBuilder: (context, index) {
                final exam = _sorted[index];
                return ExamCard(
                  exam: exam,
                  onTap: () => _navigateToDetail(exam),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.lightBlue.shade50,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.list, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      'Вкупно испити: ${_sorted.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
}
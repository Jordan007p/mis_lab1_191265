import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool past = exam.isPast();
    final dateFmt = DateFormat('MMM dd, yyyy', 'mk');
    final timeFmt = DateFormat('HH:mm');

    final Color bgColor = past ? Colors.grey.shade200 : Colors.white;
    final Color borderColor = past ? Colors.grey.shade400 : Colors.blue;

    final borderRadius = BorderRadius.circular(12);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: borderColor, width: 1.2),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 18, color: past ? Colors.grey : Colors.blue),
                  const SizedBox(width: 8),
                  Text(dateFmt.format(exam.dateTime)),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.access_time, size: 18, color: past ? Colors.grey : Colors.orange),
                  const SizedBox(width: 8),
                  Text(timeFmt.format(exam.dateTime)),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.meeting_room, size: 18, color: past ? Colors.grey : Colors.green),
                  const SizedBox(width: 8),
                  Expanded(child: Text(exam.rooms.join(', '))),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: past ? Colors.grey.shade400 : Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    past ? 'ЗАВРШЕН' : 'ПРЕДСТОИ',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
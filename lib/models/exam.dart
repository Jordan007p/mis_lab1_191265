class Exam {
  final String subject;
  final DateTime dateTime;
  final List<String> rooms;

  const Exam({
    required this.subject,
    required this.dateTime,
    required this.rooms,
  });

  bool isPast() => dateTime.isBefore(DateTime.now());

  /// Returns remaining time to the exam as a map with keys 'days' and 'hours'.
  /// Values may be negative if the exam is in the past.
  Map<String, int> getTimeRemaining() {
    final now = DateTime.now();
    final diff = dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours - days * 24;
    return {'days': days, 'hours': hours};
  }
}

/// Static hardcoded list of exams (10+ items) with mixed past (2024) and future (2025)
/// including a few in December 2024.
final List<Exam> staticExams = [
  // Past exams (2024)
  Exam(
    subject: 'Мобилни информатички системи',
    dateTime: DateTime(2024, 6, 15, 10, 0),
    rooms: ['А1'],
  ),
  Exam(
    subject: 'Бази на податоци',
    dateTime: DateTime(2024, 7, 3, 12, 30),
    rooms: ['Лаб 2', 'АУД 3'],
  ),
  Exam(
    subject: 'Веб програмирање',
    dateTime: DateTime(2024, 9, 20, 9, 0),
    rooms: ['АУД 1'],
  ),
  // December 2024 (explicit past styling tests)
  Exam(
    subject: 'Алгоритми и податочни структури',
    dateTime: DateTime(2024, 12, 10, 14, 0),
    rooms: ['АУД 2'],
  ),
  Exam(
    subject: 'Оперативни системи',
    dateTime: DateTime(2024, 12, 18, 11, 0),
    rooms: ['Лаб 1'],
  ),
  Exam(
    subject: 'Компјутерски мрежи',
    dateTime: DateTime(2024, 12, 22, 16, 0),
    rooms: ['АУД 5'],
  ),
  // Mixed 2025 (some may be past relative to current date, include late 2025 for future)
  Exam(
    subject: 'Инженерство на софтвер',
    dateTime: DateTime(2025, 1, 25, 10, 0),
    rooms: ['АУД 4'],
  ),
  Exam(
    subject: 'Калкулус',
    dateTime: DateTime(2025, 3, 2, 8, 30),
    rooms: ['АМФ'],
  ),
  Exam(
    subject: 'Вештачка интелигенција',
    dateTime: DateTime(2025, 6, 12, 13, 0),
    rooms: ['АУД 2', 'Лаб 3'],
  ),
  // Future late 2025
  Exam(
    subject: 'Дистрибуирани системи',
    dateTime: DateTime(2025, 12, 5, 9, 0),
    rooms: ['АУД 3'],
  ),
  Exam(
    subject: 'Интернет на нештата',
    dateTime: DateTime(2025, 12, 12, 15, 30),
    rooms: ['Лаб 4'],
  ),
  Exam(
    subject: 'Безбедност на информации',
    dateTime: DateTime(2025, 12, 20, 10, 0),
    rooms: ['АУД 1', 'АУД 2'],
  ),
  // One more in early 2026 to ensure a future exam regardless of current date
  Exam(
    subject: 'Cloud Computing',
    dateTime: DateTime(2026, 1, 15, 9, 45),
    rooms: ['АУД 6'],
  ),
];
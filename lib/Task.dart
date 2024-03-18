import 'package:shared_preferences/shared_preferences.dart';

class Task {
  String title;
  DateTime date;

  Task({required this.title, required this.date});

  static List<Task> fromSharedPreferences(SharedPreferences prefs) {
    List<String>? titles = prefs.getStringList('taskTitles');
    List<String>? dates = prefs.getStringList('taskDates');
    if (titles == null || dates == null) {
      return [];
    }
    return List.generate(titles.length, (index) {
      return Task(title: titles[index], date: DateTime.parse(dates[index]));
    });
  }

  static Future<void> saveListToSharedPreferences(
      SharedPreferences prefs, List<Task> tasks) async {
    List<String> titles = tasks.map((task) => task.title).toList();
    List<String> dates =
        tasks.map((task) => task.date.toIso8601String()).toList();
    await prefs.setStringList('taskTitles', titles);
    await prefs.setStringList('taskDates', dates);
  }

  Future<void> saveToSharedPreferences(SharedPreferences prefs) async {
    List<Task> existingTasks = fromSharedPreferences(prefs);
    existingTasks.add(this);
    await saveListToSharedPreferences(prefs, existingTasks);
  }
}


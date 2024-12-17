import 'package:calendar/view/data_picker_screen.dart';
import 'package:calendar/view/time_picker_screen.dart';
import 'package:flutter/material.dart';

class DateTimePickerScreen extends StatelessWidget {
  final ValueNotifier<TimeOfDay> _timeNotifier = ValueNotifier(TimeOfDay.now());
  final ValueNotifier<DateTime> _dateNotifier = ValueNotifier(DateTime.now());

  DateTimePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time & Date Picker'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimePickerWidget(timeNotifier: _timeNotifier),
            const SizedBox(height: 20),
            DatePickerWidget(dateNotifier: _dateNotifier),
          ],
        ),
      ),
    );
  }
}

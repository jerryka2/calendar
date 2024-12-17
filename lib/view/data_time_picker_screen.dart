import 'package:calendar/view/data_picker_screen.dart';
import 'package:calendar/view/time_picker_screen.dart';
import 'package:flutter/material.dart';

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  _DateTimePickerScreenState createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  // ignore: unused_field
  TimeOfDay _currentTime = TimeOfDay.now();
  // ignore: unused_field
  DateTime _currentDate = DateTime.now();

  void _updateTime(TimeOfDay newTime) {
    setState(() {
      _currentTime = newTime;
    });
  }

  void _updateDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time & Date Picker'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimePickerWidget(onTimeSelected: _updateTime),
            SizedBox(height: 20),
            DatePickerWidget(onDateSelected: _updateDate),
          ],
        ),
      ),
    );
  }
}

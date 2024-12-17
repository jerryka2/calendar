import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;

  const TimePickerWidget({super.key, required this.onTimeSelected});

  @override
  // ignore: library_private_types_in_public_api
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
      widget.onTimeSelected(_selectedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Time: ${_selectedTime.format(context)}",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _pickTime,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text("Change Time"),
        ),
      ],
    );
  }
}

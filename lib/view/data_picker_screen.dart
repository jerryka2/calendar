import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({super.key, required this.onDateSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
      widget.onDateSelected(_selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _pickDate,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text("Change Date"),
        ),
      ],
    );
  }
}

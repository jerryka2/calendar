import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final ValueNotifier<DateTime> dateNotifier;

  const DatePickerWidget({required this.dateNotifier, super.key});

  void _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dateNotifier.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateNotifier.value = pickedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<DateTime>(
          valueListenable: dateNotifier,
          builder: (context, date, _) {
            return Text(
              "Date: ${date.day}/${date.month}/${date.year}",
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _pickDate(context),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text("Change Date"),
        ),
      ],
    );
  }
}

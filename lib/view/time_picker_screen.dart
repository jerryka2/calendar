import 'package:flutter/material.dart';

class TimePickerWidget extends StatelessWidget {
  final ValueNotifier<TimeOfDay> timeNotifier;

  const TimePickerWidget({required this.timeNotifier, super.key});

  void _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: timeNotifier.value,
    );

    if (pickedTime != null) {
      timeNotifier.value = pickedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<TimeOfDay>(
          valueListenable: timeNotifier,
          builder: (context, time, _) {
            return Text(
              "Time: ${time.format(context)}",
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _pickTime(context),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text("Change Time"),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '🚀 Загружаю...',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Gap(16),
        CircularProgressIndicator(strokeWidth: 2),
      ],
    ));
  }
}

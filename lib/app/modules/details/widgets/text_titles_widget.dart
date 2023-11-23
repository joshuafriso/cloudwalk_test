import 'package:cloudwalk_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextTitlesWidget extends StatelessWidget {
  final String text;
  const TextTitlesWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18,
            color: AppColors.primary,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:cloudwalk_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingDefautlWidget extends StatelessWidget {
  const LoadingDefautlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColors.primary));
  }
}

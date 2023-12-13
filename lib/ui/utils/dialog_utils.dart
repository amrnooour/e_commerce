import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const AlertDialog(
          content: Row(
            children: [
              Text(
                "Loading...",
                style: TextStyle(color: AppColors.primaryColor),
              ),
              Spacer(),
              CircularProgressIndicator(),
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Error",
            style: TextStyle(color: AppColors.primaryColor),
          ),
          content: Text(
            errorMessage,
            style: TextStyle(color: AppColors.blackColor),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"))
          ],
        );
      });
}
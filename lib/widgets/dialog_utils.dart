
import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';

import '../utils/app_styles.dart';


class DialogUtils {
  /// Shows a loading dialog with a circular progress indicator and a loading text.
  /// The dialog is not dismissible by tapping outside.
  static void showLoading({
    required BuildContext context,
    required String loadingText,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(color: AppColors.yellow),
            SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  loadingText,
                  style: AppStyles.regular16black,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Hides the currently displayed loading dialog.
  /// It is assumed that a loading dialog is currently being shown.
  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  /// Shows a message dialog with a title, message, and optional positive and negative actions.
  /// The dialog can be dismissed by tapping outside if `barrierDismissible` is true
  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
    bool barrierDismissible = true,
  }) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () => posAction?.call(),
          child: Text(posActionName, style: AppStyles.regular16black),
        ),
      );

      if (negActionName != null) {
        actions.add(
          TextButton(
            onPressed: () {
              negAction?.call();
              Navigator.pop(context);
            },
            child: Text(negActionName, style: AppStyles.regular16black),
          ),
        );
      }
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message, style: AppStyles.regular16black),
        title: Text(title ?? "", style: AppStyles.regular16black),
        actions: actions,
      ),
    );
  }
}

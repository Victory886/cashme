/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-27 11:08:16
 * @FilePath: /loannow/lib/utils/dialog_utils.dart
 */
import 'package:flutter/material.dart';
import 'package:loannow/config/app_colors.dart';

class DialogUtils {
  static showCustomerDialog({
    required BuildContext context,
    String? title,
    String? content,
    String? cancel,
    String? confirm,
    VoidCallback? cancelClick,
    VoidCallback? confirmClick,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: (title == null)
              ? null
              : Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.textColor),
                  ),
                ),
          content: (content == null)
              ? null
              : Text(
                  content,
                  style:
                      const TextStyle(fontSize: 14, color: AppColors.textColor),
                ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: [
            InkWell(
              onTap: () {
                if (cancelClick != null) {
                  cancelClick!();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  cancel ?? "Cancel",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff7F74EF)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (confirmClick != null) {
                  confirmClick!();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  confirm ?? "Confirm",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.mainColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

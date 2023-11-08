/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-07 13:35:40
 * @FilePath: /loannow/lib/widget/button.dart
 */
import 'package:flutter/material.dart';
import 'package:loannow/config/app_colors.dart';

class Button extends StatefulWidget {
  late String text;
  late VoidCallback onClick;
  bool? disabled;

  Button({Key? key, required this.text, required this.onClick, this.disabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: InkWell(
        onTap: () {
          if (!(widget.disabled ?? false)) {
            widget.onClick();
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: (widget.disabled ?? false)
                ? const Color(0xffcccccc)
                : AppColors.mainColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          height: 45,
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

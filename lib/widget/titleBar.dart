import 'package:flutter/material.dart';
import 'package:loannow/config/app_colors.dart';

class TitleBar extends StatefulWidget {
  String title = "";
  VoidCallback? leftClick;
  String? leftImage;
  Color? bgColor;
  Color? textColor;
  VoidCallback? rightClick;
  String? rightImage;

  TitleBar({
    Key? key,
    required this.title,
    this.leftClick,
    this.leftImage,
    this.bgColor,
    this.textColor,
    this.rightClick,
    this.rightImage,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TitleBarState();
  }
}

class TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: widget.bgColor ?? Colors.white),
        child: SafeArea(
            child: Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE9E9E9), width: 0.5, style: BorderStyle.solid))),
                height: 45,
                child: Stack(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                          onTap: () {
                            if (widget.leftClick != null)
                              widget.leftClick!();
                            else
                              Navigator.pop(context);
                            // widget.leftClick ?? Navigator.pop(context);
                          },
                          child: Container(
                              padding: EdgeInsets.all(13),
                              child: Image.asset(
                                widget.leftImage ?? "images/ic_back.png",
                              )))),
                  Center(
                    child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        child: Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: widget.textColor ?? AppColors.textColor),
                        )),
                  ),
                  if (widget.rightImage != null)
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: () {
                              if (widget.rightClick != null) widget.rightClick!();
                            },
                            child: Container(
                                padding: EdgeInsets.all(13),
                                child: Image.asset(
                                  widget.rightImage!,
                                )))),
                ]))));
  }
}

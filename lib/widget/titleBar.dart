/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-13 14:33:58
 * @FilePath: /loannow/lib/widget/titleBar.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loannow/config/app_colors.dart';

class TitleBar extends StatefulWidget {
  String title = "";
  VoidCallback? leftClick;
  String? leftImage;
  Color? bgColor;
  Color? textColor;
  VoidCallback? rightClick;
  String? rightImage;

  /// 是否显示返回按钮
  bool? isShowBackBtn = true;
  bool? isShowNaviBottomLine = true;

  TitleBar({
    Key? key,
    required this.title,
    this.leftClick,
    this.leftImage,
    this.bgColor,
    this.textColor,
    this.rightClick,
    this.rightImage,
    this.isShowBackBtn,
    this.isShowNaviBottomLine,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TitleBarState();
  }
}

class TitleBarState extends State<TitleBar> {
  Widget _navBackWiget() {
    return widget.isShowBackBtn ?? true
        ? InkWell(
            highlightColor: Colors.white,
            splashColor: Colors.transparent,
            onTap: () {
              if (widget.leftClick != null) {
                widget.leftClick!();
              } else {
                Navigator.pop(context);
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Image.asset(
                widget.leftImage ?? "images/ic_back.png",
                width: 40,
                height: 20,
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: widget.textColor ?? AppColors.textColor,
        ),
      ),
      elevation: (widget.isShowNaviBottomLine ?? true) ? 0.3 : 0,
      leading: _navBackWiget(),
      backgroundColor: widget.bgColor ?? Colors.white,
      actions: [
        if (widget.rightImage != null)
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                if (widget.rightClick != null) widget.rightClick!();
              },
              child: Container(
                padding: const EdgeInsets.all(13),
                child: Image.asset(widget.rightImage!),
              ),
            ),
          ),
      ],
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}

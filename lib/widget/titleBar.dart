/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-07 18:25:00
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
    // 手动设置状态栏颜色
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // 设置状态栏颜色
      statusBarIconBrightness: Brightness.light, // 设置状态栏时间和电池图标的颜色为深色
    ));

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
      // )
      // Container(
      //   decoration: BoxDecoration(color: widget.bgColor ?? Colors.white),

      //   child: SafeArea(
      //     child: Container(
      //       decoration: const BoxDecoration(
      //         border: Border(
      //           bottom: BorderSide(
      //             color: Color(0xFFE9E9E9),
      //             width: 0.5,
      //             style: BorderStyle.solid,
      //           ),
      //         ),
      //       ),
      //       height: 44,
      //       child: Stack(
      //         children: [
      // if (widget.ishowBackBtn ?? true)
      //   Align(
      //     alignment: Alignment.centerLeft,
      //     child: InkWell(
      //       onTap: () {
      //         if (widget.leftClick != null) {
      //           widget.leftClick!();
      //         } else {
      //           Navigator.pop(context);
      //         }
      //         // widget.leftClick ?? Navigator.pop(context);
      //       },
      //       child: Container(
      //         padding: const EdgeInsets.all(13),
      //         child: Image.asset(
      //           widget.leftImage ?? "images/ic_back.png",
      //           // fit: BoxFit.fitWidth,
      //         ),
      //       ),
      //     ),
      //   ),
      //           Center(
      //             child: Container(
      //               alignment: Alignment.center,
      //               width: 200,
      //               child: Text(
      //                 widget.title,
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      // style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: widget.textColor ?? AppColors.textColor),
      //               ),
      //             ),
      //           ),
      // if (widget.rightImage != null)
      //   Align(
      //     alignment: Alignment.centerRight,
      //     child: InkWell(
      //       onTap: () {
      //         if (widget.rightClick != null) widget.rightClick!();
      //       },
      //       child: Container(
      //         padding: const EdgeInsets.all(13),
      //         child: Image.asset(widget.rightImage!),
      //       ),
      //     ),
      //   ),
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}

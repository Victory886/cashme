import 'package:flutter/material.dart';
import 'package:loannow/beans/loan_history_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/application_status_utils.dart';
import 'package:loannow/utils/format_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/widget/titleBar.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HistorypageState();
  }
}

class HistorypageState extends State<HistoryPage> {
  late StateSetter listSetter;
  List<LoanHistoryBean> mList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TitleBar(title: "History"),
          Expanded(child: StatefulBuilder(
            builder: (contex, setState) {
              listSetter = setState;
              if (mList.length == 0) {
                return Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        FractionallySizedBox(
                            widthFactor: 0.4, child: AspectRatio(aspectRatio: 1 / 1, child: Image.asset("images/img_history_empty.png"))),
                        Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Text(
                              "No history record",
                              style: TextStyle(fontSize: 14, color: AppColors.textColorhint),
                            ))
                      ],
                    ));
              }
              return ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: mList.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 0.5,
                      color: AppColors.dividerColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    var item = mList[index];
                    var img = "images/img_history_evaluating.png";
                    var textColor = Color(0xff40BBFA);
                    if (ApplicationStatusUtils.isClose(item.status!)) {
                      img = "images/img_history_evaluating.png";
                      textColor = Color(0xff1BE3B3);
                    } else if (ApplicationStatusUtils.isRefuse(item.status!) ||
                        ApplicationStatusUtils.isRollback(item.status!) ||
                        ApplicationStatusUtils.isAbandon(item.status!) ||
                        ApplicationStatusUtils.isCancel(item.status!)) {
                      img = "images/img_history_cancel.png";
                      textColor = Color(0xffF94D3F);
                    }
                    return Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset(
                              img,
                              width: 33,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          "NO.${item.id}",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.textColorLight),
                                        )),
                                        Text("${FormatUtils.formatAmount(item.loanAmount)}P",
                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: AppColors.textColorLight))
                                      ],
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          "${FormatUtils.formatDate(item.applicationTime!)}",
                                          style: TextStyle(fontSize: 12, color: AppColors.textColorhint),
                                        )),
                                        Text("${item.statusDesc}", style: TextStyle(fontSize: 12, color: textColor))
                                      ],
                                    ))
                              ],
                            ))
                          ],
                        ));
                  });
            },
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    OperationUtils.saveOperation('/history');
    getData();
  }

  void getData() {
    DioManager.getInstance().doRequest<List<LoanHistoryBean>>(
        path: Urls.APPLICATION_HISTORY,
        method: DioMethod.GET,
        successCallBack: (result) {
          mList.addAll(result ?? []);
          listSetter(() {});
        });
  }
}

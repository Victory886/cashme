// ignore_for_file: non_constant_identifier_names

class ApplicationStatusUtils {
  static var ApplicationExamineStatus = [ApplicationStatus.APPLYING.status, ApplicationStatus.FIRST_EXAMINE.status, ApplicationStatus.REEXAMINE.status];

  static var ApplicationRefuseStatus = [
    ApplicationStatus.REFUSEED.status,
    ApplicationStatus.REFUSEEDEXPIRE.status,
  ];

  static var ApplicationRollbackStatus = [
    ApplicationStatus.ROLLBACK.status,
    ApplicationStatus.ROLLBACK_RELOAN.status,
  ];

  static var ApplicationAbandonStatus = [
    ApplicationStatus.CANCELLED.status,
    ApplicationStatus.USERABANDONING.status,
    ApplicationStatus.USERABANDON.status,
    ApplicationStatus.USERABANDONEXPIRE.status,
  ];

  static var ApplicationPassStatus = [ApplicationStatus.PASSED.status, ApplicationStatus.LOAN_STATUS_PAY_FAIL.status];

  static var ApplicationWithdrawalsStatus = [
    ApplicationStatus.WITHDRAW.status,
    ApplicationStatus.PAYSUCEE.status,
  ];

  static var ApplicationRepayStatus = [
    ApplicationStatus.REPAYING.status,
    ApplicationStatus.PRE_COLLECTION.status,
    ApplicationStatus.COLLECTION.status,
  ];

  static var ApplicationOverdueStatus = [ApplicationStatus.COLLECTION.status];

  static var ApplicationCloseStatus = [ApplicationStatus.CLOSED.status, ApplicationStatus.EXCEPTION_CLOSED.status];

  static var ApplicationCancelStatus = [ApplicationStatus.CANCELLED.status];

  static var ApplicationReduceAmount = [ApplicationStatus.REDUCE_AMOUNT.status];

  static var ApplicationFinishStatus = [
    ApplicationStatus.CLOSED.status,
    ApplicationStatus.EXCEPTION_CLOSED.status,
    ApplicationStatus.CANCELLED.status,
    ApplicationStatus.REFUSEED.status,
    ApplicationStatus.REFUSEEDEXPIRE.status,
    ApplicationStatus.ROLLBACK.status,
    ApplicationStatus.ROLLBACK_RELOAN.status,
    ApplicationStatus.USERABANDON.status,
    ApplicationStatus.USERABANDONEXPIRE.status,
  ];

  static bool isExamine(int status) {
    return ApplicationExamineStatus.contains(status);
  }

  static bool isRefuse(int status) {
    return ApplicationRefuseStatus.contains(status);
  }

  static bool isRollback(int status) {
    return ApplicationRollbackStatus.contains(status);
  }

  static bool isAbandon(int status) {
    return ApplicationAbandonStatus.contains(status);
  }

  static bool isPass(int status) {
    return ApplicationPassStatus.contains(status);
  }

  static bool isWithdrawal(int status) {
    return ApplicationWithdrawalsStatus.contains(status);
  }

  static bool isRepay(int status) {
    return ApplicationRepayStatus.contains(status);
  }

  static bool isClose(int status) {
    return ApplicationCloseStatus.contains(status);
  }

  static bool isNormalClose(int status) {
    return status == ApplicationStatus.CLOSED;
  }

  static bool isExceptionClose(int status) {
    return status == ApplicationStatus.EXCEPTION_CLOSED;
  }

  static bool isFinish(int status) {
    return ApplicationFinishStatus.contains(status);
  }

  static bool isOverdue(int status) {
    return ApplicationOverdueStatus.contains(status);
  }

  static bool isCancel(int status) {
    return ApplicationCancelStatus.contains(status);
  }

  static bool isReduceAmount(int status) {
    return ApplicationReduceAmount.contains(status);
  }
}

enum ApplicationStatus {
  APPLYING(2), //预审
  FIRST_EXAMINE(16), //初审
  REEXAMINE(17), //复审
  LOAN_STATUS_PAY_FAIL(18), //付款失败

  REFUSEED(5), //拒绝
  REFUSEEDEXPIRE(7), //拒绝到期

  ROLLBACK(4), //回退
  ROLLBACK_RELOAN(22), //回退已复借

  PASSED(3), //通过

  PAYSUCEE(6), //待取款
  WITHDRAW(12), //待取款(已取款),

  CANCELLED(23), //取消
  USERABANDONING(13), //放弃中
  USERABANDON(14), //已放弃
  USERABANDONEXPIRE(15), //放弃已到期

  CLOSED(10), //正常结束状态
  EXCEPTION_CLOSED(11), //异常结束，逾期等

  REPAYING(19), //还款中
  PRE_COLLECTION(20), //预催收
  COLLECTION(21), //催收
  REDUCE_AMOUNT(24); //降额订单

  final int status;

  const ApplicationStatus(this.status);
}

import 'package:mwani/screens/employee/requests/business_travel/business_travel.dart';
import 'package:mwani/screens/employee/requests/cash_advance/cash_advance.dart';
import 'package:mwani/screens/employee/requests/disciplinary_action/disciplinary_action.dart';
import 'package:mwani/screens/employee/requests/excuse_hours/excuse_hours.dart';
import 'package:mwani/screens/employee/requests/grievance/grievance.dart';
import 'package:mwani/screens/employee/requests/learning_&_develeopment/learning_development.dart';
import 'package:mwani/screens/employee/requests/leave_encashments/leave_encashment.dart';
import 'package:mwani/screens/employee/requests/location/location.dart';
import 'package:mwani/screens/employee/requests/maternity_leave/maternity_leave.dart';
import 'package:mwani/screens/employee/requests/mission/mission.dart';
import 'package:mwani/screens/employee/requests/overtime/overtime.dart';
import 'package:mwani/screens/employee/requests/pending_requests/pending_request.dart';
import 'package:mwani/screens/employee/requests/pre_overtime_approval/pre_overtime_approval.dart';
import 'package:mwani/screens/employee/requests/resignation/resignation.dart';
import 'package:mwani/screens/employee/requests/vacation_bonus/vacation_bonus.dart';

class RequestModel {
  String? title;
  String? icon;
  String? page;

  RequestModel({
    this.title,
    this.icon,
    this.page,
  });

  void setTitle(String cardTitle) {
    title = cardTitle;
  }

  void setIcon(String cardIcon) {
    icon = cardIcon;
  }

  void setPage(String navigateTo) {
    page = navigateTo;
  }

  String? getTitle() {
    return title;
  }

  String? getIcon() {
    return icon;
  }

  String? getPage() {
    return page;
  }
}

List<RequestModel> getAllReq() {
  List<RequestModel> allReq = [];
  RequestModel? reqModel = RequestModel();

  //1
  reqModel.setTitle("Pre Overtime Approval");
  reqModel.setIcon('assets/images/common/overtime.png');
  reqModel.setPage(PreOverTimeApprovalScreen.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //2
  reqModel.setTitle("Overtime");
  reqModel.setIcon('assets/images/common/overtime.png');
  reqModel.setPage(OverTimeScreen.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //3
  reqModel.setTitle("Excuse Hours");
  reqModel.setIcon('assets/images/common/overtime.png');
  reqModel.setPage(ExcuseHours.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //4
  reqModel.setTitle("Mission");
  reqModel.setIcon('assets/images/common/mission.png');
  reqModel.setPage(Mission.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //5
  reqModel.setTitle("Location");
  reqModel.setIcon('assets/images/common/location_request.png');
  reqModel.setPage(Location.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //6
  reqModel.setTitle("Vacation Bonus");
  reqModel.setIcon('assets/images/common/encash.png');
  reqModel.setPage(VacationBonus.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //7
  reqModel.setTitle("Business Travel");
  reqModel.setIcon('assets/images/common/plane.png');
  reqModel.setPage(BusinessTravel.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //8
  reqModel.setTitle("Resignation");
  reqModel.setIcon('assets/images/common/resignation.png');
  reqModel.setPage(Resignation.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //9
  reqModel.setTitle("Leave Encashment");
  reqModel.setIcon('assets/images/common/money.png');
  reqModel.setPage(LeaveEncashment.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //10
  reqModel.setTitle("Learning & Development");
  reqModel.setIcon('assets/images/common/development.png');
  reqModel.setPage(LearningDevelopment.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //11
  reqModel.setTitle("Cash Advance");
  reqModel.setIcon('assets/images/common/money.png');
  reqModel.setPage(CashAdvance.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //12
  reqModel.setTitle("Disciplinary Action");
  reqModel.setIcon('assets/images/common/action.png');
  reqModel.setPage(DisciplinaryAction.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //13
  reqModel.setTitle("Grievance");
  reqModel.setIcon('assets/images/common/order.png');
  reqModel.setPage(Grievance.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //14
  reqModel.setTitle("Maternity Leave");
  reqModel.setIcon('assets/images/common/calender_family.png');
  reqModel.setPage(MaternityLeave.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  //15
  reqModel.setTitle("Pending Requests");
  reqModel.setIcon('assets/images/common/pending.png');
  reqModel.setPage(PendingRequest.routeName);
  allReq.add(reqModel);
  reqModel = RequestModel();

  return allReq;
}
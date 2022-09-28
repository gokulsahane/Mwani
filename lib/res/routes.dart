import 'package:flutter/material.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/screens/auth/lang_prefs.dart';
import 'package:mwani/screens/auth/log_in.dart';
import 'package:mwani/screens/dash/employee_dash.dart';
import 'package:mwani/screens/employee/allowances/allowances.dart';
import 'package:mwani/screens/employee/allowances/education_allowances/education_allowance_request.dart';
import 'package:mwani/screens/employee/allowances/furniture_allowances/furniture_allowance_request.dart';
import 'package:mwani/screens/employee/contact_us/contact_us.dart';
import 'package:mwani/screens/employee/hr_letters/hr_letter.dart';
import 'package:mwani/screens/employee/hr_letters/hr_letter_request.dart';
import 'package:mwani/screens/employee/leaves/entitlement_balance.dart';
import 'package:mwani/screens/employee/leaves/leave_details.dart';
import 'package:mwani/screens/employee/leaves/leave_request.dart';
import 'package:mwani/screens/employee/leaves/leaves.dart';
import 'package:mwani/screens/employee/loan/loan_details.dart';
import 'package:mwani/screens/employee/loan/loan_details_report.dart';
import 'package:mwani/screens/employee/loan/loan_request.dart';
import 'package:mwani/screens/employee/payslip/payslip.dart';
import 'package:mwani/screens/employee/payslip/payslip_detailed.dart';
import 'package:mwani/screens/employee/permit/exit_permit.dart';
import 'package:mwani/screens/employee/permit/exit_permit_request.dart';
import 'package:mwani/screens/employee/profile/my_info/absence_info.dart';
import 'package:mwani/screens/employee/profile/my_info/employment_info.dart';
import 'package:mwani/screens/employee/profile/my_info/job_application_info.dart';
import 'package:mwani/screens/employee/profile/personal_info/basic_details.dart';
import 'package:mwani/screens/employee/profile/personal_info/dependents/dependent_information.dart';
import 'package:mwani/screens/employee/profile/personal_info/dependents/update_information.dart';
import 'package:mwani/screens/employee/profile/personal_info/prev_emp.dart';
import 'package:mwani/screens/employee/profile/profile.dart';
import 'package:mwani/screens/employee/requests/business_travel/business_travel.dart';
import 'package:mwani/screens/employee/requests/business_travel/business_travel_details.dart';
import 'package:mwani/screens/employee/requests/business_travel/business_travel_request.dart';
import 'package:mwani/screens/employee/requests/cash_advance/cash_advance.dart';
import 'package:mwani/screens/employee/requests/cash_advance/cash_advance_request.dart';
import 'package:mwani/screens/employee/requests/disciplinary_action/disciplinary_action.dart';
import 'package:mwani/screens/employee/requests/disciplinary_action/disciplinary_action_request.dart';
import 'package:mwani/screens/employee/requests/excuse_hours/excuse_hours.dart';
import 'package:mwani/screens/employee/requests/excuse_hours/excuse_hours_request.dart';
import 'package:mwani/screens/employee/requests/grievance/grievance.dart';
import 'package:mwani/screens/employee/requests/grievance/grievance_request.dart';
import 'package:mwani/screens/employee/requests/learning_&_develeopment/learning_development.dart';
import 'package:mwani/screens/employee/requests/learning_&_develeopment/learning_development_request.dart';
import 'package:mwani/screens/employee/requests/leave_encashments/leave_encashment.dart';
import 'package:mwani/screens/employee/requests/leave_encashments/leave_encashment_request.dart';
import 'package:mwani/screens/employee/requests/location/location.dart';
import 'package:mwani/screens/employee/requests/location/location_request.dart';
import 'package:mwani/screens/employee/requests/maternity_leave/maternity_leave.dart';
import 'package:mwani/screens/employee/requests/maternity_leave/maternity_leave_request.dart';
import 'package:mwani/screens/employee/requests/mission/mission.dart';
import 'package:mwani/screens/employee/requests/mission/mission_request.dart';
import 'package:mwani/screens/employee/requests/overtime/overtime.dart';
import 'package:mwani/screens/employee/requests/overtime/overtime_request.dart';
import 'package:mwani/screens/employee/requests/pending_requests/pending_request.dart';
import 'package:mwani/screens/employee/requests/pre_overtime_approval/pre_overtime_approval.dart';
import 'package:mwani/screens/employee/requests/pre_overtime_approval/pre_overtime_request.dart';
import 'package:mwani/screens/employee/requests/resignation/resignation.dart';
import 'package:mwani/screens/employee/requests/resignation/resignation_detail.dart';
import 'package:mwani/screens/employee/requests/vacation_bonus/vacation_bonus.dart';
import 'package:mwani/screens/employee/requests/vacation_bonus/vacation_bonus_request.dart';
import 'package:mwani/screens/employee/self_service/attendance_report.dart';
import 'package:mwani/screens/employee/self_service/employee_promotion.dart';
import 'package:mwani/screens/employee/self_service/self_service.dart';
import 'package:mwani/screens/employee/self_service/subordinate_basic_info.dart';
import 'package:mwani/screens/employee/timecard/timecard.dart';
import 'package:mwani/screens/employee/travel/add_passport.dart';
import 'package:mwani/screens/employee/travel/air_fare_request.dart';
import 'package:mwani/screens/employee/travel/dependent_passport.dart';
import 'package:mwani/screens/employee/travel/manage_travel.dart';
import 'package:mwani/screens/init/home.dart';
import 'package:mwani/screens/splash/splash.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    String path = settings.name!;
    switch (path) {
      case SplashScreen.routeName:
        return PageTransition(
            child: const SplashScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case AuthHomeScreen.routeName:
        return PageTransition(
            child: const AuthHomeScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case LanguageSelectionScreen.routeName:
        return PageTransition(
            child: const LanguageSelectionScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case LogInScreen.routeName:
        return PageTransition(
            child: const LogInScreen(),
            settings: settings,
            type: PageTransitionType.rightToLeft);
      case EmployeeDashBoard.routeName:
        return PageTransition(
            child: const EmployeeDashBoard(),
            settings: settings,
            type: PageTransitionType.fade);
      case BasicDetailScreen.routeName:
        return PageTransition(
            child: const BasicDetailScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case DependentInfoScreen.routeName:
        return PageTransition(
            child: const DependentInfoScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case UpdateDependent.routeName:
        return PageTransition(
            child: const UpdateDependent(),
            settings: settings,
            type: PageTransitionType.fade);
      case Employment.routeName:
        return PageTransition(
            child: const Employment(),
            settings: settings,
            type: PageTransitionType.fade);
      case AbsenceInformation.routeName:
        return PageTransition(
            child: const AbsenceInformation(),
            settings: settings,
            type: PageTransitionType.fade);
      case JobApplicationScreen.routeName:
        return PageTransition(
            child: const JobApplicationScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case PreviousEmploymentScreen.routeName:
        return PageTransition(
            child: const PreviousEmploymentScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case Payslip.routeName:
        return PageTransition(
            child: const Payslip(),
            settings: settings,
            type: PageTransitionType.fade);
      case PayslipDetailed.routeName:
        return PageTransition(
            child: const PayslipDetailed(),
            settings: settings,
            type: PageTransitionType.fade);
      case Profile.routeName:
        return PageTransition(
            child: const Profile(),
            settings: settings,
            type: PageTransitionType.fade);
      case LeaveDetails.routeName:
        return PageTransition(
            child: const LeaveDetails(),
            settings: settings,
            type: PageTransitionType.fade);
      case LeaveRequest.routeName:
        return PageTransition(
            child: const LeaveRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case EntitlementBalanceScreen.routeName:
        return PageTransition(
            child: const EntitlementBalanceScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case ExitPermit.routeName:
        return PageTransition(
            child: const ExitPermit(),
            settings: settings,
            type: PageTransitionType.fade);
      case ExitPermitRequest.routeName:
        return PageTransition(
            child: const ExitPermitRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case Allowances.routeName:
        return PageTransition(
            child: const Allowances(),
            settings: settings,
            type: PageTransitionType.fade);
      case EducationAllowanceRequest.routeName:
        return PageTransition(
            child: const EducationAllowanceRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case FurnitureAllowanceRequest.routeName:
        return PageTransition(
            child: const FurnitureAllowanceRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case HRLetter.routeName:
        return PageTransition(
            child: const HRLetter(),
            settings: settings,
            type: PageTransitionType.fade);
      case HRLetterRequest.routeName:
        return PageTransition(
            child: const HRLetterRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case LoanDetails.routeName:
        final args = settings.arguments as ScreenArguments;
        return PageTransition(
            child: LoanDetails(screenArguments: args),
            settings: settings,
            type: PageTransitionType.fade);
      case LoanRequest.routeName:
        return PageTransition(
            child: const LoanRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case LoanDetailsReport.routeName:
        return PageTransition(
            child: const LoanDetailsReport(),
            settings: settings,
            type: PageTransitionType.fade);
      case PreOverTimeApprovalScreen.routeName:
        return PageTransition(
            child: const PreOverTimeApprovalScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case OverTimeScreen.routeName:
        return PageTransition(
            child: const OverTimeScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case PreOverTimeRequestScreen.routeName:
        return PageTransition(
            child: const PreOverTimeRequestScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case OverTimeRequestScreen.routeName:
        return PageTransition(
            child: const OverTimeRequestScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case ExcuseHours.routeName:
        return PageTransition(
            child: const ExcuseHours(),
            settings: settings,
            type: PageTransitionType.fade);
      case ExcuseHoursRequest.routeName:
        return PageTransition(
            child: const ExcuseHoursRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case Mission.routeName:
        return PageTransition(
            child: const Mission(),
            settings: settings,
            type: PageTransitionType.fade);
      case MissionRequest.routeName:
        return PageTransition(
            child: const MissionRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case Location.routeName:
        return PageTransition(
            child: const Location(),
            settings: settings,
            type: PageTransitionType.fade);
      case LocationRequest.routeName:
        return PageTransition(
            child: const LocationRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case MaternityLeave.routeName:
        return PageTransition(
            child: const MaternityLeave(),
            settings: settings,
            type: PageTransitionType.fade);
      case MaternityLeaveRequest.routeName:
        return PageTransition(
            child: const MaternityLeaveRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case Grievance.routeName:
        return PageTransition(
            child: const Grievance(),
            settings: settings,
            type: PageTransitionType.fade);
      case GrievanceRequest.routeName:
        return PageTransition(
            child: const GrievanceRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case CashAdvance.routeName:
        return PageTransition(
            child: const CashAdvance(),
            settings: settings,
            type: PageTransitionType.fade);
      case ManageTravel.routeName:
        return PageTransition(
            child: const ManageTravel(),
            settings: settings,
            type: PageTransitionType.fade);
      case AirFareRequest.routeName:
        return PageTransition(
            child: const AirFareRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case DependentPassport.routeName:
        return PageTransition(
            child: const DependentPassport(),
            settings: settings,
            type: PageTransitionType.fade);
      case AddPassport.routeName:
        return PageTransition(
            child: const AddPassport(),
            settings: settings,
            type: PageTransitionType.fade);
      case TimeCard.routeName:
        return PageTransition(
            child: const TimeCard(),
            settings: settings,
            type: PageTransitionType.fade);
      case ContactUs.routeName:
        return PageTransition(
            child: const ContactUs(),
            settings: settings,
            type: PageTransitionType.fade);
      case ManagerSelfService.routeName:
        return PageTransition(
            child: const ManagerSelfService(),
            settings: settings,
            type: PageTransitionType.fade);
      case Leaves.routeName:
        return PageTransition(
            child: const Leaves(),
            settings: settings,
            type: PageTransitionType.fade);
      case SubordinateInfo.routeName:
        return PageTransition(
            child: const SubordinateInfo(),
            settings: settings,
            type: PageTransitionType.fade);
      case EmployeePromotion.routeName:
        return PageTransition(
            child: const EmployeePromotion(),
            settings: settings,
            type: PageTransitionType.fade);
      case AttendanceReport.routeName:
        return PageTransition(
            child: const AttendanceReport(),
            settings: settings,
            type: PageTransitionType.fade);
      case VacationBonus.routeName:
        return PageTransition(
            child: const VacationBonus(),
            settings: settings,
            type: PageTransitionType.fade);
      case VacationBonusRequest.routeName:
        return PageTransition(
            child: const VacationBonusRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case PendingRequest.routeName:
        return PageTransition(
            child: const PendingRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case DisciplinaryAction.routeName:
        return PageTransition(
            child: const DisciplinaryAction(),
            settings: settings,
            type: PageTransitionType.fade);
      case CashAdvanceRequest.routeName:
        return PageTransition(
            child: const CashAdvanceRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case BusinessTravel.routeName:
        return PageTransition(
            child: const BusinessTravel(),
            settings: settings,
            type: PageTransitionType.fade);
      case BusinessTravelDetails.routeName:
        return PageTransition(
            child: const BusinessTravelDetails(),
            settings: settings,
            type: PageTransitionType.fade);
      case BusinessTravelRequest.routeName:
        return PageTransition(
            child: const BusinessTravelRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case ResignationDetail.routeName:
        return PageTransition(
            child: const ResignationDetail(),
            settings: settings,
            type: PageTransitionType.fade);
      case Resignation.routeName:
        return PageTransition(
            child: const Resignation(),
            settings: settings,
            type: PageTransitionType.fade);
      case LeaveEncashment.routeName:
        return PageTransition(
            child: const LeaveEncashment(),
            settings: settings,
            type: PageTransitionType.fade);
      case LeaveEncashmentRequest.routeName:
        return PageTransition(
            child: const LeaveEncashmentRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case LearningDevelopment.routeName:
        return PageTransition(
            child: const LearningDevelopment(),
            settings: settings,
            type: PageTransitionType.fade);
      case LearningDevelopmentRequest.routeName:
        return PageTransition(
            child: const LearningDevelopmentRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      case DisciplinaryActionRequest.routeName:
        return PageTransition(
            child: const DisciplinaryActionRequest(),
            settings: settings,
            type: PageTransitionType.fade);
      default:
        return PageTransition(
            child: const SplashScreen(),
            settings: settings,
            type: PageTransitionType.fade);
    }
  }
}

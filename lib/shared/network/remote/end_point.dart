import 'package:departments/shared/constant/constant.dart';

// ********** Auth **********
String loginUrl = '${baseUrl}login';
String logoutUrl = '${baseUrl}logout';

// ********** Appointments **********
String getCalenderPatientUrl = '${baseUrl}appointments/get-calander-patient';
String getCalenderDoctorUrl = '${baseUrl}appointments/get-calander-doctor';
String getPatientEventsByDateUrl = '${baseUrl}appointments/get-events-patient';
String getDoctorEventsByDateUrl = '${baseUrl}appointments/get-events-doctor';
String getPatientAppointmentsUrl =
    '${baseUrl}appointments/get-appointments-patient';
String getDoctorAppointmentsUrl =
    '${baseUrl}appointments/get-appointments-doctor';
String getPatientReportsUrl = '${baseUrl}appointments/get-reports-patient';
String getDoctorReportsUrl = '${baseUrl}appointments/get-reports-doctor';
String deleteAppointmentUrl = '${baseUrl}appointments/cancel';
String getAvailableTimeUrl = '${baseUrl}doctors/get-available-apps';
String getAvailableDateUrl = '${baseUrl}doctors/get-available-dates';
String bookAppointmentUrl = '${baseUrl}appointments/book';
String getSingleReportUrl = '${baseUrl}appointments/get-report';

// ********** Profile **********
String getGeneralProfileUrl = '${baseUrl}profile';
String getDoctorProfileUrl = '${baseUrl}profile/doctor';
String getPatientProfileUrl = '${baseUrl}profile/patient';
String editProfileUrl = '${baseUrl}profile/edit-patient';

// ********** Doctor **********
String getAllDoctorUrl = '${baseUrl}doctors/get-all';
String getSingleClinicUrl = '${baseUrl}doctors/get-doctors';
String getDoctorClinicUrl = '${baseUrl}clinics/get-my-clinic';
String getSingleDoctorUrl = '${baseUrl}doctors/get-doctor';
String getCertificatesDoctorUrl = '${baseUrl}certificates/get-all';
String getWorkingTimesDoctorUrl = '${baseUrl}employees/get-working-times';
String setRatingDoctorUrl = '${baseUrl}ratings/set';
String getMyPatientsUrl = '${baseUrl}patients/get-patients';

// ********** Departments **********
String getAllDepartmentsUrl = '${baseUrl}departments/get-all';

// ********** Blog **********
String isBlogActiveUrl = '${baseUrl}blog/is-active';
String getMyPostsUrl = '${baseUrl}blog/get-my-posts';
String getLastPostUrl = '${baseUrl}blog/get-last';
String getPostsByIdUrl = '${baseUrl}blog/get-posts';
String addPostUrl = '${baseUrl}blog/add';
String getSinglePostUrl = '${baseUrl}blog/get-post';
String putLikeUrl = '${baseUrl}blog/like';
String getBlogDepartmentsUrl = '${baseUrl}blog/get-departments';
String deletePostUrl = '${baseUrl}blog/delete';
String editPostUrl = '${baseUrl}blog/edit';

// ********** Notification **********
String isThereNotificationsUrl = '${baseUrl}notifications/isThere';
String getAllNotificationsUrl = '${baseUrl}notifications/get-all';
String deleteNotificationUrl = '${baseUrl}notifications/delete';

String getClinicsByIdUrl = '${baseUrl}clinics/get-clinics';
String sendReportUrl = '${baseUrl}setting/send-report';
String sendMalfunctionUrl = '${baseUrl}setting/send-malfunction';

//*********** Search ***********
String searchDepartmentsUrl = '${baseUrl}departments/search';
String searchBlogDepartmentsUrl = '${baseUrl}blog/search/departments';
String searchPostDepartmentsUrl = '${baseUrl}blog/search/departments';
String searchDoctorsUrl = '${baseUrl}doctors/search';
String searchComplaintsUrl = '${baseUrl}setting/search-malfunctions';
String searchClinicDepartmentsUrl = '${baseUrl}clinics/search';

//************ Settings *********
String changeLanguageUrl = '${baseUrl}setting/change-lang';

//************ Reset Password ********
String sendEmailUrl = '${baseUrl}forget-password';
String sendCodeUrl = '${baseUrl}check-code';
String sendResetPasswordUrl = '${baseUrl}reset-password';

//************* Complaints *********
String getMyMalfunctionsUrl = '${baseUrl}setting/get-malfunctions';
String getLastComplaintUrl = '${baseUrl}setting/get-last';

//************ Patient *************
String getLastPatientUrl = '${baseUrl}waitings/get-last';
String getSinglePatientUrl = '${baseUrl}patients/get-patient';

//************ Nurse ************
String getSingleNurseUrl = '${baseUrl}nurses/get-nurse';
String getCertificatesNurseUrl = '${baseUrl}certificates/get-all';
String getWorkingTimesNurseUrl = '${baseUrl}employees/get-working-times';

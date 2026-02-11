import 'package:flutter/material.dart';
import 'package:pfeproject/core/routing/Routes.dart';
import 'package:pfeproject/features/profile/presentation/view/ProfileScreen.dart';
import 'package:pfeproject/features/profile/presentation/view/EditProfileScreen.dart';
import 'package:pfeproject/features/profile/presentation/view/ChangePasswordScreen.dart';
import 'package:pfeproject/features/doctor/Home/CurrentPatients.dart';
import 'package:pfeproject/features/doctor/onboarding/OnboardinDoctorThree.dart';
import 'package:pfeproject/features/doctor/onboarding/OnboardinOneDoctor.dart';
import 'package:pfeproject/features/doctor/onboarding/OnboardingDoctor.dart';
import 'package:pfeproject/features/patient/Home/presentation/view/PatientHome.dart';
import 'package:pfeproject/features/patient/InsulineMesure/presentation/view/InsulineMesure.dart';
import 'package:pfeproject/features/auth/presentation/view/DoctorSignUp.dart';
import 'package:pfeproject/features/auth/presentation/view/LoginScreen.dart';
import 'package:pfeproject/features/auth/presentation/view/PatientLogin.dart';
import 'package:pfeproject/features/auth/presentation/view/infoThree.dart';
import 'package:pfeproject/features/auth/presentation/view/infoTwo.dart';
import 'package:pfeproject/features/onboarding/presentation/view/Onboarding.dart';
import 'package:pfeproject/features/onboarding/presentation/view/patientOnboarding.dart';

import '../../features/doctor/Home/DoctorHome.dart';
import '../../features/auth/presentation/view/DoctorLogin.dart';
import '../../features/auth/presentation/view/infoFour.dart';

class AppRouter {
  AppRouter() {}

  Route<dynamic>? generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingOne:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case Routes.patirentOnboarding:
        return MaterialPageRoute(builder: (_) => const Patientonboarding());
      case Routes.patientLogin:
        return MaterialPageRoute(builder: (_) => const Patientlogin());
      case Routes.patientRegister:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.patientInfoTwo:
        return MaterialPageRoute(builder: (_) => const InfoTwoScreen());
      case Routes.patientInfoThree:
        return MaterialPageRoute(builder: (_) => const InfoThreeScreen());
      case Routes.patientInfoFour:
        return MaterialPageRoute(builder: (_) => const InfoFourScreen());
      case Routes.patinetHome:
        return MaterialPageRoute(builder: (_) => const PatientHome());
      case Routes.insulineMesure:
        return MaterialPageRoute(builder: (_) => const InsulineMesureScreen());
      case Routes.onboardiDoctorOne:
        return MaterialPageRoute(builder: (_) => const OnboardingOneDoctor());
      case Routes.onboarindDocotrtwo:
        return MaterialPageRoute(builder: (_) => const OnboardinDoctor());
      case Routes.doctorLogin:
        return MaterialPageRoute(builder: (_) => const Doctorlogin());
      case Routes.doctorSignUp:
        return MaterialPageRoute(builder: (_) => const DoctorSignUp());            
      case Routes.onboardinDoctorThree:
        return MaterialPageRoute(builder: (_) => const OnboardinDoctorThree());
      case Routes.doctorHome:
         return MaterialPageRoute(builder: (_) => const Doctorhome());    
      case Routes.currentPatintes: 
      return MaterialPageRoute(builder: (_) => const Currentpatients());                    
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.editProfile:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(initialProfile: (args is Map<String, dynamic>) ? args : const {}),
        );
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text(
                    'No Route Defined',
                    style: TextStyle(color: Colors.black),
                  ),
                ));
    }
  }

  Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (_) => const Center(
              child: Text(
                'No Route Defined',
                style: TextStyle(color: Colors.black),
              ),
            ));
  }
}


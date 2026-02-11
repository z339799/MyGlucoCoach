import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/patient/Home/presentation/view/PatientHome.dart';
import 'package:pfeproject/features/auth/presentation/view/LoginScreen.dart';
import 'package:pfeproject/features/auth/presentation/viewmodel/AuthCubit/AuthCubit.dart';
import 'package:pfeproject/features/onboarding/presentation/view/widgets/customButton.dart';
import '../../../patient/InsulineMesure/presentation/view/widgets/CustomAppBar.dart';

class Patientlogin extends StatefulWidget {
  const Patientlogin({super.key});

  @override
  State<Patientlogin> createState() => _PatientloginState();
}

class _PatientloginState extends State<Patientlogin> {
  bool obsecureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Custombg(
          widget: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(children: [
                    const CustomAppBar(),
                    verticalBox(24),
                    Text(
                      'مرحبا بكم في واجهة المرضى',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    verticalBox(16),
                    Text(
                      'الرجاء ادخال معلوماتك',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    verticalBox(48),
                    CustomInputTitle(
                      title: 'البريد الالكتروني',
                      obsecureText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    verticalBox(24),
                    CustomInputTitle(
                      title: 'كلمة المرور',
                      obsecureText: obsecureText,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      suffixIcon: Icons.visibility,
                      onPressed: () {
                        setState(() {
                          obsecureText = !obsecureText;
                        });
                      },
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 250.w,
                      child: BlocBuilder<AuthCubit, Authstate>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blueAccent,
                              ),
                            );
                          } else if (state is AuthFailed) {
                            return Center(
                              child: Text(state.message),
                            );
                          } else if (state is AuthSuccess) {
                            return Center(
                                child: Text(
                              'تم التسجيل بنجاح',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ));
                          } else {
                            return CustomButton(
                              title: 'تسجيل الدخول',
                              onTap: () {
                                context.read<AuthCubit>().login(
                                    emailController.text,
                                    passwordController.text);
                                context.pushReplacement(FadeSlidePageTransition(
                                    page: const PatientHome()));
                              },
                            );
                          }
                        },
                      ),
                    )
                  ])))),
    ));
  }
}


import 'package:pfeproject/core/helper/sharedPrefrences.dart';
import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/patient/InsulineMesure/presentation/view/widgets/CustomAppBar.dart';
import 'package:pfeproject/features/auth/presentation/view/DiabetesType.dart';
import 'package:pfeproject/features/auth/presentation/viewmodel/AuthCubit/AuthCubit.dart';
import 'package:pfeproject/features/onboarding/presentation/view/widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isRememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dispName = TextEditingController();
  TextEditingController d = TextEditingController();
  bool obsecureText = true;
  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
    d.dispose();
    dispName.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Custombg(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(),
                  verticalBox(24),
                  Text(
                    'مرحبا بكم في واجهة المرضى',
                    style: (Theme.of(context).textTheme.headlineLarge ?? const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)).copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  verticalBox(12),
                  Text(
                    'الرجاء ادخال المعلومات المناسبة',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  verticalBox(32),
                  CustomInputTitle(
                    title: 'اسم و لقب المربض',
                    keyboardType: TextInputType.text,
                    obsecureText: false,
                    controller: dispName,
                  ),
                  verticalBox(16),
                  CustomInputTitle(
                    title: 'البريد الالكتروني',
                    keyboardType: TextInputType.emailAddress,
                    obsecureText: false,
                    controller: emailController,
                  ),
                  verticalBox(16),
                  const CustomInputTitle(
                    title: 'رقم الهاتف',
                    keyboardType: TextInputType.phone,
                    obsecureText: false,
                  ),
                  verticalBox(16),
                  CustomInputTitle(
                    title: 'كلمة المرور',
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obsecureText: obsecureText,
                    suffixIcon: Icons.remove_red_eye_outlined,
                    onPressed: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                  ),
                  verticalBox(16),
                  SwitchListTile(
                    contentPadding: const EdgeInsets.only(right: 0),
                    activeColor: Colors.blueAccent,
                    inactiveThumbColor: Theme.of(context).colorScheme.tertiary,
                    value: _isRememberMe,
                    onChanged: (value) {
                      setState(() {
                        _isRememberMe = value;
                      });
                    },
                    title: Text(
                        'انا لست مصاب بمرض السكري لكني اقوم بالاعتناءبهذا المرض',
                        maxLines: 2,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  BlocBuilder<AuthCubit, Authstate>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ));
                      } else if (state is AuthFailed) {
                        return Center(
                            child: Text(
                          state.message,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ));
                      }  else {
                        return CustomButton(
                          title: 'تسجيل الدخول',
                          onTap: () {
                            context.read<AuthCubit>().signUpPatient(
                                  emailController.text,
                                  passwordController.text,
                                  dispName.text
                                );
                           

                            context.pushReplacement(
                              FadeSlidePageTransition(page: const DiabetesType())
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInputTitle extends StatelessWidget {
  const CustomInputTitle({
    super.key,
    required this.title,
    this.controller,
    required this.obsecureText,
    required this.keyboardType,
    this.suffixIcon,
    this.onPressed,
  });
  final String title;
  final TextEditingController? controller;
  final bool obsecureText;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        verticalBox(8),
        CustomTextField(
          obsecureText: obsecureText,
          keyboardType: keyboardType,
          controller: controller,
          suffixIcon: suffixIcon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.obsecureText,
      required this.keyboardType,
      this.suffixIcon,
      this.onPressed});
  final TextEditingController? controller;
  final bool obsecureText;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      keyboardType: keyboardType,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        prefixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  suffixIcon,
                  color: Colors.blueAccent,
                ),
              )
            : null,
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSurface,
        focusColor: Colors.blueAccent,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blueAccent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blueAccent)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blueAccent)),
      ),
    );
  }
}

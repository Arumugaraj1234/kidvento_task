import 'package:flutter/material.dart';
import 'package:kidvento_task/app/enumerations.dart';
import 'package:kidvento_task/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:kidvento_task/presentation/custom_widgets/password_text_form_field.dart';
import 'package:kidvento_task/presentation/resources/assets_manager.dart';
import 'package:kidvento_task/presentation/resources/colors_manager.dart';
import 'package:kidvento_task/presentation/resources/fonts_style_manager.dart';
import 'package:kidvento_task/presentation/resources/route_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';
import 'package:kidvento_task/presentation/signup/signup_viewmodel.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _otpTextEditingController = TextEditingController();
  final _otpFocusNode = FocusNode();

  final _loginEmailIdTextEditingController = TextEditingController();
  final _loginEmailFocusNode = FocusNode();
  final _loginPasswordTextEditingController = TextEditingController();
  final _loginPasswordFocusNode = FocusNode();

  bool _isLoginPasswordObscure = true;

  final _viewModel = SignUpViewModel();

  _bind() {
    _viewModel.init();
  }

  _dispose() {
    _viewModel.dispose();
    _loginEmailIdTextEditingController.dispose();
    _loginEmailFocusNode.dispose();
    _loginPasswordTextEditingController.dispose();
    _loginPasswordFocusNode.dispose();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backGround), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
                key: _formKey,
                child: Center(
                  child: SizedBox(
                    width: AppSizes.s300,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: AppSizes.s60,
                        ),
                        Center(child: Image.asset(AppImages.appIcon)),
                        const SizedBox(
                          height: AppSizes.s20,
                        ),
                        ToggleSwitch(
                          minWidth: AppSizes.s120,
                          minHeight: AppSizes.s40,
                          cornerRadius: AppSizes.s8,
                          activeBgColors: [
                            [AppColors.primary],
                            [AppColors.primary],
                          ],
                          activeFgColor: AppColors.white,
                          inactiveBgColor: AppColors.grey,
                          inactiveFgColor: AppColors.black,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          labels: const [AppStrings.login, AppStrings.signUp],
                          radiusStyle: true,
                          onToggle: (index) {
                            FormType type =
                                index == 0 ? FormType.login : FormType.signUp;
                            _viewModel.setFormType(type);
                          },
                        ),
                        const SizedBox(
                          height: AppSizes.s20,
                        ),
                        StreamBuilder<FormType>(
                            stream: _viewModel.outputFormType,
                            builder: (context, snapshot) {
                              FormType type = snapshot.data ?? FormType.signUp;
                              return type == FormType.signUp
                                  ? _signUpForm(context)
                                  : _loginForm(context);
                            })
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget _signUpForm(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            _otpTextEditingController,
            _otpFocusNode,
            TextInputType.number,
            TextCapitalization.none,
            TextInputAction.done,
            AppStrings.enterOtpHint,
            AppImages.keyIcon, (String val) {
          FocusScope.of(context).requestFocus(FocusNode());
        }),
        const SizedBox(
          height: AppSizes.s20,
        ),
        InkWell(
          onTap: () {
            //todo: Resend Otp integration
          },
          child: Text(
            AppStrings.resendOtp,
            style: getRegularTextStyle(fontSize: FontSize.f15),
          ),
        ),
        const SizedBox(
          height: AppSizes.s20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false);
            },
            child: const Text(AppStrings.signUp)),
        const SizedBox(
          height: AppSizes.s20,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: AppStrings.signUpInstruction,
                style: getRegularTextStyle()),
            TextSpan(
                text: AppStrings.termsAndConditions,
                style: getBoldTextStyle(fontSize: FontSize.f15))
          ]),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            _loginEmailIdTextEditingController,
            _loginEmailFocusNode,
            TextInputType.emailAddress,
            TextCapitalization.none,
            TextInputAction.next,
            AppStrings.emailIdOrMobileNoHint,
            AppImages.emailIcon, (String val) {
          FocusScope.of(context).requestFocus(_loginPasswordFocusNode);
        }),
        const SizedBox(
          height: AppSizes.s8,
        ),
        PasswordTextFormField(
            _loginPasswordTextEditingController,
            _loginPasswordFocusNode,
            TextInputType.text,
            TextCapitalization.none,
            TextInputAction.done,
            AppStrings.passwordHint,
            _isLoginPasswordObscure, () {
          setState(() {
            _isLoginPasswordObscure = !_isLoginPasswordObscure;
          });
        }, (String val) {
          FocusScope.of(context).requestFocus(FocusNode());
        }),
        const SizedBox(
          height: AppSizes.s20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false);
            },
            child: const Text(AppStrings.login)),
        const SizedBox(
          height: AppSizes.s8,
        ),
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.forgotPasswordRoute);
            },
            child: const Text(AppStrings.forgotPassword))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kidvento_task/app/enumerations.dart';
import 'package:kidvento_task/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:kidvento_task/presentation/custom_widgets/password_text_form_field.dart';
import 'package:kidvento_task/presentation/login/login_viewmodel.dart';
import 'package:kidvento_task/presentation/resources/assets_manager.dart';
import 'package:kidvento_task/presentation/resources/colors_manager.dart';
import 'package:kidvento_task/presentation/resources/fonts_style_manager.dart';
import 'package:kidvento_task/presentation/resources/route_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _signUpPasswordTextEditingController = TextEditingController();
  final _signUpPasswordFocusNode = FocusNode();
  final _signUpNameTextEditingController = TextEditingController();
  final _signUpNameFocusNode = FocusNode();
  final _signUpMobileNumberTextEditingController = TextEditingController();
  final _signUpMobileNumberFocusNode = FocusNode();
  final _signUpEmailTextEditingController = TextEditingController();
  final _signUpEmailFocusNode = FocusNode();

  final _loginEmailIdTextEditingController = TextEditingController();
  final _loginEmailFocusNode = FocusNode();
  final _loginPasswordTextEditingController = TextEditingController();
  final _loginPasswordFocusNode = FocusNode();

  bool _isSignUpPasswordObscure = true;
  bool _isLoginPasswordObscure = true;

  final _viewModel = LoginViewModel();

  _bind() {
    _viewModel.init();
  }

  _dispose() {
    _viewModel.dispose();
    _signUpPasswordTextEditingController.dispose();
    _signUpPasswordFocusNode.dispose();
    _signUpNameTextEditingController.dispose();
    _signUpNameFocusNode.dispose();
    _signUpMobileNumberTextEditingController.dispose();
    _signUpMobileNumberFocusNode.dispose();
    _signUpEmailTextEditingController.dispose();
    _signUpEmailFocusNode.dispose();
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
            _signUpNameTextEditingController,
            _signUpNameFocusNode,
            TextInputType.text,
            TextCapitalization.words,
            TextInputAction.next,
            AppStrings.studentNameHint,
            AppImages.userIcon, (String val) {
          FocusScope.of(context).requestFocus(_signUpMobileNumberFocusNode);
        }),
        const SizedBox(
          height: AppSizes.s8,
        ),
        CustomTextFormField(
            _signUpMobileNumberTextEditingController,
            _signUpMobileNumberFocusNode,
            TextInputType.phone,
            TextCapitalization.none,
            TextInputAction.next,
            AppStrings.mobileNumberHint,
            AppImages.smartPhoneIcon, (String val) {
          FocusScope.of(context).requestFocus(_signUpEmailFocusNode);
        }),
        const SizedBox(
          height: AppSizes.s8,
        ),
        CustomTextFormField(
            _signUpEmailTextEditingController,
            _signUpEmailFocusNode,
            TextInputType.emailAddress,
            TextCapitalization.none,
            TextInputAction.next,
            AppStrings.emailIdHint,
            AppImages.emailIcon, (String val) {
          FocusScope.of(context).requestFocus(_signUpPasswordFocusNode);
        }),
        const SizedBox(
          height: AppSizes.s8,
        ),
        PasswordTextFormField(
            _signUpPasswordTextEditingController,
            _signUpPasswordFocusNode,
            TextInputType.text,
            TextCapitalization.none,
            TextInputAction.done,
            AppStrings.passwordHint,
            _isSignUpPasswordObscure, () {
          setState(() {
            _isSignUpPasswordObscure = !_isSignUpPasswordObscure;
          });
        }, (String val) {
          FocusScope.of(context).requestFocus(FocusNode());
        }),
        const SizedBox(
          height: AppSizes.s20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.signUpRoute);
            },
            child: const Text(AppStrings.generateOtp))
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
              Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
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

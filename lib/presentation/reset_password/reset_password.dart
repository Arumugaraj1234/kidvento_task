import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:kidvento_task/presentation/custom_widgets/password_text_form_field.dart';
import 'package:kidvento_task/presentation/resources/assets_manager.dart';
import 'package:kidvento_task/presentation/resources/fonts_style_manager.dart';
import 'package:kidvento_task/presentation/resources/route_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _otpTextEditingController = TextEditingController();
  final _otpFocusNode = FocusNode();
  final _newPasswordTextEditingController = TextEditingController();
  final _newPasswordFocusNode = FocusNode();
  bool _isObscure = true;

  _bind() {}

  _dispose() {
    _otpTextEditingController.dispose();
    _otpFocusNode.dispose();
    _newPasswordTextEditingController.dispose();
    _newPasswordFocusNode.dispose();
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
                        Text(
                          AppStrings.otpSentToMobileNo,
                          style: getRegularTextStyle(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: AppSizes.s40,
                        ),
                        Column(
                          children: [
                            CustomTextFormField(
                                _otpTextEditingController,
                                _otpFocusNode,
                                TextInputType.number,
                                TextCapitalization.none,
                                TextInputAction.next,
                                AppStrings.enterOtpHint,
                                AppImages.keyIcon, (String val) {
                              FocusScope.of(context)
                                  .requestFocus(_newPasswordFocusNode);
                            }),
                            const SizedBox(
                              height: AppSizes.s20,
                            ),
                            PasswordTextFormField(
                                _newPasswordTextEditingController,
                                _newPasswordFocusNode,
                                TextInputType.text,
                                TextCapitalization.none,
                                TextInputAction.done,
                                AppStrings.enterNewPassword,
                                _isObscure, () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }, (String val) {
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
                                style:
                                    getRegularTextStyle(fontSize: FontSize.f15),
                              ),
                            ),
                            const SizedBox(
                              height: AppSizes.s20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      Routes.mainRoute, (route) => false);
                                },
                                child: const Text(AppStrings.resetPassword))
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:kidvento_task/presentation/resources/assets_manager.dart';
import 'package:kidvento_task/presentation/resources/fonts_style_manager.dart';
import 'package:kidvento_task/presentation/resources/route_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumberTextEditingController = TextEditingController();
  final _mobileNumberFocusNode = FocusNode();

  _bind() {}

  _dispose() {
    _mobileNumberFocusNode.dispose();
    _mobileNumberTextEditingController.dispose();
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
                          AppStrings.resetPasswordInstruction,
                          style: getRegularTextStyle(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: AppSizes.s40,
                        ),
                        Column(
                          children: [
                            CustomTextFormField(
                                _mobileNumberTextEditingController,
                                _mobileNumberFocusNode,
                                TextInputType.phone,
                                TextCapitalization.none,
                                TextInputAction.done,
                                AppStrings.enterYourMobileNumber,
                                AppImages.smartPhoneIcon, (String val) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            }),
                            const SizedBox(
                              height: AppSizes.s40,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.resetPasswordRoute);
                                },
                                child: const Text(AppStrings.generateOtp))
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

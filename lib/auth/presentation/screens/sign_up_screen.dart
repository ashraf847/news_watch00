import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import 'package:news_watch/auth/application/sign_up_form_provider.dart';
import 'package:news_watch/auth/domain/app_user.dart';
import 'package:news_watch/auth/presentation/widgets/t_c_widget.dart';
import 'package:news_watch/core/presentation/widgets/button_widget.dart';
import 'package:news_watch/core/presentation/widgets/reactive_password_input_widget.dart';
import 'package:news_watch/core/presentation/widgets/reactive_text_input_widget.dart';
import 'package:news_watch/translation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import '../../../core/presentation/widgets/reactive_radio_button_widget.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var form = ref.read(signUpFormProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ReactiveForm(
            formGroup: form,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(20),
                  Image.asset(
                    'assets/images/wide_logo.png',
                    width: 250,
                  ),
                  const Gap(40),
                  ReactiveTextInputWidget(
                    hint: 'Username'.i18n,
                    controllerName: 'userName',
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap(40),
                  ReactiveTextInputWidget(
                    hint: 'Email'.i18n,
                    controllerName: 'email',
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap(40),
                  ReactivePhoneFormField(
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.next,
                    formControlName: "phone",
                    isCountryButtonPersistent: true,
                    validationMessages: {
                      PhoneValidationMessage.required: (o) => "Required".i18n,
                      PhoneValidationMessage.invalidMobilePhoneNumber: (o) =>
                          "Number is not valid".i18n,
                    },
                  ),
                  Gap(40),
                  ReactivePasswordInputWidget(
                    hint: "Password".i18n,
                    controllerName: "password",
                  ),
                  Gap(40),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('I am a:'.i18n),
                  ),
                  Gap(20),
                  const Row(
                    children: [
                      Expanded(
                        child: ReactiveRadioButtonWidget(
                          value: "Media Reporter",
                          title: "Media Reporter",
                          controllerName: 'type',
                        ),
                      ),
                      Expanded(
                        child: ReactiveRadioButtonWidget(
                          value: "Visitor",
                          title: "Visitor",
                          controllerName: "type",
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  ReactiveFormConsumer(
                    builder: (context, formGroup, child) {
                      return ButtonWidget(
                        text: "Sign Up".i18n,
                        onTap: formGroup.invalid
                            ? null
                            : () {
                                var userName = form.control("userName").value;
                                var email = form.control("email").value;
                                var phone = form.control("phone").value == null
                                    ? ""
                                    : (form.control("phone").value
                                            as PhoneNumber)
                                        .international;
                                var password = form.control("password").value;
                                var type = form.control("type").value;
                                ref
                                    .read(authNotifierProvider.notifier)
                                    .createUserWithEmailAndPassword(
                                      email,
                                      password,
                                      AppUser(
                                        name: userName,
                                        email: email,
                                        userType: type == "Visitor"
                                            ? UserType.visitor
                                            : UserType.reporter,
                                        phone: phone,
                                      ),
                                    )
                                    .then(
                                  (value) {
                                    if (value != null) {
                                      formGroup.reset();
                                      formGroup.control("type").value =
                                          "Visitor";
                                      // ignore: use_build_context_synchronously
                                      context.pop();
                                    }
                                  },
                                );
                              },
                      );
                    },
                  ),
                  Gap(20),
                  Wrap(
                    children: [
                      Text(
                        'By signing up to Watch News you are acceptin our '
                            .i18n,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              icon: Icon(Icons.info),
                              title: Text("Terms & Conditions".i18n),
                              content: SingleChildScrollView(child: TCWidget()),
                              actions: [
                                TextButton(
                                  onPressed: () => context.pop(),
                                  child: Text("Close".i18n),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text("Terms & Conditions".i18n),
                      ),
                    ],
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

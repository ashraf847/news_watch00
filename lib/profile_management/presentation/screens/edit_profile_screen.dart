import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:intl/intl.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import 'package:news_watch/auth/domain/app_user.dart';
import 'package:news_watch/core/presentation/widgets/button_widget.dart';
import 'package:news_watch/core/presentation/widgets/reactive_text_input_widget.dart';
import 'package:news_watch/translation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../auth/application/app_user_service.dart';
import '../../application/edit_user_provider.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key, required this.appUser});
  final AppUser appUser;

  @override
  Widget build(BuildContext context, ref) {
    var ctr = TextEditingController();
    var form = ref.watch(editUserProvider(appUser));
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile".i18n),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ReactiveTextInputWidget(
                      readOnly: true,
                      hint: "Email".i18n,
                      controllerName: "email",
                      inputStyle: InputStyle.outlined,
                    ),
                    Gap(10),
                    Divider(),
                    Gap(20),
                    ReactiveTextInputWidget(
                      hint: "Name".i18n,
                      controllerName: "userName",
                      inputStyle: InputStyle.outlined,
                    ),
                    Gap(20),
                    Expanded(
                      child: ReactiveDatePicker(
                        formControlName: "date",
                        builder: (context, picker, child) {
                          ctr.text = picker.value == null
                              ? ""
                              : DateFormat.yMMMMd(
                                      I18n.of(context).locale.toString())
                                  .format(
                                  picker.value!,
                                );
                          return TextField(
                            readOnly: true,
                            onTap: () {
                              picker.showPicker();
                            },
                            controller: ctr,
                            decoration: InputDecoration(
                              labelText: "Birth Date".i18n,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: ButtonWidget(
                  text: "Save".i18n,
                  width: 100,
                  onTap: () async {
                    await ref
                        .read(appUserServiceProvider)
                        .updateUser(form: form)
                        .then(
                      (value) {
                        ref.read(authNotifierProvider.notifier).refreshUser();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

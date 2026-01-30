import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import '../../auth/domain/app_user.dart';

final editUserProvider = Provider.family.autoDispose<FormGroup, AppUser>(
  (ref, appUser) {
    return FormGroup(
      {
        "id": FormControl<String>(value: appUser.id),
        "email": FormControl<String>(value: appUser.email),
        "userName": FormControl<String>(
          validators: [Validators.required],
          value: appUser.name,
        ),
        "phone": FormControl<PhoneNumber?>(
          value: appUser.phone == null || appUser.phone!.isEmpty
              ? null
              : PhoneNumber.parse(appUser.phone ?? ""),
        ),
        "date": FormControl<DateTime>(
          value: appUser.birthDate,
        ),
        "dateString": FormControl<String>(
          value: appUser.birthDate?.toIso8601String(),
        ),
      },
    );
  },
);

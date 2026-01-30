import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

final signUpFormProvider = Provider(
  (ref) {
    return FormGroup(
      {
        "userName": FormControl<String>(
          validators: [Validators.required],
        ),
        "email": FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        "phone": FormControl<PhoneNumber>(
          validators: [PhoneValidators.validMobile],
        ),
        "password": FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
        ),
        "type": FormControl<String>(
          value: "Visitor",
        ),
      },
    );
  },
);

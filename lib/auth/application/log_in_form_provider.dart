import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

final logInFormProvider = Provider(
  (ref) {
    return FormGroup(
      {
        "email": FormControl<String>(
          value: "aj.alsouri@gmail.com",
          validators: [Validators.required, Validators.email],
        ),
        "password": FormControl<String>(
          value: "11111111",
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
        ),
      },
    );
  },
);

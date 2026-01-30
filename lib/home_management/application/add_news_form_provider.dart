import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../domain/news.dart';

final addNewsFormGroupProvider = Provider.autoDispose<FormGroup>((ref) {
  return FormGroup({
    'head': FormControl<String>(validators: [Validators.required]),
    'tag': FormControl<String>(value: ""),
    'tags': FormControl<List<String>>(value: <String>[]),
    'category': FormControl<String>(value: Category.politics.name),
  });
});

var imgFileProvider = StateProvider<File?>(
  (ref) => null,
);

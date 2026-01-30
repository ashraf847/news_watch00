import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:news_watch/core/presentation/widgets/reactive_text_input_widget.dart';
import 'package:news_watch/home_management/domain/news.dart';
import 'package:news_watch/translation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../core/presentation/widgets/button_widget.dart';
import '../../../core/presentation/widgets/reactive_drop_widget.dart';
import '../../../core/presentation/widgets/rich_text_widget.dart';
import '../../application/add_news_form_provider.dart';
import '../../application/news_services.dart';

class AddNewsScreen extends ConsumerWidget {
  const AddNewsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var form = ref.watch(addNewsFormGroupProvider);
    var image = ref.watch(imgFileProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Add News".i18n),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: ReactiveForm(
          formGroup: form,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () async {
                        ref
                            .read(newsServicesProvider)
                            .showImagePicker(context, ref);
                      },
                      child: image == null
                          ? Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outlineVariant),
                                  borderRadius: BorderRadius.circular(15)),
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                    Text("Add Post Image".i18n)
                                  ],
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outlineVariant,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                height: 200,
                                child: Image.file(
                                  image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Gap(15),
                  ReactiveTextInputWidget(
                    hint: 'Heading'.i18n,
                    controllerName: 'head',
                    inputStyle: InputStyle.outlined,
                  ),
                  Gap(15),
                  ReactiveTextInputWidget(
                    suffixIcon: IconButton(
                      onPressed: () {
                        form.control("tags").updateValue(
                          <String>[
                            ...form.control("tags").value,
                            form.control("tag").value
                          ],
                        );
                        form.control("tag").value = "";
                        form.control("tag").unfocus();
                      },
                      icon: Icon(Icons.add_circle_outline_sharp),
                    ),
                    hint: 'Add Tag'.i18n,
                    controllerName: 'tag',
                    inputStyle: InputStyle.outlined,
                  ),
                  ReactiveValueListenableBuilder(
                    formControlName: "tags",
                    builder: (context, control, child) {
                      var tags = control.value as List<String>;
                      return Column(
                        children: [
                          if (tags.isNotEmpty) Gap(15),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Wrap(
                              runSpacing: 5,
                              spacing: 5,
                              children: tags
                                  .map(
                                    (e) => Chip(
                                      label: Text(e.i18n),
                                      onDeleted: () {
                                        var tags =
                                            control.value as List<String>;
                                        tags.remove(e);
                                        form.control("tags").updateValue(tags);
                                        form
                                            .control("tags")
                                            .updateValueAndValidity(
                                              updateParent: false,
                                            );
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Gap(15),
                  ReactiveDropWidget(
                    items: Category.values
                        .map(
                          (e) => e.name,
                        )
                        .toList(),
                    controllerName: "category",
                  ),
                  Gap(15),
                  SizedBox(height: 300, child: RichTextWidget()),
                  Gap(15),
                  ReactiveFormConsumer(builder: (context, formGroup, child) {
                    return ButtonWidget(
                      onTap: form.invalid
                          ? null
                          : () {
                              if (ref
                                  .read(richTextProvider)
                                  .document
                                  .toPlainText()
                                  .trim()
                                  .isEmpty) {
                                BotToast.showText(
                                    text: "Add news details".i18n);
                              } else {
                                ref
                                    .read(newsServicesProvider)
                                    .createNews(form: form)
                                    .then(
                                  (value) {
                                    // ignore: use_build_context_synchronously
                                    context.pop();
                                    ref.read(richTextProvider.notifier).state =
                                        QuillController.basic();
                                    ref.read(imgFileProvider.notifier).state =
                                        null;
                                  },
                                );
                              }
                            },
                      width: 400,
                      text: "Add".i18n,
                    );
                  })
                ],
              ),
            ),
          ),
        ));
  }
}

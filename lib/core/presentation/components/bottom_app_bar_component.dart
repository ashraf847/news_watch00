import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_watch/translation.dart';
import '../../../auth/application/auth_notifier_provider.dart';
import '../../../auth/domain/app_user.dart';
import '../../application/navigation_provider.dart';

class BottomAppBarComponent extends ConsumerWidget {
  const BottomAppBarComponent({
    super.key,
    required this.currentScreenIndex,
  });
  final int currentScreenIndex;

  @override
  Widget build(BuildContext context, ref) {
    var currenUser = ref.read(authNotifierProvider)!;

    String? profileUrl;
    return BottomAppBar(
      padding: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color: currentScreenIndex == 0
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 0;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentScreenIndex == 0
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline,
                      ),
                      Text(
                        "Home".i18n,
                        style: TextStyle(
                          color: currentScreenIndex == 0
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color: currentScreenIndex == 1
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 1;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ads_click,
                        color: currentScreenIndex == 1
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline,
                      ),
                      Text(
                        "Ads".i18n,
                        style: TextStyle(
                          color: currentScreenIndex == 1
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (currenUser.userType == UserType.reporter)
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Add Post".i18n,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color: currentScreenIndex == 2
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 2;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.poll,
                        color: currentScreenIndex == 2
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline,
                      ),
                      Text(
                        "Poll".i18n,
                        style: TextStyle(
                          color: currentScreenIndex == 2
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color: currentScreenIndex == 3
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 3;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: unnecessary_null_comparison
                      if (profileUrl == null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SvgPicture.asset(
                              height: 32, width: 32, "assets/svg/no-image.svg"),
                        )
                      else
                        Image.network(""),
                      Text(
                        "Profile".i18n,
                        style: TextStyle(
                          color: currentScreenIndex == 3
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import 'package:news_watch/auth/application/notifications_services.dart';
import 'package:news_watch/auth/domain/app_user.dart';
import 'package:news_watch/core/presentation/screens/ads_screen.dart';
import 'package:news_watch/translation.dart';
import '../../../auth/application/stream_user_provider.dart';
import '../../../home_management/presentation/screens/home_screen.dart';
import '../../application/navigation_provider.dart';
import '../components/bottom_app_bar_component.dart';
import '../widgets/main_icon_button.dart';
import '../../../profile_management/presentation/screens/profile_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var currentScreenIndex = ref.watch(navigationProvider);
    var currenUser = ref.read(authNotifierProvider);
    var currenUserStream = ref.watch(streamUserProvider(currenUser?.id ?? ""));

    return DefaultTabController(
      length: 6,
      child: currenUserStream.when(
        data: (data) => Scaffold(
          appBar: currentScreenIndex == 1
              ? AppBar(
                  title: Text(
                    "Ads".i18n,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              : currentScreenIndex == 3
                  ? AppBar(
                      title: Text(
                        "Settings".i18n,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    )
                  : currentScreenIndex == 2
                      ? null
                      : AppBar(
                          title: Text(data!.name.i18n),
                          actions: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.stars_rounded,
                                    color: Colors.yellow[400],
                                  ),
                                  Gap(5),
                                  Text(
                                    data.stars?.toString() ?? 0.toString(),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              tooltip: "Notifications".i18n,
                              onPressed: () async {
                                // if notifivations is turned off, run it
                                await ref
                                    .read(notificationsServiceProvider)
                                    .initNotifications();
                                // Get my fcm token
                                String? token =
                                    await FirebaseMessaging.instance.getToken();
                                String myUserId =
                                    ref.read(authNotifierProvider)?.id ?? "";
                                // Send notification to my self
                                await Future.delayed(Duration(seconds: 5));
                                ref
                                    .read(notificationsServiceProvider)
                                    .sendNotifications(
                                      fcmToken: token ?? "",
                                      title: "Midad",
                                      body: "Journey",
                                      userId: myUserId,
                                      type: "banadora",
                                    );
                              },
                              icon: Icon(
                                Icons.notifications,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          ],
                          bottom: TabBar(
                            labelColor: Theme.of(context).colorScheme.scrim,
                            unselectedLabelColor:
                                Theme.of(context).colorScheme.outlineVariant,
                            isScrollable: true,
                            tabAlignment: TabAlignment.start,
                            tabs: [
                              Tab(
                                child: Text("Popular".i18n),
                              ),
                              Tab(
                                child: Text("All".i18n),
                              ),
                              Tab(
                                child: Text("Politics".i18n),
                              ),
                              Tab(
                                child: Text("Tech".i18n),
                              ),
                              Tab(
                                child: Text("Healthy".i18n),
                              ),
                              Tab(
                                child: Text("Science".i18n),
                              ),
                            ],
                          ),
                        ),
          floatingActionButton: currenUser?.userType == UserType.reporter
              ? MainIconButton()
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:
              BottomAppBarComponent(currentScreenIndex: currentScreenIndex),
          body: currentScreenIndex == 1
              ? AdsScreen()
              : currentScreenIndex == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 400,
                          child: Lottie.asset('assets/work_animation.json'),
                        ),
                        Text(
                          "Make Polls sectoin by your self!\n You Can Do IT!"
                              .i18n,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    )
                  : currentScreenIndex == 3
                      ? ProfileScreen()
                      : HomeScreen(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        skipLoadingOnRefresh: true,
        skipLoadingOnReload: true,
      ),
    );
  }
}

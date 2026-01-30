import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import 'package:news_watch/auth/domain/app_user.dart';
import 'package:news_watch/home_management/presentation/screens/add_news_screen.dart';
import 'package:news_watch/profile_management/presentation/screens/t_c_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/presentation/screens/log_in_screen.dart';
import 'auth/presentation/screens/sign_up_screen.dart';
import 'core/presentation/screens/main_screen.dart';
import 'core/presentation/screens/splash_screen.dart';
import 'home_management/presentation/screens/news_details_screen.dart';
import 'profile_management/presentation/screens/edit_profile_screen.dart';
import 'profile_management/presentation/screens/my_posts_screen.dart';

final router = Provider(
  (ref) => GoRouter(
    // initialLocation: "/splash",
    observers: [BotToastNavigatorObserver()],
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: "/",
        name: "/",
        builder: (context, state) {
          return MainScreen();
        },
        routes: [
          GoRoute(
            path: "/add_news",
            name: "add_news",
            builder: (context, state) {
              return AddNewsScreen();
            },
          ),
          GoRoute(
            path: "/terms_and_conditions",
            name: "terms_and_conditions",
            builder: (context, state) {
              return TCScreen();
            },
          ),
          GoRoute(
            path: "/my_news",
            name: "my_news",
            builder: (context, state) {
              return MyPostsScreen();
            },
          ),
          GoRoute(
            path: "/edit_profile",
            name: "edit_profile",
            builder: (context, state) {
              return EditProfileScreen(
                appUser: state.extra as AppUser,
              );
            },
          ),
          GoRoute(
            path: "/news_details/:id",
            name: "news_details",
            builder: (context, state) {
              return NewsDetailsScreen(
                  newsId: state.pathParameters["id"] ?? "");
            },
          ),
        ],
      ),
      GoRoute(
        path: "/login",
        name: "/login",
        builder: (context, state) {
          return LogInScreen();
        },
      ),
      GoRoute(
        path: "/signup",
        name: "/signup",
        builder: (context, state) {
          return SignUpScreen();
        },
      )
    ],
    redirect: (context, state) async {
      String? userId = ref.watch(authNotifierProvider)?.id;

      // Get saved id from shared preferences
      final prefs = SharedPreferencesAsync();
      final savedId = await prefs.getString("userId");

      if (state.fullPath == "/login") {
        if (userId == null && (savedId == null || savedId.isEmpty)) {
          return "/login";
        } else if (userId == null && savedId != null && savedId.isNotEmpty) {
          return "/splash";
        } else {
          return "/";
        }
      } else {
        if (userId == null && (savedId == null || savedId.isEmpty)) {
          if (state.fullPath == "/signup") return null;
          return "/login";
        } else if (userId == null && savedId != null && savedId.isNotEmpty) {
          return "/splash";
        } else {
          return null;
        }
      }
    },
  ),
);

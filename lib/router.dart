import 'package:flutter/material.dart';
import 'package:reddit_clone/features/auth/screens/login_screen.dart';
import 'package:reddit_clone/features/community/screens/add_mods_screen.dart';
import 'package:reddit_clone/features/community/screens/community_screen.dart';
import 'package:reddit_clone/features/community/screens/create_community_screen.dart';
import 'package:reddit_clone/features/community/screens/edit_community_screen.dart';
import 'package:reddit_clone/features/community/screens/mod_tools_screen.dart';
import 'package:reddit_clone/features/home/screens/home_screen.dart';
import 'package:reddit_clone/features/post/screens/add_post_type_screen.dart';
import 'package:reddit_clone/features/post/screens/comment_screen.dart';
import 'package:reddit_clone/features/user_profile/screens/edit_profile_screen.dart';
import 'package:reddit_clone/features/user_profile/screens/user_profile_screen.dart';
import 'package:routemaster/routemaster.dart';

//loggedOutRoute
final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: LoginScreen()),
  },
);

//loggedInRoute
final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    '/create-community': (_) =>
        const MaterialPage(child: CreateCommunityScreen()),
    '/r/:name': (router) => MaterialPage(
          child: CommunityScreen(
            name: router.pathParameters['name']!,
          ),
        ),
    '/mod-tools/:name': (router) => MaterialPage(
          child: ModToolsScreen(
            name: router.pathParameters['name']!,
          ),
        ),
    '/edit-community/:name': (router) => MaterialPage(
          child: EditCommunityScreen(
            name: router.pathParameters['name']!,
          ),
        ),
    '/add-mods/:name': (router) => MaterialPage(
          child: AddModsScreen(
            name: router.pathParameters['name']!,
          ),
        ),
    '/u/:uid': (router) => MaterialPage(
          child: UserProfileScreen(
            uid: router.pathParameters['uid']!,
          ),
        ),
    '/edit-profile/:uid': (router) => MaterialPage(
          child: EditProfileScreen(
            uid: router.pathParameters['uid']!,
          ),
        ),
    '/add-post/:type': (router) => MaterialPage(
          child: AddPostTypeScreen(
            type: router.pathParameters['type']!,
          ),
        ),
    '/post/:postId/comments': (router) => MaterialPage(
          child: CommentScreen(
            postId: router.pathParameters['postId']!,
          ),
        ),
  },
);

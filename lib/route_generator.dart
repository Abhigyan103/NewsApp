import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'src/features/authentication/screens/landing/landing_page.dart';
import 'src/features/authentication/screens/login/login_page.dart';
import 'src/features/authentication/screens/signup/signup_page.dart';
import 'src/features/authentication/screens/verify_email.dart';
import 'src/features/dashboard/dashboard.dart';

GoRouter myGoRouter = GoRouter(
  redirect: (context, state) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null && !state.fullPath!.startsWith('/auth')) {
      return state.namedLocation('Landing');
    }
    if (user != null) {
      if (user.emailVerified) {
        if (state.matchedLocation.startsWith('/auth')) return '/';
        if (state.matchedLocation.startsWith('/app/verify-email')) return '/';
        return state.matchedLocation;
      } else {
        return '/app/verify-email';
      }
    }
    return state.matchedLocation;
  },
  routes: [
    GoRoute(
      name: 'Landing',
      path: '/auth',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const LandingPage(), // Directly use the page content widget here
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      name: 'Login',
      path: '/auth/login',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const LoginPage(), // Directly use the page content widget here
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      name: 'Signup',
      path: '/auth/signup',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SignupPage(), // Directly use the page content widget here
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      name: 'Forgot Password',
      path: '/auth/forgot-password',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const LoginPage(), // Directly use the page content widget here
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      name: 'Verify Email',
      path: '/app/verify-email',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child:
            const VerifyEmailScreen(), // Directly use the page content widget here
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      name: 'News App',
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const Dashboard(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    ),
  ],
);

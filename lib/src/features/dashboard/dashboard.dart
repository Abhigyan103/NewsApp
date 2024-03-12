import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/utils_providers.dart';
import '../profile_screen/screens/profile_screen.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  List<Widget> pages = [
    // const MatchesPage(),
    // const SearchScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[ref.read(navigationIndexProvider)],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(navigationIndexProvider),
          onTap: (value) {
            ref.read(navigationIndexProvider.notifier).update(value);
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.newspaper), label: 'News'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourites'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.perm_identity), label: 'Profile'),
          ]),
    );
  }
}

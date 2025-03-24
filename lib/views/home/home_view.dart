import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../chats/chats_page.dart';
import '../experience/experience_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.grey[900],
            body: IndexedStack(
              index: viewModel.currentPageIndex,
              children: const [
                HomePage(),
                ChatsPage(),
                ExperiencePage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                viewModel.changePage(index);
              },
              indicatorColor: Colors.amber,
              selectedIndex: viewModel.currentPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.chat),
                  label: 'Chats',
                ),
                NavigationDestination(
                  icon: Icon(Icons.work),
                  label: 'Experience',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:abdullah/screens/home_screen/tabs/chats_tab.dart'; // استيراد _ChatsTab
import 'package:abdullah/screens/home_screen/tabs/status_tab.dart'; // استيراد _StatusTab
import 'package:abdullah/screens/home_screen/tabs/contacts_tab.dart'; // استيراد _ContactsTab

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _searchController = TextEditingController();

  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      ChatsTab(), // تم تغيير الاسم إلى ChatsTab
      StatusTab(), // تم تغيير الاسم إلى StatusTab
      ContactsTab(), // تم تغيير الاسم إلى ContactsTab
    ];
  }

  void _onMenuSelected(String value) {
    switch (value) {
      case 'new_group':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('مجموعة جديدة... (غير مطبقة بعد)')),
        );
        break;
      case 'settings':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('الإعدادات... (غير مطبقة بعد)')),
        );
        break;
      case 'logout':
        _logout();
        break;
    }
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق الدردشة'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'بحث...',
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _onMenuSelected,
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'new_group', child: Text('مجموعة جديدة')),
              const PopupMenuItem(value: 'settings', child: Text('الإعدادات')),
              const PopupMenuItem(value: 'logout', child: Text('تسجيل الخروج')),
            ],
          ),
        ],
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'الدردشات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'الحالة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'جهات الاتصال',
          ),
        ],
      ),
    );
  }
}


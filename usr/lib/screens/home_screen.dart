import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dashboard_screen.dart';
import 'products_screen.dart';
import 'customers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    const DashboardScreen(),
    const ProductsScreen(),
    const CustomersScreen(),
    const Center(child: Text('الفواتير - قريباً')), // Placeholder
    const Center(child: Text('التقارير - قريباً')), // Placeholder
  ];

  final List<String> _titles = [
    'لوحة التحكم',
    'إدارة المنتجات',
    'إدارة العملاء',
    'الفواتير',
    'التقارير',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pop(context); // Close drawer
        },
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF2563EB)),
            accountName: Text("مدير النظام"),
            accountEmail: Text("admin@sedrila.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("A", style: TextStyle(fontSize: 24, color: Color(0xFF2563EB))),
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(LucideIcons.layoutDashboard),
            label: Text('لوحة التحكم'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(LucideIcons.package),
            label: Text('المنتجات'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(LucideIcons.users),
            label: Text('العملاء'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(LucideIcons.fileText),
            label: Text('الفواتير'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(LucideIcons.barChart3),
            label: Text('التقارير'),
          ),
          const Divider(),
          const NavigationDrawerDestination(
            icon: Icon(LucideIcons.settings),
            label: Text('الإعدادات'),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      floatingActionButton: _selectedIndex == 1 // Only show on Products screen
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

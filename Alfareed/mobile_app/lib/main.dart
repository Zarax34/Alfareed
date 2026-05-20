import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'screens/customer/home_screen.dart';
import 'screens/admin/admin_dashboard.dart';
import 'screens/delivery/delivery_orders.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<UserRole>(create: (_) => UserRoleProvider()),
      ],
      child: const AlFareedApp(),
    ),
  );
}

enum UserRole { customer, admin, delivery }

class UserRoleProvider extends Provider<UserRole> with ChangeNotifier {
  UserRole _role = UserRole.customer;
  UserRole get role => _role;
  void setRole(UserRole newRole) {
    _role = newRole;
    notifyListeners();
  }
}

class AlFareedApp extends StatelessWidget {
  const AlFareedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الفريد للعسل',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const RoleBasedHome(),
    );
  }
}

class RoleBasedHome extends StatelessWidget {
  const RoleBasedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final role = Provider.of<UserRole>(context);
    if (role == UserRole.admin) return const AdminDashboard();
    if (role == UserRole.delivery) return const DeliveryOrdersScreen();
    return const HomeScreen();
  }
}

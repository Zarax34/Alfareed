import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme.dart';
import '../screens/customer/home_screen.dart';
import '../screens/admin/admin_dashboard.dart';
import '../screens/delivery/delivery_orders.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Provider for User Role and Auth State
        Provider<UserRole>(create: (_) => UserRoleProvider()),
      ],
      child: const AlFareedApp(),
    ),
  );
}

enum UserRole { customer, admin, delivery }

class UserRoleProvider extends Provider<UserRole> with ChangeNotifier {
  UserRole _role = UserRole.customer; // Default to customer
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
      theme: AppTheme.lightTheme,
      home: const RoleBasedHomePage(),
    );
  }
}

class RoleBasedHomePage extends StatelessWidget {
  const RoleBasedHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final role = Provider.of<UserRole>(context);
    
    switch (role) {
      case UserRole.admin:
        return theAdminDashboard();
      case UserRole.delivery:
        return theDeliveryOrders();
      case UserRole.customer:
      default:
        return theHomeScreen();
    }
  }
}

// Helpers to refer to the root screens
Widget theHomeScreen() => const HomeScreen();
Widget theAdminDashboard() => const AdminDashboard();
Widget theDeliveryOrders() => const DeliveryOrdersScreen();

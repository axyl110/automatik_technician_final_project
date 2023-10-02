import 'package:automatik_technician_final_project/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the content for the Home tab here
    return Container(
        // Your Home tab content
        );
  }
}

class TransactionsTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the content for the Transactions tab here
    return Container(
        // Your Transactions tab content
        );
  }
}

class PaymentTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the content for the Transactions tab here
    return Container(
        // Your Transactions tab content
        );
  }
}

class MessagesTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the content for the Transactions tab here
    return Container(
        // Your Transactions tab content
        );
  }
}

class AccountTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the content for the Transactions tab here
    return Container(
        // Your Transactions tab content
        );
  }
}

class DashboardPage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Obx(
        () {
          // Implement the main content of the dashboard here
          // You can switch between different pages based on the selected tab
          return _buildDashboardContent(controller.selectedTab.value);
        },
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: controller.selectedTab.value,
            onTap: (index) {
              controller.changeTab(index);
            },
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: 'Payment',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDashboardContent(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return HomeTabContent(); // Replace with your Home tab content
      case 1:
        return TransactionsTabContent(); // Replace with your Transactions tab content
      case 2:
        return PaymentTabContent(); // Replace with your Payment tab content
      case 3:
        return MessagesTabContent(); // Replace with your Messages tab content
      case 4:
        return AccountTabContent(); // Replace with your Account tab content
      default:
        return Container(); // Return an empty container by default
    }
  }
}

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> customers = [
      {'name': 'شركة الأفق للتجارة', 'phone': '0501234567', 'balance': 1200, 'last_purchase': '2023-10-01'},
      {'name': 'مؤسسة النور', 'phone': '0559876543', 'balance': 0, 'last_purchase': '2023-10-05'},
      {'name': 'أحمد محمد علي', 'phone': '0541122334', 'balance': -500, 'last_purchase': '2023-09-20'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
        final double balance = (customer['balance'] as int).toDouble();
        
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Text(
                customer['name'][0],
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            title: Text(customer['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("هاتف: ${customer['phone']}"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$balance ر.س",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: balance > 0 ? Colors.red : (balance < 0 ? Colors.green : Colors.grey),
                  ),
                ),
                Text(
                  balance > 0 ? "عليه" : (balance < 0 ? "له" : "خالص"),
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            onTap: () {
              // Navigate to customer details
            },
          ),
        );
      },
    );
  }
}

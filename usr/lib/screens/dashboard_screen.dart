import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "نظرة عامة اليوم",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.3,
            children: const [
              StatCard(
                title: "المبيعات",
                value: "5,400 ر.س",
                icon: LucideIcons.banknote,
                color: Colors.green,
                trend: "+12%",
              ),
              StatCard(
                title: "الفواتير",
                value: "18",
                icon: LucideIcons.fileText,
                color: Colors.blue,
                trend: "+3",
              ),
              StatCard(
                title: "العملاء الجدد",
                value: "4",
                icon: LucideIcons.userPlus,
                color: Colors.orange,
                trend: "+1",
              ),
              StatCard(
                title: "تنبيهات المخزون",
                value: "7",
                icon: LucideIcons.alertTriangle,
                color: Colors.red,
                isAlert: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "أحدث العمليات",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (ctx, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    child: const Icon(LucideIcons.shoppingBag, color: Colors.blue, size: 20),
                  ),
                  title: Text("فاتورة مبيعات #${10023 + index}"),
                  subtitle: Text("العميل: محمد أحمد"),
                  trailing: Text(
                    "${(index + 1) * 150} ر.س",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

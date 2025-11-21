import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final List<Map<String, dynamic>> products = [
      {'name': 'لابتوب ديل XPS', 'sku': 'DELL-001', 'price': 4500, 'stock': 12, 'category': 'إلكترونيات'},
      {'name': 'ماوس لاسلكي', 'sku': 'LOGI-022', 'price': 120, 'stock': 50, 'category': 'ملحقات'},
      {'name': 'شاشة سامسونج 24', 'sku': 'SAM-240', 'price': 650, 'stock': 3, 'category': 'شاشات'},
      {'name': 'كيبورد ميكانيكي', 'sku': 'KEY-990', 'price': 350, 'stock': 15, 'category': 'ملحقات'},
      {'name': 'طابعة HP', 'sku': 'HP-PRT', 'price': 800, 'stock': 0, 'category': 'طابعات'},
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'بحث عن منتج...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final bool isLowStock = product['stock'] < 5;
              
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(LucideIcons.image, color: Colors.grey),
                  ),
                  title: Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SKU: ${product['sku']} | ${product['category']}"),
                      Row(
                        children: [
                          Text(
                            "المخزون: ${product['stock']}",
                            style: TextStyle(
                              color: isLowStock ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (isLowStock)
                            const Padding(
                              padding: EdgeInsets.only(right: 4.0),
                              child: Icon(Icons.warning, size: 14, color: Colors.red),
                            )
                        ],
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${product['price']} ر.س",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2563EB)),
                      ),
                      const Icon(Icons.more_vert, size: 20, color: Colors.grey),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black87, size: 26),
        titleSpacing: 0,
        title: const Text(
          'Quản lý thu chi',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined, color: Colors.black87, size: 28),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 16),
            _buildSummaryRow(),
            const SizedBox(height: 20),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Giao dịch gần đây',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Xem tất cả',
                    style: TextStyle(color: Color(0xFF2979FF), fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            _buildTransactionListCard(),
            const SizedBox(height: 20),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: const Color(0xFF2979FF),
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF2979FF),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subtitles_outlined),
            label: 'Giao dịch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            label: 'Thống kê',
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2979FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'SỐ DƯ HIỆN TẠI',
                        style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.visibility_outlined, color: Colors.white70, size: 16),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '5.000.000 đ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8, bottom: 4),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E88E5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.account_balance_wallet, color: Colors.greenAccent, size: 36),
                  ),
                  const Icon(Icons.monetization_on, color: Colors.amber, size: 22),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 18, height: 4, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 4),
              Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 4),
              Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(2))),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildSummaryRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF4CAF50),
                  radius: 18,
                  child: const Icon(Icons.arrow_downward, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('TỔNG THU NHẬP', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      Text('8.000.000 đ', style: TextStyle(fontSize: 13, color: Color(0xFF2E7D32), fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFEF5350),
                  radius: 18,
                  child: const Icon(Icons.arrow_upward, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('TỔNG CHI TIÊU', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      Text('3.000.000 đ', style: TextStyle(fontSize: 13, color: Color(0xFFC62828), fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildTransactionListCard() {
    final transactions = [
      {'title': 'Ăn trưa', 'category': 'Ăn uống', 'date': '03/09/2024', 'amount': '-50.000 đ', 'isExpense': true, 'icon': Icons.restaurant, 'color': Colors.orange},
      {'title': 'Xăng xe', 'category': 'Di chuyển', 'date': '03/09/2024', 'amount': '-100.000 đ', 'isExpense': true, 'icon': Icons.directions_car, 'color': Colors.blue},
      {'title': 'Lương tháng 9', 'category': 'Thu nhập', 'date': '01/09/2024', 'amount': '+8.000.000 đ', 'isExpense': false, 'icon': Icons.attach_money, 'color': Colors.green},
      {'title': 'Mua sắm', 'category': 'Mua sắm', 'date': '31/08/2024', 'amount': '-300.000 đ', 'isExpense': true, 'icon': Icons.shopping_cart, 'color': Colors.purple},
      {'title': 'Học phí', 'category': 'Giáo dục', 'date': '30/08/2024', 'amount': '-500.000 đ', 'isExpense': true, 'icon': Icons.school, 'color': Colors.teal},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        separatorBuilder: (context, index) => const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFF0F0F0)),
        itemBuilder: (context, index) {
          final item = transactions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: (item['color'] as Color).withOpacity(0.15),
                  radius: 20,
                  child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(item['category'] as String, style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                          const SizedBox(width: 16),
                          Text(item['date'] as String, style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  item['amount'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: (item['isExpense'] as bool) ? const Color(0xFFEF5350) : const Color(0xFF4CAF50),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
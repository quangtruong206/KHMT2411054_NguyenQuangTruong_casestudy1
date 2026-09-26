import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final bool isEditing;

  const TransactionScreen({super.key, this.isEditing = false});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

bool isExpense = true;

late TextEditingController amountController;
late TextEditingController noteController;

@override
void initState() {
super.initState();

amountController = TextEditingController(text: widget.isEditing ? "100.000" : "");
noteController = TextEditingController(text: widget.isEditing ? "Ăn trưa" : "");
}

@override
void dispose() {
amountController.dispose();
noteController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(
backgroundColor: Colors.white,
elevation: 0,
centerTitle: true,
leading: IconButton(
icon: const Icon(Icons.arrow_back, color: Colors.black87),
onPressed: () {

Navigator.pop(context);
},
),
title: Text(
widget.isEditing ? 'Sửa giao dịch' : 'Thêm giao dịch',
style: const TextStyle(
color: Colors.black87,
fontWeight: FontWeight.bold,
fontSize: 18,
),
),
),
body: SingleChildScrollView(
padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

_buildTypeToggle(),
const SizedBox(height: 24),


_buildLabel('Danh mục'),
_buildCategorySelector(),
const SizedBox(height: 20),


_buildLabel('Số tiền'),
_buildTextField(
controller: amountController,
hint: 'Nhập số tiền',
suffixText: 'đ',
keyboardType: TextInputType.number,
),
const SizedBox(height: 20),


_buildLabel('Ngày giao dịch'),
_buildDatePicker(),
const SizedBox(height: 20),


_buildLabel('Ghi chú'),
_buildTextField(controller: noteController,
hint: 'Nhập ghi chú (tùy chọn)',
maxLines: 3,
),
const SizedBox(height: 40),


SizedBox(
width: double.infinity,
height: 52,
child: ElevatedButton(
onPressed: () {

},
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFF2176C7),
foregroundColor: Colors.white,
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
),
),
child: const Text(
'Lưu',
style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
),
),
),
const SizedBox(height: 20),
],
),
),
);
}

Widget _buildLabel(String text) {
return Padding(
padding: const EdgeInsets.only(bottom: 8),
child: Text(
text,
style: const TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
color: Color(0xFF14213D),
),
),
);
}

Widget _buildTypeToggle() {
return Container(
height: 46,
decoration: BoxDecoration(
color: Colors.grey.shade100,
borderRadius: BorderRadius.circular(10),
border: Border.all(color: Colors.grey.shade300, width: 1),
),
child: Row(
children: [
Expanded(
child: GestureDetector(
onTap: () => setState(() => isExpense = true),
child: Container(
margin: const EdgeInsets.all(4),
decoration: BoxDecoration(
color: isExpense ? const Color(0xFFFF6B6B) : Colors.transparent,
borderRadius: BorderRadius.circular(6),
),
alignment: Alignment.center,
child: Text(
'Chi tiêu',
style: TextStyle(
color: isExpense ? Colors.white : Colors.grey.shade600,
fontWeight: isExpense ? FontWeight.bold : FontWeight.normal,
),
),
),
),
),
Expanded(
child: GestureDetector(
onTap: () => setState(() => isExpense = false),
child: Container(
margin: const EdgeInsets.all(4),
decoration: BoxDecoration(
color: !isExpense ? Colors.green : Colors.transparent,borderRadius: BorderRadius.circular(6),
),
alignment: Alignment.center,
child: Text(
'Thu nhập',
style: TextStyle(
color: !isExpense ? Colors.white : Colors.grey.shade600,
fontWeight: !isExpense ? FontWeight.bold : FontWeight.normal,
),
),
),
),
),
],
),
);
}

Widget _buildCategorySelector() {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
decoration: BoxDecoration(
border: Border.all(color: Colors.grey.shade300),
borderRadius: BorderRadius.circular(10),
),
child: Row(
children: [
Container(
padding: const EdgeInsets.all(6),
decoration: BoxDecoration(
color: Colors.red.shade50,
shape: BoxShape.circle,
),
child: const Icon(Icons.restaurant, color: Color(0xFFFF6B6B), size: 18),
),
const SizedBox(width: 12),
const Text(
'Ăn uống',
style: TextStyle(fontSize: 16, color: Colors.black87),
),
const Spacer(),
Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
],
),
);
}

Widget _buildDatePicker() {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
decoration: BoxDecoration(
border: Border.all(color: Colors.grey.shade300),
borderRadius: BorderRadius.circular(10),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
const Text(
'12/04/2025',
style: TextStyle(fontSize: 16, color: Colors.black87),
),
Icon(Icons.calendar_today_outlined, color: Colors.grey.shade500, size: 20),
],
),
);
}

Widget _buildTextField({
required TextEditingController controller,
required String hint,
String? suffixText,
int maxLines = 1,
TextInputType? keyboardType,
}) {
return TextField(
controller: controller,
maxLines: maxLines,
keyboardType: keyboardType,
decoration: InputDecoration(
hintText: hint,
hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
suffixText: suffixText,
suffixStyle: const TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide(color: Colors.grey.shade300),
),
enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: Colors.grey.shade300),
),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Color(0xFF2176C7)),
  ),
),
);
}
}
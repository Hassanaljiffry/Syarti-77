
import 'package:flutter/material.dart';
import 'reminder_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int dailyKm = 50;
  TextEditingController manualKmController = TextEditingController();
  String faultCode = '';
  String faultResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرئيسية'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('اختر معدل القيادة اليومية (كم):', style: TextStyle(fontSize: 16)),
            DropdownButton<int>(
              value: dailyKm,
              items: [
                DropdownMenuItem(child: Text('30 كم (قليل)'), value: 30),
                DropdownMenuItem(child: Text('50 كم (متوسط)'), value: 50),
                DropdownMenuItem(child: Text('100 كم (كثير)'), value: 100),
                DropdownMenuItem(child: Text('يدوي'), value: -1),
              ],
              onChanged: (val) {
                setState(() {
                  dailyKm = val!;
                });
              },
            ),
            if (dailyKm == -1)
              TextField(
                controller: manualKmController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'أدخل كم بالكيلو متر في اليوم'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('حساب التذكيرات'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم حساب التذكيرات بناءً على المدخلات.')),
                );
              },
            ),
            Divider(height: 40),
            Text('تشخيص أعطال السيارة:', style: TextStyle(fontSize: 16)),
            TextField(
              onChanged: (val) {
                faultCode = val.toUpperCase();
              },
              decoration: InputDecoration(
                labelText: 'أدخل كود العطل (مثال: P0300)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('بحث'),
              onPressed: () {
                setState(() {
                  faultResult = 'نتيجة البحث لكود: \$faultCode';
                });
              },
            ),
            if (faultResult.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(faultResult, style: TextStyle(color: Colors.tealAccent)),
              ),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text('إنشاء تقرير PDF'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم إنشاء التقرير بنجاح.')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

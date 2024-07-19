import 'package:flutter/material.dart';

class ImmunizationH extends StatelessWidget {
  const ImmunizationH({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Immunization'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Vaccine',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Batch No',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Handle onTap event
              },
              child: const CardWidget(
                  name: 'John Doe', batchNo: '12345', date: '2024-05-10'),
            ),
            const SizedBox(height: 10), // Add some space between cards
            const CardWidget(
                name: 'Jane Smith', batchNo: '54321', date: '2024-05-11'),
            const SizedBox(height: 10), // Add some space between cards
            const CardWidget(
                name: 'Alice Johnson', batchNo: '98765', date: '2024-05-12'),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String name;
  final String batchNo;
  final String date;

  const CardWidget({
    required this.name,
    required this.batchNo,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2.0, 2.0),
          )
        ],
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(batchNo),
            Text(date),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}

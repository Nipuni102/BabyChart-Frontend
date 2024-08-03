import 'package:flutter/material.dart';

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VaccineDetailsScreen(),
    );
  }
}*/

class VaccineDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCC31A1),
        title: Text('BabyChart'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[100]!, Colors.pink[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DataTable(
                columns: const [
                  DataColumn(label: Text('Vaccine')),
                  DataColumn(label: Text('Rubella')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Age')),
                    DataCell(Text('5 Months')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Date')),
                    DataCell(Text('2023.03.21')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Batch No')),
                    DataCell(Text('234BAms')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Adverse Effects')),
                    DataCell(Text('Fever, vomiting')),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

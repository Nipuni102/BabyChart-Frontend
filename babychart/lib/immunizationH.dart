import 'package:flutter/material.dart';
import 'vaccineDetail.dart';

class ImmunizationH extends StatelessWidget {
  const ImmunizationH({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Immunization'),
      ),*/
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VaccineDetailsScreen()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: const CardWidget(

                    vaccine: 'Rubella', batchNo: '12345', date: '2024-05-10'),

              ),
            ),
            const SizedBox(height: 10),
            // Add some space between cards

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VaccineDetailsScreen()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: const CardWidget(
                    vaccine: 'Polio', batchNo: '12345', date: '2024-05-10'),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VaccineDetailsScreen()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: const CardWidget(
                    vaccine: 'Hepatitis B',
                    batchNo: '12345',
                    date: '2024-05-10'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String vaccine;
  final String batchNo;
  final String date;

  const CardWidget({
    required this.vaccine,
    required this.batchNo,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
        //title: Text(vaccine),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(vaccine),
            //Text(batchNo),
            Expanded(
              child:
                  Center(child: Text(batchNo)), // Center align the batch number
            ),
            Text(date),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}

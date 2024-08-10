import 'package:babychart/API/token.dart';
import 'package:babychart/API/vaccine_details.dart';
import 'package:babychart/vaccineDetail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImmunizationH extends StatefulWidget {
  const ImmunizationH({super.key});

  @override
  _ImmunizationHState createState() => _ImmunizationHState();
}

class _ImmunizationHState extends State<ImmunizationH> {
  late Future<List<Vaccine>> futureVaccines;

  @override
  void initState() {
    super.initState();
    _initializeVaccines();
  }

  Future<void> _initializeVaccines() async {
    try {
      String? token = AuthToken().token;
      if (token == null || token.isEmpty) {
        throw Exception('No token found');
      }
      futureVaccines = ApiService('http://51.20.246.58', token).fetchVaccines();
      setState(() {});
    } catch (e) {
      print('Failed to initialize vaccines: $e');
      futureVaccines = Future.value(
          []); // Provide an empty list to avoid late initialization issues
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Vaccine>>(
        future: futureVaccines,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No vaccines found'));
          } else {
            final vaccines = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: vaccines.map((vaccine) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VaccineDetailsScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CardWidget(
                          vaccine: vaccine.name,
                          batchNo: vaccine.batchNo,
                          date: vaccine.vaccinatedDate,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(vaccine),
            Expanded(
              child: Center(child: Text(batchNo)),
            ),
            Text(date),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}

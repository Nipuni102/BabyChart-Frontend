// Assuming you have the following classes implemented for API fetching and token handling.
import 'package:babychart/API/token.dart'; // AuthToken class
import 'package:babychart/API/vaccine_details.dart'; // ApiService class
import 'package:babychart/vaccineDetail.dart'; // VaccineDetailsScreen class
import 'package:flutter/material.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Section: Vaccinations
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.all(16.0), // Padding around the text
                      child: Text(
                        'Vaccinations',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(
                              0xFF67418C), // Purple color similar to your design
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Spacing after title

                  // Vaccine cards
                  Column(
                    children: vaccines.map((vaccine) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VaccineDetailsScreen(),
                            ),
                          );
                        },
                        child: CardWidget(
                          vaccine: vaccine.name,
                          batchNo: vaccine.batchNo,
                          date: vaccine.vaccinatedDate,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// CardWidget for individual vaccine cards
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
    // Choose card color based on the vaccine name, you can add more conditions
    Color cardColor = vaccine == "MMR"
        ? Color(0xFFFFC1E3) // Pinkish color for MMR
        : vaccine == "Polio"
            ? Color(0xFFE3CFFF) // Light purple for Polio
            : Color(0xFFF9C8F0); // Default color for other vaccines

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: cardColor, // Dynamic card color
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vaccine,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              Text(
                batchNo,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Adverse Effects: No', // Static text for now; update based on data
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

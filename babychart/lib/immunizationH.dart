import 'package:flutter/material.dart';
//import 'package:babychart/description_page.dart';

/*class immunizationH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('First Page'),
    );
  }
}*/

class immunizationH extends StatelessWidget {
  const immunizationH({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(child: Column()),
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
            SizedBox(height: 10),
            GestureDetector(
              /* onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const description_page(
                    title: 'How to get rich',
                  );
                }));
                print('Click');
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(
                          2.0,
                          2.0,
                        ),
                      )
                    ]),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text('How to get rich'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                    )
                  ]),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('How to get rich'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                    )
                  ]),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('How to get rich'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}*/

              onTap: () {
                // Handle onTap event
              },
              child: CardWidget(
                  name: 'John Doe', batchNo: '12345', date: '2024-05-10'),
            ),
            SizedBox(height: 10), // Add some space between cards
            CardWidget(
                name: 'Jane Smith', batchNo: '54321', date: '2024-05-11'),
            SizedBox(height: 10), // Add some space between cards
            CardWidget(
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

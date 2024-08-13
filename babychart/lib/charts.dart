import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:babychart/main.dart';
import 'package:babychart/CustomTabBarsPage.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('BabyChart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),*/
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.pink.shade100,
            child: Column(
              children: [
                const Text(
                  'Age - Weight',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Year 1'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor:
                            Colors.white, // Change text color to white
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Year 2'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor:
                            Colors.white, // Change text color to white
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Year 3'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor:
                            Colors.white, // Change text color to white
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 3,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 3:
                              return const Text('3');
                            case 6:
                              return const Text('6');
                            case 9:
                              return const Text('9');
                            case 12:
                              return const Text('12');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  minX: 1,
                  maxX: 12,
                  minY: 0,
                  maxY: 12,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(1, 2),
                        FlSpot(3, 3),
                        FlSpot(5, 4),
                        FlSpot(7, 5),
                        FlSpot(9, 8),
                        FlSpot(11, 10),
                      ],
                      isCurved: true,
                      barWidth: 2,
                      color: Colors.black,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.withOpacity(0.7),
                            Colors.orange.withOpacity(0.4),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

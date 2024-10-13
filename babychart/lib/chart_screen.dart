import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age - Weight Chart',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color(0xFF8E42D6),
        iconTheme: const IconThemeData(
          color: Colors.white, // White icon color
        ),
      ),
      body: Column(
        children: [
          // Header with year selection buttons
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Color.fromARGB(
                255, 255, 255, 255), // Purple color for the header
            child: Column(
              children: [
                const Text(
                  'Age - Weight',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF67418C),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9E64B4), // Year button color
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Year 1',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 253, 253, 253),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9E64B4),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Year 2',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9E64B4),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Year 3',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Chart section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
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
                    bottomTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
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
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (FlSpot spot, double xPercentage,
                            LineChartBarData bar, int index) {
                          return FlDotCirclePainter(
                            radius: 4, // Size of the dots
                            color: Colors.blue, // Color of the dots
                            strokeWidth: 1.5,
                            strokeColor:
                                Colors.black, // Border color of the dots
                          );
                        },
                      ),
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

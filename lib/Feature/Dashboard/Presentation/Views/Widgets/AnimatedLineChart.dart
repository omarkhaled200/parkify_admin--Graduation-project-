import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_monthly_profit_model.dart';

class LineChartForSales extends StatefulWidget {
  final GetMonthlyProfitModel profit;

  const LineChartForSales({super.key, required this.profit});

  @override
  _LineChartForSales createState() => _LineChartForSales();
}

class _LineChartForSales extends State<LineChartForSales>
    with TickerProviderStateMixin {
  final Map<String, int> monthIndexMap = const {
    'Jan': 1,
    'Feb': 2,
    'Mar': 3,
    'Apr': 4,
    'May': 5,
    'Jun': 6,
    'Jul': 7,
    'Aug': 8,
    'Sep': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12,
  };

  List<FlSpot> getChartSpots() {
    final profit = widget.profit;

    final Map<String, double> monthlyValues = {
      'Jan': profit.jan?.toDouble() ?? 0,
      'Feb': profit.feb?.toDouble() ?? 0,
      'Mar': profit.mar?.toDouble() ?? 0,
      'Apr': profit.apr?.toDouble() ?? 0,
      'May': profit.may?.toDouble() ?? 0,
      'Jun': profit.jun ?? 0,
      'Jul': profit.jul?.toDouble() ?? 0,
      'Aug': profit.aug?.toDouble() ?? 0,
      'Sep': profit.sep?.toDouble() ?? 0,
      'Oct': profit.oct?.toDouble() ?? 0,
      'Nov': profit.nov?.toDouble() ?? 0,
      'Dec': profit.dec?.toDouble() ?? 0,
    };

    return monthlyValues.entries.map((entry) {
      final x = monthIndexMap[entry.key]!.toDouble();
      final y = entry.value / 1000; // عرض القيم بـ K
      return FlSpot(x, y);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots = getChartSpots();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: LineChart(
          LineChartData(
            minX: 1,
            maxX: 12,
            minY: 0,
            maxY: (spots.map((e) => e.y).reduce((a, b) => a > b ? a : b)) + 5,
            borderData: FlBorderData(show: false),
            gridData: const FlGridData(
              drawHorizontalLine: true,
              drawVerticalLine: false,
            ),
            backgroundColor: Colors.white,
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 15,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${value.toInt()}K',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final label = monthIndexMap.entries
                        .firstWhere((e) => e.value == value.toInt(),
                            orElse: () => const MapEntry('', 0))
                        .key;
                    return Text(
                      label,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: const Color.fromARGB(255, 27, 123, 202),
                barWidth: 4,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF64B5F6).withOpacity(0.8),
                      const Color(0xFF1976D2).withOpacity(0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (touchedSpot) => Colors.white,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((spot) {
                    final month = monthIndexMap.entries
                        .firstWhere((e) => e.value == spot.x.toInt(),
                            orElse: () => const MapEntry('', 0))
                        .key;
                    return LineTooltipItem(
                      '$month\nRevenue = ${spot.y.toStringAsFixed(1)}K',
                      const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

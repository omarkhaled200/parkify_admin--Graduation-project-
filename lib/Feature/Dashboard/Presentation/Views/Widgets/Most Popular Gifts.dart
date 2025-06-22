import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_gift_model/get_popular_gift_model.dart';

class SimpleBarChart extends StatefulWidget {
  final List<GetPopularGiftModel> gift;

  const SimpleBarChart({super.key, required this.gift});

  @override
  State<SimpleBarChart> createState() => _SimpleBarChartState();
}

class _SimpleBarChartState extends State<SimpleBarChart> {
  int? touchedIndex;
  BarTouchResponse? barTouchResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                BarChart(
                  BarChartData(
                    maxY: getMaxY(),
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchCallback: (event, response) {
                        if (event.isInterestedForInteractions &&
                            response != null &&
                            response.spot != null) {
                          setState(() {
                            touchedIndex = response.spot!.touchedBarGroupIndex;
                            barTouchResponse = response;
                          });
                        } else {
                          setState(() {
                            touchedIndex = null;
                            barTouchResponse = null;
                          });
                        }
                      },
                    ),
                    barGroups: widget.gift.asMap().entries.map((entry) {
                      int index = entry.key;
                      var item = entry.value;
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: (item.usageCount ?? 0).toDouble(),
                            color: const Color(0xff9A7CF9),
                            width: 40,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 36,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            int index = value.toInt();
                            if (index < 0 || index >= widget.gift.length)
                              return Container();
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                widget.gift[index].description ?? 'N/A',
                                style: const TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 5,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            if (value % 5 == 0) {
                              return Text(value.toInt().toString());
                            }
                            return Container();
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: FlGridData(show: true, horizontalInterval: 5),
                  ),
                ),

                // Tooltip
                if (barTouchResponse != null &&
                    touchedIndex != null &&
                    touchedIndex! >= 0 &&
                    touchedIndex! < widget.gift.length)
                  Positioned(
                    left:
                        getTooltipPosition(touchedIndex!, constraints.maxWidth),
                    top: getTooltipTop(
                        (widget.gift[touchedIndex!].usageCount ?? 0).toDouble(),
                        constraints.maxHeight),
                    child: TooltipBox(model: widget.gift[touchedIndex!]),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  double getMaxY() {
    if (widget.gift.isEmpty) return 10;
    double max = widget.gift
        .map((e) => e.usageCount ?? 0)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();
    return max + 10;
  }

  double getTooltipPosition(int index, double width) {
    double spacing = width / widget.gift.length;
    return (spacing * index) + spacing / 2 - 50 / 2;
  }

  double getTooltipTop(double value, double chartHeight) {
    double chartMaxY = getMaxY();
    double percentage = value / chartMaxY;
    double barHeight = chartHeight * percentage;
    return chartHeight - barHeight - 70;
  }
}

class TooltipBox extends StatelessWidget {
  final GetPopularGiftModel model;

  const TooltipBox({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description: ${model.description ?? 'N/A'}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: Assets.textfamily)),
          const SizedBox(height: 4),
          Text('Usage: ${model.usageCount ?? 0}',
              style: TextStyle(fontSize: 14, fontFamily: Assets.textfamily)),
          Text('Cost: ${model.cost ?? 0}',
              style: TextStyle(fontSize: 14, fontFamily: Assets.textfamily)),
          Text('Discount: ${model.discount ?? 0}%',
              style: TextStyle(fontSize: 14, fontFamily: Assets.textfamily)),
        ],
      ),
    );
  }
}

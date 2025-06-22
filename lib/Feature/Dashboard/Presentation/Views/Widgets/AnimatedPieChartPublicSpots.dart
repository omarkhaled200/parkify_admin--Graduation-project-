import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_public_spot_model/get_popular_public_spot_model.dart';

class AnimatedPieChartPublicSpots extends StatefulWidget {
  const AnimatedPieChartPublicSpots({super.key, required this.publicspot});
  final List<GetPopularPublicSpotModel> publicspot;

  @override
  _AnimatedPieChartPublicSpotsState createState() =>
      _AnimatedPieChartPublicSpotsState();
}

class _AnimatedPieChartPublicSpotsState
    extends State<AnimatedPieChartPublicSpots> {
  int touchedIndex = -1;
  String selectedLabel = '';
  double selectedValue = 0;
  Offset? touchedOffset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: PieChart(
                PieChartData(
                  sections: _buildSections(widget.publicspot),
                  centerSpaceRadius: 60,
                  sectionsSpace: 5,
                  borderData: FlBorderData(show: false),
                  startDegreeOffset: -90,
                  pieTouchData: PieTouchData(
                    touchCallback: (event, response) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            response == null ||
                            response.touchedSection == null) {
                          touchedIndex = -1;
                          selectedLabel = '';
                          selectedValue = 0;
                          touchedOffset = null;
                        } else {
                          touchedIndex =
                              response.touchedSection!.touchedSectionIndex;
                          final section =
                              _buildSections(widget.publicspot)[touchedIndex];
                          selectedLabel = section.title.split(' ').first;
                          selectedValue = section.value;
                          touchedOffset = event.localPosition;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
            if (touchedOffset != null)
              Positioned(
                left: touchedOffset!.dx - 40,
                top: touchedOffset!.dy - 60,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$selectedLabel: ${selectedValue.toStringAsFixed(0)}%',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections(
      List<GetPopularPublicSpotModel> publicspot) {
    final isTouched = (int index) => index == touchedIndex;
    final colors = [
      Colors.lightBlue,
      Colors.orange,
      Colors.deepPurpleAccent,
      Colors.teal,
      Colors.purple,
    ];

    return List.generate(publicspot.length, (index) {
      final spot = publicspot[index];

      return PieChartSectionData(
        color: colors[index % colors.length],
        value: spot.percentage,
        title: '${spot.spotCode} ${spot.percentage}%',
        radius: isTouched(index) ? 50 : 40,
        titleStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colors[index % colors.length],
        ),
        titlePositionPercentageOffset: 1.8,
      );
    });
  }
}

class PositionedPieChart extends StatelessWidget {
  const PositionedPieChart({super.key, required this.publicspot});
  final List<GetPopularPublicSpotModel> publicspot;

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.orange,
      Colors.lightBlue,
      Colors.deepPurpleAccent,
      Colors.teal,
      Colors.purple,
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: List.generate(publicspot.length, (index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              publicspot[index].spotCode!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }),
    );
  }
}

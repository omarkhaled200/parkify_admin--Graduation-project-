import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_user_account_status.dart';

class AnimatedPieChartUserAccountstatus extends StatefulWidget {
  static String id = 'AnimatedPieChart';
  final GetUserAccountStatus status;

  const AnimatedPieChartUserAccountstatus({super.key, required this.status});
  @override
  _AnimatedPieChartUserAccountstatusState createState() =>
      _AnimatedPieChartUserAccountstatusState();
}

class _AnimatedPieChartUserAccountstatusState
    extends State<AnimatedPieChartUserAccountstatus> {
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
                  sections: _buildSections(widget.status),
                  centerSpaceRadius: 0,
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

                          // ✅ تحقق من أن touchedIndex صالح
                          final sections = _buildSections(widget.status);
                          if (touchedIndex >= 0 &&
                              touchedIndex < sections.length) {
                            final section = sections[touchedIndex];
                            selectedLabel = section.title;
                            selectedValue = section.value;
                            touchedOffset = event.localPosition;
                          }
                        }
                      });
                    },
                  ),
                ),
              ),
            ),

            // Tooltip Container
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
                      '${selectedLabel.split(' ').take(2).join(' ')}: ${selectedValue.toStringAsFixed(0)}%',
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

  List<PieChartSectionData> _buildSections(GetUserAccountStatus status) {
    final isTouched = (int index) => index == touchedIndex;

    return [
      PieChartSectionData(
        color: Colors.teal,
        value: (status.active ?? 0).toDouble(),
        title: 'Active Users  ${status.active}%',
        radius: isTouched(0) ? 90 : 80,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
        titlePositionPercentageOffset: 1.5,
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: (status.inactive ?? 0).toDouble(),
        title: 'Disabled Accounts ${status.inactive}%',
        radius: isTouched(1) ? 90 : 80,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
        titlePositionPercentageOffset: 1.5,
      ),
    ];
  }
}

class PositionedPieChartUserAccountstatus extends StatelessWidget {
  const PositionedPieChartUserAccountstatus({
    super.key,
    required this.status,
  });
  final GetUserAccountStatus status;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(12)),
            ),
            const Text(
              ' Active Users',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12)),
            ),
            const Text(
              ' Disabled Accounts',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

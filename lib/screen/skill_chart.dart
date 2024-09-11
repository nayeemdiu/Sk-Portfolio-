
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SkillsoftChat extends StatefulWidget {
  const SkillsoftChat({Key? key}) : super(key: key);

  @override
  State<SkillsoftChat> createState() => _SkillsoftChatState();
}

class _SkillsoftChatState extends State<SkillsoftChat>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<Map<String, dynamic>> skills = [
    {"skill": "Flutter", "percentage": 95, "color": Colors.blue},
    {"skill": "Dart", "percentage": 85, "color": Colors.green},
    {"skill": "Java", "percentage": 65, "color": Colors.red},
    {"skill": "C", "percentage": 75, "color": Colors.orange},
    {"skill": "SQLite", "percentage": 80, "color": Colors.purple},
    {"skill": "MVVM", "percentage": 75, "color": Colors.blueGrey},
    {"skill": "RESTful API", "percentage": 90, "color": Colors.teal},
    {"skill": "GitHub", "percentage": 70, "color": Colors.pink},
    {"skill": "OOP", "percentage": 90, "color": Colors.amber},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              "Skill Proficiency",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Arial',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 150, // Increased height for better visibility
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 100,
                      barGroups: skills
                          .asMap()
                          .entries
                          .map((entry) {
                        final index = entry.key;
                        final skill = entry.value;
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              y: skill['percentage'].toDouble() * _animation.value,
                              width: 20,
                              colors: [skill['color']],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        );
                      })
                          .toList(),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTitles: (value) => skills[value.toInt()]['skill'],
                          rotateAngle: 45,
                          margin: 20,
                          getTextStyles: (context, value) => const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTextStyles: (context, value) => const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        topTitles: SideTitles(showTitles: false),
                        rightTitles: SideTitles(showTitles: false),
                      ),
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(
                        show: true,
                        checkToShowHorizontalLine: (value) => value % 20 == 0,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey.withOpacity(0.2),
                            strokeWidth: 1,
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
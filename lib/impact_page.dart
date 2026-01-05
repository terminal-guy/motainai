import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:motainai/components/auto_rescue.dart';
import 'package:motainai/components/leaderboard.dart';
import 'package:motainai/components/local_hero.dart';
import 'package:motainai/components/today_imapct.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

class ImpactPage extends StatefulWidget {
  const ImpactPage({super.key});

  @override
  State<ImpactPage> createState() => _ImpactPageState();
}

class _ImpactPageState extends State<ImpactPage> {
  bool onLastPage = false;
  PageController _controller = PageController();
  PageController _historycontroller = PageController();

  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: const [
              Text(
                "MOTAINAI",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2); // change based on last page number
              });
            },
            controller: _controller,
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  // second image - forest action
                  Column(
                    children: [
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          height: 400,

                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 16,
                            right: 10,
                            left: 10,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFFFDF8F0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: SfCircularChart(
                            annotations: <CircularChartAnnotation>[
                              CircularChartAnnotation(
                                widget: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/illustrations/tree.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    const SizedBox(height: 6),
                                    const Text(
                                      '3kg left',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],

                            title: ChartTitle(
                              text: '3kg more to build this tree',
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            legend: Legend(
                              isVisible: true,
                              position: LegendPosition.bottom,
                              overflowMode: LegendItemOverflowMode.wrap,
                            ),
                            tooltipBehavior: _tooltipBehavior,
                            series: <CircularSeries>[
                              RadialBarSeries<GDPData, String>(
                                dataSource: _chartData,
                                xValueMapper: (GDPData data, _) =>
                                    data.continent,
                                yValueMapper: (GDPData data, _) => data.gdp,
                                pointColorMapper: (GDPData data, _) =>
                                    Colors.green.shade700,

                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                ),
                                enableTooltip: true,
                                maximumValue: 22.5,
                                radius: '90%',
                                innerRadius: '70%',
                                trackColor: Colors.grey,
                                strokeColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 12.0,
                          left: 12.0,
                          top: 20,
                        ),
                        child: TodaysImpactCard(),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 12.0,
                          left: 12.0,
                          top: 20,
                          bottom: 20,
                        ),
                        child: AutoRescueGoalsCard(),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 2,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.green.shade700,
                          dotColor: Colors.black26,
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 4,
                          spacing: 8,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: const Text(
                            'Swipe right to see your forest and friends',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),

              // second page for the pageview dumbass
              // second page for the pageview dumbass
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          height: 450,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDF8F0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(20),
                          child: PageView(
                            controller: _historycontroller,
                            children: [
                              MonthData(
                                imagepath:
                                    'assets/illustrations/first_month.png',
                                treenumber: 'Five Trees Saved',
                                carbonemissions:
                                    'Carbon Emissions Avoided 112.5kgCO₂e/kg',
                                monthandyear: '<- October 2025 ->',
                                Percentsaver:
                                    'You are Top 10% of the savers in October',
                              ),

                              MonthData(
                                imagepath:
                                    'assets/illustrations/second_month.png',
                                treenumber: 'Two Trees Saved',
                                carbonemissions:
                                    'Carbon Emissions Avoided 45kgCO₂e/kg',
                                monthandyear: '<- November 2025 ->',
                                Percentsaver:
                                    'You are Top 20% of the savers in November',
                              ),
                              MonthData(
                                imagepath:
                                    'assets/illustrations/third_month.png',
                                treenumber: 'Four Trees Saved',
                                carbonemissions:
                                    'Carbon Emissions Avoided 90kgCO₂e/kg',
                                monthandyear: '<- December 2025 ->',
                                Percentsaver:
                                    'You are Top 15% of the savers in December',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: LocalHeroCard(
                      name: 'David',
                      locationLabel: 'Beppu • This Month',
                      treesSaved: 11,
                      co2eKg: 247,
                      mealsRescued: 18,
                      streakDays: 6,
                    ),
                  ),
                  SizedBox(height: 16),
                  Leadershipforforest(),
                ],
              ),
            ],
          ),

          // second stack
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [GDPData('kgCO₂e Avoided', 15)];

    return chartData;
  }
}

class MonthData extends StatelessWidget {
  final String imagepath;
  final String treenumber;
  final String carbonemissions;
  final String monthandyear;
  final String Percentsaver;
  const MonthData({
    super.key,
    required this.imagepath,
    required this.treenumber,
    required this.carbonemissions,
    required this.monthandyear,
    required this.Percentsaver,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Text(
          monthandyear,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 25),
          child: Image.asset(imagepath),
        ),
        Text(
          treenumber,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        Text(
          carbonemissions,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.green.shade700,
          ),
        ),
        SizedBox(height: 12),
        _RankBadge(text: Percentsaver),
      ],
    );
  }
}

class _RankBadge extends StatelessWidget {
  final String text;
  const _RankBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4E4D6),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          color: Color(0xFFD88355),
          fontSize: 12,
        ),
      ),
    );
  }
}

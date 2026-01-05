import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:motainai/components/auto_rescue.dart';
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
              ListView(children: [
                  
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

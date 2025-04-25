import 'package:ecom/common/widgets/loader.dart';
import 'package:ecom/features/admin/models/sales.dart';
import 'package:ecom/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen
    extends StatefulWidget {
  const AnalyticsScreen({Key? key})
    : super(key: key);

  @override
  State<AnalyticsScreen>
  createState() =>
      _AnalyticsScreenState();
}

class _AnalyticsScreenState
    extends State<AnalyticsScreen> {
  final AdminServices adminServices =
      AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData =
        await adminServices.getEarnings(
          context,
        );
    totalSales =
        earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null ||
            totalSales == null
        ? const Loader()
        : Column(
          children: [
            Text(
              '\$$totalSales',
              style: const TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 250,
                width:
                    MediaQuery.of(
                      context,
                    ).size.width *
                    0.95,
                child: BarChart(
                  BarChartData(
                    alignment:
                        BarChartAlignment
                            .spaceAround,
                    maxY:
                        earnings!
                            .map(
                              (e) =>
                                  e.earning,
                            )
                            .reduce(
                              (a, b) =>
                                  a > b
                                      ? a
                                      : b,
                            ) *
                        1.2,
                    barGroups:
                        earnings!.asMap().entries.map((
                          entry,
                        ) {
                          final index =
                              entry.key;
                          final sale =
                              entry
                                  .value;
                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                toY:
                                    sale.earning.toDouble(),
                                color:
                                    Colors.blue,
                                width:
                                    20,
                                borderRadius:
                                    BorderRadius.circular(
                                      4,
                                    ),
                              ),
                            ],
                          );
                        }).toList(),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles:
                              true,
                          getTitlesWidget: (
                            value,
                            meta,
                          ) {
                            if (value.toInt() >=
                                    0 &&
                                value.toInt() <
                                    earnings!.length) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top:
                                      8.0,
                                ),
                                child: Text(
                                  earnings![value.toInt()]
                                      .label,
                                  style: const TextStyle(
                                    fontSize:
                                        12,
                                    color:
                                        Colors.black,
                                  ),
                                ),
                              );
                            }
                            return const Text(
                              '',
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles:
                              true,
                          reservedSize:
                              50,
                          getTitlesWidget: (
                            value,
                            meta,
                          ) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right:
                                    4.0,
                              ),
                              child: Text(
                                '\$${value.toInt()}',
                                style: const TextStyle(
                                  fontSize:
                                      10,
                                  color:
                                      Colors.black,
                                ),
                                textAlign:
                                    TextAlign.right,
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles:
                            SideTitles(
                              showTitles:
                                  false,
                            ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles:
                            SideTitles(
                              showTitles:
                                  false,
                            ),
                      ),
                    ),
                    gridData:
                        FlGridData(
                          show: true,
                        ),
                    borderData:
                        FlBorderData(
                          show: true,
                        ),
                  ),
                ),
              ),
            ),
          ],
        );
  }
}

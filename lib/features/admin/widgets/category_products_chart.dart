import 'package:ecom/features/admin/models/sales.dart';
import 'package:fl_chart/fl_chart.dart'
    as charts;
import 'package:flutter/material.dart';

class CategoryProductsChart
    extends StatelessWidget {
  final List<charts.BarChart>
  seriesList;
  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }
}

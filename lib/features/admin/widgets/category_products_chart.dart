// import 'package:ecom/features/admin/models/sales.dart';
// import 'package:fl_chart/fl_chart.dart'; // Import fl_chart
// import 'package:flutter/material.dart';

// class CategoryProductsChart
//     extends StatelessWidget {
//   // fl_chart uses BarChartGroupData instead of charts.Series
//   final List<BarChartGroupData>
//   barGroups;
//   // We also need the list of Sales data to get the labels for the x-axis
//   final List<Sales> salesData;

//   const CategoryProductsChart({
//     Key? key,
//     required this.barGroups,
//     required this.salesData, // Pass the original sales data
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         barGroups: barGroups,
//         // Add titles and labels for better readability
//         titlesData: FlTitlesData(
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 40,
//             ),
//           ),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 40,
//               getTitlesWidget:
//                   getBottomTitles,
//             ), // Custom function for bottom titles
//           ),
//           topTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: false,
//             ),
//           ),
//           rightTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: false,
//             ),
//           ),
//         ),
//         borderData: FlBorderData(
//           show: false,
//         ), // Hide borders
//         gridData: FlGridData(
//           show: false,
//         ), // Hide grid lines
//         // Optional: Add touch interactions
//         barTouchData: BarTouchData(
//           touchTooltipData: BarTouchTooltipData(
//             tooltipBgColor:
//                 Colors.blueGrey,
//             getTooltipItem: (
//               group,
//               groupIndex,
//               rod,
//               rodIndex,
//             ) {
//               // Display category label and earning on tooltip
//               final sales =
//                   salesData[groupIndex];
//               return BarTooltipItem(
//                 '${sales.label}\n',
//                 const TextStyle(
//                   color: Colors.white,
//                   fontWeight:
//                       FontWeight.bold,
//                 ),
//                 children: <
//                   BarTooltipItem
//                 >[
//                   BarTooltipItem(
//                     sales.earning
//                         .toString(),
//                     const TextStyle(
//                       color:
//                           Colors.yellow,
//                       fontWeight:
//                           FontWeight
//                               .w500,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//       // animate: true is handled by the widget itself
//     );
//   }

//   // Helper function to get bottom titles (category labels)
//   Widget getBottomTitles(
//     double value,
//     TitleMeta meta,
//   ) {
//     // The value corresponds to the index in the barGroups and salesData lists
//     final index = value.toInt();
//     const style = TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//       fontSize:
//           12, // Adjusted font size for potentially longer labels
//     );
//     Widget text;

//     // Ensure the index is within the bounds of the salesData list
//     if (index >= 0 &&
//         index < salesData.length) {
//       text = SideTitleWidget(
//         axisSide: meta.axisSide,
//         space: 4.0,
//         child: Text(
//           salesData[index].label,
//           style: style,
//         ),
//       );
//     } else {
//       // Fallback for unexpected index
//       text = SideTitleWidget(
//         axisSide: meta.axisSide,
//         space: 4.0,
//         child: Text(
//           '',
//           style: style,
//         ), // Empty text or a placeholder
//       );
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space:
//           16, // Adjust spacing as needed
//       child: text,
//     );
//   }
// }

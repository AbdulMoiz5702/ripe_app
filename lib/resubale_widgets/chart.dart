import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
 

  @override
  Widget build(BuildContext context) {
    var   theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.sizeOf(context).height * 0.37,
      width: MediaQuery.sizeOf(context).width * 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: MediaQuery.sizeOf(context).width * 0.05,
              top: MediaQuery.sizeOf(context).height * 0.06,
              child: largeText(title: '\$682.5',color: theme.primaryColor,textSize: 32.0,weight: FontWeight.w800)),
          Positioned(
            left: MediaQuery.sizeOf(context).width * 0.05,
            top: MediaQuery.sizeOf(context).height * 0.02,
            child: Row(
              children: [
                largeText(title: 'CURRENT BALANCE',color: theme.primaryColor,textSize: 12.0),
                CustomSized(width: 0.02,height: 0,),
                SvgPicture.asset(openEyeSVG,color: theme.primaryColor,),
              ],
            ),
          ),
          LineChart(
            mainData(context),
          ),
        ],
      ),
    );
  }


  LineChartData mainData(context) {
    var theme = Theme.of(context);
    return LineChartData(
      gridData:const  FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles:const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ) ,
        rightTitles:const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles:const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              TextStyle style = TextStyle(
                color: theme.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              );
              Widget text;
              switch (value.toInt()) {
                case 0:
                  text =  Text('Mar', style: style);
                  break;
                case 2:
                  text =  Text('Apr', style: style);
                  break;
                case 4:
                  text =  Text('May', style: style);
                  break;
                case 6:
                  text =  Text('Jun', style: style);
                  break;
                case 8:
                  text =  Text('Jul', style: style);
                  break;
                case 10:
                  text =  Text('Aug', style: style);
                  break;
                default:
                  text =  Text('', style: style);
                  break;
              }

              return SideTitleWidget(
                axisSide: meta.axisSide,
                space: 5,
                fitInside: const SideTitleFitInsideData(
                  enabled: true,
                  axisPosition: 0,
                  parentAxisSize: 30,
                  distanceFromEdge: 5,
                ),
                child: text,
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 9,
      lineBarsData: [
        LineChartBarData(
          color: theme.primaryColor,
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [theme.primaryColor,theme.primaryColor],
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.primaryColor.withOpacity(0.8),
                theme.primaryColor.withOpacity(0.4),
                theme.primaryColor.withOpacity(0.2),
                theme.primaryColor.withOpacity(0.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
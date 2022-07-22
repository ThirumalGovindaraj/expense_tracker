import 'dart:math';

import 'package:chart_task/chart/common/common_utils.dart';
import 'package:chart_task/chart/common/string_resources.dart';
import 'package:chart_task/chart/provider/chart_provider.dart';
import 'package:chart_task/helpers/alert_utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:chart_task/chart/model/expanse_response.dart';

import 'common/constants.dart';
import 'expandable_list_view.dart';
import 'model/category_statistic_list_response.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<ChartData>? data;

  @override
  void initState() {
    super.initState();
    fetchChartData();
    fetchCategory();
  }

  ExpensesProvider provider = ExpensesProvider();
  ExpansesResponse? expanseResponse;
  CategoryStatisticListResponse? categoryStatisticListResponse;
  bool isLoading = true;
  bool isLoadingCategory = true;
  List colors = [
    0xFF003f5c,
    0xFF58508d,
    0xFFbc5090,
    0xFFff6361,
    0xFFef5675,
    0xFFffa600
  ];
  Random random = Random();

  int index = 0;

  fetchChartData() async {
    data = [];
    dynamic response = await provider.getExpenseList();
    if (response is ExpansesResponse && response.status!) {
      expanseResponse = response;
      for (int i = 0; i < response.responseData!.length; i++) {
        data?.add(ChartData(
            response.responseData![i].name!,
            (response.responseData![i].amountSpent!).toDouble(),
            Color(colors[i])));
      }
      setState(() {
        isLoading = false;
      });
    } else {
      AlertUtils.showAlertDialog(context, title: "Error", body: response.me);
    }
  }

  fetchCategory() async {
    dynamic response = await provider.categoryList();
    if (response is CategoryStatisticListResponse && response.status!) {
      categoryStatisticListResponse = response;
      setState(() {
        isLoadingCategory = false;
      });
    } else {
      AlertUtils.showAlertDialog(context, title: "Error", body: response.me);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.grey.shade100,
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  height: MediaQuery.of(context).size.height / 3,
                  child: Card(
                    child: selectedChart(chartType),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        chartType = Constants.BAR;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.bar_chart,
                          color: chartType == Constants.BAR
                              ? Theme.of(context).primaryColor
                              : null,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          StringResources.barCharts,
                          style: TextStyle(
                            color: chartType == Constants.BAR
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    // sized box with width 10
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        chartType = Constants.PIE;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.pie_chart,
                          color: chartType == Constants.PIE
                              ? Theme.of(context).primaryColor
                              : null,
                        ),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text(
                          StringResources.pieCharts,
                          style: TextStyle(
                            color: chartType == Constants.PIE
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    // sized box with width 10
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        chartType = Constants.DONUT;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.donut_large,
                          color: chartType == Constants.DONUT
                              ? Theme.of(context).primaryColor
                              : null,
                        ),
                        const SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text(
                          StringResources.donutCharts,
                          style: TextStyle(
                            color: chartType == Constants.DONUT
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              if (!isLoadingCategory)
                const SizedBox(
                  height: 25,
                ),
              if (!isLoadingCategory)
                Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 4,right: 4),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          StringResources.topCategories,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              if (!isLoadingCategory)
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: MediaQuery.of(context).size.height * 1.2,
                    //width: MediaQuery.of(context).size.width / 2.2,
                    child: ExpandableListView(
                      list: categoryStatisticListResponse!.responseData!,
                    ))
            ]))));
  }

  Widget _donutChart() {
    return SfCircularChart(
        legend: Legend(isVisible: true, position: LegendPosition.right),
        series: <CircularSeries>[
          // Renders doughnut chart

          DoughnutSeries<ChartData, String>(
              enableTooltip: true,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              dataSource: data,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]);
  }

  Widget _pieChart() {
    return SfCircularChart(
        legend: Legend(isVisible: true, position: LegendPosition.right),
        series: <CircularSeries>[
          // Render pie chart

          PieSeries<ChartData, String>(
              enableTooltip: true,
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => data.color,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              name: 'Data')
        ]);
  }

  String chartType = Constants.DONUT;

  Widget selectedChart(String chartType) {
    if (chartType == Constants.PIE) {
      return _pieChart();
    } else if (chartType == Constants.BAR) {
      return _barChart();
    } else if (chartType == Constants.DONUT) {
      return _donutChart();
    } else {
      return Center(
        child: CommonUtils.loadingWidget(),
      );
    }
  }

  Widget _barChart() {
    return SizedBox(
        child: SfCartesianChart(
            // margin: const EdgeInsets.only(left: 50),
            primaryXAxis: CategoryAxis(),
            // legend: Legend(isVisible: true, position: LegendPosition.right),
            series: <CartesianSeries>[
          ColumnSeries<ChartData, String>(
              dataSource: data!,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => data.color,
// width: MediaQuery.of(context).size.width,
              spacing: 0.5,
              // width: 200,
              // borderWidth: 1,
              // borderColor: Colors.black38,
              // borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
              /* emptyPointSettings: EmptyPointSettings(
                  mode: EmptyPointMode.average,
                  color: Colors.red,
                  borderColor: Colors.black,
                  borderWidth: 1),*/
              // Duration of series animation
              animationDuration: 1000),
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double? y;
  final Color? color;
}

/*
*   PopupMenuButton<int>(
                      itemBuilder: (context) => [
                        // popupmenu item 1
                        PopupMenuItem(
                          value: 1,
                          onTap: () {
                            setState(() {
                              chartType = Constants.BAR;
                            });
                          },
                          // row has two child icon and text.
                          child: Row(
                            children: const [
                              Icon(Icons.bar_chart),
                              SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              Text("Bar Chart")
                            ],
                          ),
                        ),
                        // popupmenu item 2
                        PopupMenuItem(
                          value: 2,
                          onTap: () {
                            setState(() {
                              chartType = Constants.PIE;
                            });
                          },
                          child: ,
                        ),
                        PopupMenuItem(
                          value: 3,
                          onTap: () {
                            setState(() {
                              chartType = Constants.DONUT;
                            });
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.donut_small),
                              SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              Text("Donut Chart")
                            ],
                          ),
                        ),
                      ],
                      offset: const Offset(0, 30),
                      color: Colors.white,
                      elevation: 1,
                    )
* */

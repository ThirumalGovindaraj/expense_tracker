import 'dart:convert';

import 'package:chart_task/chart/model/category_statistic_list_response.dart';
import 'package:chart_task/chart/model/expanse_response.dart';
import 'package:chart_task/chart/model/sub_category_list_response.dart';
import 'package:chart_task/chart/model/sub_category_statistic_response.dart';
import 'package:chart_task/chart/provider/chart_endpoint.dart';
import 'package:chart_task/helpers/webservice_helper.dart';

abstract class ExpensesInterface {
  Future<dynamic> categoryList();

  Future<dynamic> subCategoryList(
      {required Map payload});
  Future<dynamic> getExpenseList(
      );
}

class ExpensesProvider implements ExpensesInterface {
  final WebServiceHelper _helper = WebServiceHelper();

  @override
  Future categoryList() async {
    // var body = json.encode(payload);
    dynamic response = await _helper
        .post(ChartEndPoint.getCategoryStatisticsURL(), );
    return CategoryStatisticListResponse.fromJson(response);
  }

  @override
  Future subCategoryList(
      {required Map payload}) async {
    var body = json.encode(payload);
    dynamic response = await _helper
        .post(ChartEndPoint.getSubCategoryStatisticsURL(), body: body);
    return SubCategoryStatisticListResponse.fromJson(response);
  }

  @override
  Future getExpenseList()async {
    dynamic response = await _helper
        .get(ChartEndPoint.getExpenseListURL(),);
    return ExpansesResponse.fromJson(response);
  }
  Future getSubCategoryList()async {
    dynamic response = await _helper
        .get(ChartEndPoint.getSubCategoryListURL(),);
    return SubCategoryListResponse.fromJson(response);
  }
}

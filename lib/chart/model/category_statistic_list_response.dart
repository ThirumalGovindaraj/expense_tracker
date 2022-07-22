import 'package:chart_task/chart/model/sub_category_statistic_response.dart';

class CategoryStatisticListResponse {
  final bool? status;
  final String? message;
  final List<ResponseData>? responseData;

  CategoryStatisticListResponse({
    this.status,
    this.message,
    this.responseData,
  });

  CategoryStatisticListResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        responseData = (json['responseData'] as List?)?.map((dynamic e) => ResponseData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'responseData' : responseData?.map((e) => e.toJson()).toList()
  };
}

class ResponseData {
  final int? amountSpent;
  final int? categoryId;
  final String? categoryName;
   List<SubResponseData>? responseData;

  ResponseData({
    this.amountSpent,
    this.categoryId,
    this.categoryName,
  });

  ResponseData.fromJson(Map<String, dynamic> json)
      : amountSpent = json['AmountSpent'] as int?,
        categoryId = json['CategoryId'] as int?,
        categoryName = json['CategoryName'] as String?;

  Map<String, dynamic> toJson() => {
    'AmountSpent' : amountSpent,
    'CategoryId' : categoryId,
    'CategoryName' : categoryName
  };
}
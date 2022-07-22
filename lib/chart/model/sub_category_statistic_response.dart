class SubCategoryStatisticListResponse {
  final bool? status;
  final String? message;
  final List<SubResponseData>? responseData;

  SubCategoryStatisticListResponse({
    this.status,
    this.message,
    this.responseData,
  });

  SubCategoryStatisticListResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        responseData = (json['responseData'] as List?)?.map((dynamic e) => SubResponseData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'responseData' : responseData?.map((e) => e.toJson()).toList()
  };
}

class SubResponseData {
  final int? amountSpent;
  final int? subCategoryId;
  final String? subCategoryName;

  SubResponseData({
    this.amountSpent,
    this.subCategoryId,
    this.subCategoryName,
  });

  SubResponseData.fromJson(Map<String, dynamic> json)
      : amountSpent = json['AmountSpent'] as int?,
        subCategoryId = json['SubCategoryId'] as int?,
        subCategoryName = json['SubCategoryName'] as String?;

  Map<String, dynamic> toJson() => {
    'AmountSpent' : amountSpent,
    'SubCategoryId' : subCategoryId,
    'SubCategoryName' : subCategoryName
  };
}
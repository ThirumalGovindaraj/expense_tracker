class SubCategoryListResponse {
  final bool? status;
  final String? message;
  final List<SubResponseData>? responseData;

  SubCategoryListResponse({
    this.status,
    this.message,
    this.responseData,
  });

  SubCategoryListResponse.fromJson(Map<String, dynamic> json)
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
  final int? subCategoryId;
  final int? categoryId;
  final String? subCategoryName;
  final int? isDeleted;
  final String? categoryName;

  SubResponseData({
    this.subCategoryId,
    this.categoryId,
    this.subCategoryName,
    this.isDeleted,
    this.categoryName,
  });

  SubResponseData.fromJson(Map<String, dynamic> json)
      : subCategoryId = json['SubCategoryId'] as int?,
        categoryId = json['CategoryId'] as int?,
        subCategoryName = json['SubCategoryName'] as String?,
        isDeleted = json['IsDeleted'] as int?,
        categoryName = json['CategoryName'] as String?;

  Map<String, dynamic> toJson() => {
    'SubCategoryId' : subCategoryId,
    'CategoryId' : categoryId,
    'SubCategoryName' : subCategoryName,
    'IsDeleted' : isDeleted,
    'CategoryName' : categoryName
  };
}
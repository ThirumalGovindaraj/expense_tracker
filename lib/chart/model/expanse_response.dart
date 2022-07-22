class ExpansesResponse {
  final bool? status;
  final String? message;
  final List<ResponseData>? responseData;

  ExpansesResponse({
    this.status,
    this.message,
    this.responseData,
  });

  ExpansesResponse.fromJson(Map<String, dynamic> json)
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
  final int? customerExpenseId;
  final int? customerId;
  final int? categoryId;
  final int? subCategoryId;
  final int? amountSpent;
  final String? expenseDate;
  final int? isDeleted;
  final String? name;
  final String? phone;
  final String? email;
  final String? categoryName;
  final String? subCategoryName;

  ResponseData({
    this.customerExpenseId,
    this.customerId,
    this.categoryId,
    this.subCategoryId,
    this.amountSpent,
    this.expenseDate,
    this.isDeleted,
    this.name,
    this.phone,
    this.email,
    this.categoryName,
    this.subCategoryName,
  });

  ResponseData.fromJson(Map<String, dynamic> json)
      : customerExpenseId = json['CustomerExpenseId'] as int?,
        customerId = json['CustomerId'] as int?,
        categoryId = json['CategoryId'] as int?,
        subCategoryId = json['SubCategoryId'] as int?,
        amountSpent = json['AmountSpent'] as int?,
        expenseDate = json['ExpenseDate'] as String?,
        isDeleted = json['IsDeleted'] as int?,
        name = json['Name'] as String?,
        phone = json['Phone'] as String?,
        email = json['Email'] as String?,
        categoryName = json['CategoryName'] as String?,
        subCategoryName = json['SubCategoryName'] as String?;

  Map<String, dynamic> toJson() => {
    'CustomerExpenseId' : customerExpenseId,
    'CustomerId' : customerId,
    'CategoryId' : categoryId,
    'SubCategoryId' : subCategoryId,
    'AmountSpent' : amountSpent,
    'ExpenseDate' : expenseDate,
    'IsDeleted' : isDeleted,
    'Name' : name,
    'Phone' : phone,
    'Email' : email,
    'CategoryName' : categoryName,
    'SubCategoryName' : subCategoryName
  };
}
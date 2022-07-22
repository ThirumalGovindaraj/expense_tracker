class ChartEndPoint {
  ChartEndPoint._();

  static String getCategoryStatisticsURL() {
    return APIConfiguration.baseURL +
        "/api/" +
        APIConfiguration.Version +
        "/master/CategoryStatistics";
  }

  static String getSubCategoryStatisticsURL() {
    return APIConfiguration.baseURL +
        "/api/" +
        APIConfiguration.Version +
        "/master/SubCategoryStatistics";
  } static String getExpenseListURL() {
    return APIConfiguration.baseURL +
        "/api/" +
        APIConfiguration.Version +
        "/master/ExpenseList";
  }static String getSubCategoryListURL() {
    return APIConfiguration.baseURL +
        "/api/" +
        APIConfiguration.Version +
        "/master/SubCategoryList";
  }
}

class APIConfiguration {
  static const Version = "v1.0";
  static String baseURL = "http://65.1.73.181:3001";
}

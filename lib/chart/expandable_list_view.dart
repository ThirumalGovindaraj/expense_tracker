import 'package:chart_task/chart/common/common_utils.dart';
import 'package:chart_task/chart/common/image_utils.dart';
import 'package:chart_task/chart/provider/chart_provider.dart';
import 'package:chart_task/chart/widgets/category_row_item.dart';
import 'package:chart_task/helpers/alert_utils.dart';
import 'package:flutter/material.dart';

import 'model/category_statistic_list_response.dart';
import 'model/sub_category_list_response.dart';

class ExpandableListView extends StatefulWidget {
  final List<ResponseData>? list;

  const ExpandableListView({Key? key, required this.list}) : super(key: key);

  @override
  State<ExpandableListView> createState() => ExpandableListViewState();
}

class ExpandableListViewState extends State<ExpandableListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        padding: EdgeInsets.only(left: 4,right: 4),
        primary: false,
        shrinkWrap: true,
        itemCount: widget.list!.length,
        itemBuilder: (context, i) {
          return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: ExpansionTile(
                trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                maintainState: true,
                initiallyExpanded: selectedCategoryId == widget.list![i].categoryId!,
                onExpansionChanged: (expanded) {
                  if (expanded) {
                    selectedCategoryId = widget.list![i].categoryId!;
                    if (subCategoryListResponse == null) {
                      fetchCategory(widget.list![i].categoryId!, i);
                    } else {
                      setState(() {
                        isLoadingCategory = false;
                      });
                    }
                  }
                },
                title: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageUtils.travel,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                       CategoryRowItem(categoryName: widget.list![i].categoryName!.toUpperCase(), categoryAmount: widget.list![i].amountSpent.toString())
                      ],
                    ),
                  ],
                ),
                children: <Widget>[
                  isLoadingCategory
                      ? CommonUtils.loadingWidget()
                      : Column(
                          children: _buildExpandableContent(
                              subCategoryListResponse!.responseData!,
                              widget.list![i].categoryId!),
                        ),
                ],
              ));
        },
      ),
    );
  }

  bool isLoadingCategory = true;
  SubCategoryListResponse? subCategoryListResponse;

  fetchCategory(int categoryId, int index) async {
    ExpensesProvider provider = ExpensesProvider();
    dynamic response = await provider.getSubCategoryList();
    if (response is SubCategoryListResponse && response.status!) {
      subCategoryListResponse = response;
      setState(() {
        isLoadingCategory = false;
      });
    } else {
      AlertUtils.showAlertDialog(context,
          title: "Error", body: response.message, successClick: () {
        Navigator.pop(context);
      });
    }
  }

  int selectedCategoryId = 0;

  _buildExpandableContent(
      List<SubResponseData> subCategory, int selectedCategoryId) {
    List<Widget> columnContent = [];

    for (SubResponseData content in subCategory) {
      if (content.categoryId == selectedCategoryId) {
        columnContent.add(
          SizedBox(
              height: 40,
              child:ListTile(
            title: Text(
              content.subCategoryName!,
              style: const TextStyle(fontSize: 18.0),
            ),
            //leading: Icon(),
          )),
        );
      }
    }

    return columnContent;
  }
}

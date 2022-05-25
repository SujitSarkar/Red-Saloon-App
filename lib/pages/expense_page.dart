import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:red_saloon/controller/public_controller.dart';
import 'package:red_saloon/variables/color_variable.dart';
import '../util/decoration.dart';
import '../util/expense_list_tile.dart';
import '../variables/config.dart';
import '../variables/variable.dart';
import '../widgets/color_button.dart';
import '../widgets/loading_widget.dart';

class AllExpensePage extends StatefulWidget {
  const AllExpensePage({Key? key}) : super(key: key);

  @override
  State<AllExpensePage> createState() => _AllExpensePageState();
}

class _AllExpensePageState extends State<AllExpensePage> {

  DateTime _fromDate = DateTime.now();
  DateTime _toDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    if (PublicController.pc.expenseList.value.data == null) {
      await PublicController.pc.getExpenseList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(builder: (pc) {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                'Expense',
                style: StDecoration.boldTextStyle,
              ),
              backgroundColor: AllColor.appBgColor,
              elevation: 0.0,
              titleSpacing: 0.0,
              iconTheme: IconThemeData(color: Colors.grey.shade800),
              actions: [
                IconButton(
                    onPressed: () async {
                      pc.loading(true);
                      pc.update();
                      await pc.getExpenseList();
                      pc.loading(false);
                      pc.update();
                    },
                    icon: Icon(
                      LineAwesomeIcons.alternate_redo,
                      size: dSize(.065),
                    )),
                IconButton(
                    onPressed: () {
                      _showSearchDialog(pc);
                    },
                    icon: Icon(
                      LineAwesomeIcons.search,
                      size: dSize(0.065),
                    ))
              ],
            ),
            body: _bodyUI(pc),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(
                  vertical: dSize(.02), horizontal: dSize(.05)),
              decoration: BoxDecoration(
                  color: AllColor.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dSize(.03)),
                      topRight: Radius.circular(dSize(.03)))),
              child: Row(
                children: [
                  Text(
                    "Total Expense",
                    style: StDecoration.boldTextStyle
                        .copyWith(color: Colors.white),
                  ),
                  Expanded(
                      child: Text(
                    '${pc.expenseList.value.data != null ? pc.expenseList.value.data!.length : ''}',
                    textAlign: TextAlign.end,
                    style: StDecoration.boldTextStyle
                        .copyWith(color: Colors.white),
                  ))
                ],
              ),
            ),
          ),
          if (pc.loading.value) const LoadingWidget()
        ],
      );
    });
  }

  Widget _bodyUI(PublicController pc) => RefreshIndicator(
      onRefresh: () async => await pc.getExpenseList(),
      backgroundColor: Colors.white,
      child: pc.expenseList.value.data != null
          ? pc.expenseList.value.data!.isNotEmpty
          ?ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: dSize(.04), vertical: dSize(.02)),
              itemCount: pc.expenseList.value.data!.length,
              itemBuilder: (context, index) => ExpenceListTile(
                  elistModel: pc.expenseList.value.data![index]),
              separatorBuilder: (context, index) =>
                  SizedBox(height: dSize(0.04))):const Center(child: Text('Not Found'))
          : Container());

  void _showSearchDialog(PublicController pc) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              scrollable: true,
              insetPadding: EdgeInsets.all(dSize(.04)),
              contentPadding: EdgeInsets.all(dSize(.04)),
              title: Text('Search Expense',
                  textAlign: TextAlign.center,
                  style: StDecoration.boldTextStyle),
              content: StatefulBuilder(builder: (context, setState) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ///From Date
                      InkWell(
                        onTap: () async {
                          await _selectFromDate();
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(dSize(.025)),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: Colors.blueGrey, width: 0.5)),
                          child: Row(
                            children: [
                              Text('From: ', style: StDecoration.boldTextStyle),
                              Expanded(
                                  child: Text(DateFormat('dd-MMM-yyyy').format(_fromDate),
                                      style: StDecoration.normalTextStyle)),
                              Icon(LineAwesomeIcons.calendar, size: dSize(.07))
                            ],
                          ),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      SizedBox(height: dSize(.06)),

                      ///To Date
                      InkWell(
                        onTap: () async {
                          await _selectToDate();
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(dSize(.025)),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: Colors.blueGrey, width: 0.5)),
                          child: Row(
                            children: [
                              Text('To: ', style: StDecoration.boldTextStyle),
                              Expanded(
                                  child: Text(DateFormat('dd-MMM-yyyy').format(_toDate),
                                      style: StDecoration.normalTextStyle)),
                              Icon(LineAwesomeIcons.calendar, size: dSize(.07))
                            ],
                          ),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      SizedBox(height: dSize(.06)),

                      !pc.loading.value
                          ? ColorTextButton(
                              onPressed: () async {
                                setState((){});
                                Map<String,String> map = {
                                  'fromDate': DateFormat('yyyy-MM-dd').format(_fromDate),
                                  'toDate': DateFormat('yyyy-MM-dd').format(_toDate),
                                };
                                await pc.searchExpenseList(map);

                                setState((){});
                                Get.back();
                              },
                              text: 'Search',
                              minimumSize: Size(dSize(.45), dSize(.1)),
                            )
                          : const CircularProgressIndicator()
                    ],
                  ),
                );
              }),
            ));
  }

  Future<void> _selectFromDate() async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _fromDate,
        firstDate: DateTime(2021),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() => _fromDate = selectedDate);
    } else {
      showToast('কোনো তারিখ নির্বাচন করা হয়নি');
    }
  }

  Future<void> _selectToDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _toDate,
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() => _toDate = selectedDate);
    } else {
      showToast('কোনো তারিখ নির্বাচন করা হয়নি');
    }
  }
}

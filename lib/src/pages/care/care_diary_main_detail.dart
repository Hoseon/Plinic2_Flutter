import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/pages/care/components/calendar.dart';
import 'package:plinic2/src/pages/care/components/calendar_month.dart';
import 'package:plinic2/src/pages/care/components/month_caretime_detail.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CareDiaryMainDetailPage extends StatelessWidget {
  const CareDiaryMainDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('사용내역 상세'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MonthCareTimeDetailPage(
              month: '07',
              chartValue: 3,
              totalRank: '1',
            ),
            MonthCareTimeDetailPage(
              month: '06',
              chartValue: 4,
              totalRank: '2',
            ),
            MonthCareTimeDetailPage(
              month: '07',
              chartValue: 3,
              totalRank: '1',
            ),
            MonthCareTimeDetailPage(
              month: '06',
              chartValue: 4,
              totalRank: '2',
            ),
          ],
        ),
      ),
    );
  }
}

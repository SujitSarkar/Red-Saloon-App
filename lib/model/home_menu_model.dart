import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomeMenuModel{
  String title;
  IconData icon;
  Color color;
  HomeMenuModel({required this.title,required this.icon, required this.color});

  static List<HomeMenuModel> homeMenuDataList = [
    HomeMenuModel(title: 'Dashboard', icon: LineAwesomeIcons.alternate_tachometer, color: Colors.purple),
    HomeMenuModel(title: 'Booking', icon: LineAwesomeIcons.users, color: Colors.orange),
    HomeMenuModel(title: 'Sales', icon: LineAwesomeIcons.user_plus, color: Colors.lightBlue),
    HomeMenuModel(title: 'Customers', icon: LineAwesomeIcons.folder_plus, color: Colors.lightGreen),
    HomeMenuModel(title: 'Suppliers', icon: LineAwesomeIcons.download, color: Colors.purple),
    HomeMenuModel(title: 'Services', icon: LineAwesomeIcons.coins, color: Colors.orange),
    HomeMenuModel(title: 'Products', icon: LineAwesomeIcons.layer_group, color: Colors.lightBlue),
    HomeMenuModel(title: 'Expense', icon: LineAwesomeIcons.plus_circle, color: Colors.lightGreen),
    HomeMenuModel(title: 'Categories', icon: LineAwesomeIcons.dollar_sign, color: Colors.purple),
    HomeMenuModel(title: 'Stocks', icon: LineAwesomeIcons.dolly_flatbed, color: Colors.orange),
    HomeMenuModel(title: 'Manage Purchase', icon: LineAwesomeIcons.user_check, color: Colors.lightBlue),
    HomeMenuModel(title: 'Payment', icon: LineAwesomeIcons.hand_holding_us_dollar, color: Colors.lightGreen),
    HomeMenuModel(title: 'User|Admin', icon: LineAwesomeIcons.signal, color: Colors.purple),
    HomeMenuModel(title: 'Report', icon: LineAwesomeIcons.signal, color: Colors.purple),
    HomeMenuModel(title: 'Daily Report', icon: LineAwesomeIcons.signal, color: Colors.purple),
    HomeMenuModel(title: 'লগ আউট', icon: LineAwesomeIcons.alternate_sign_out, color: Colors.red),
  ];

  static List<HomeMenuModel> dashboardDataList = [
  HomeMenuModel(title: 'আজকের মোট বিক্রয়\n(পরিমাণ/অর্থ)\n0কেজি/0টাকা', icon: LineAwesomeIcons.dollar_sign, color: const Color(0xff007BFF)),
  HomeMenuModel(title: 'বর্তমান মাসের মোট বিক্রয়\n(পরিমাণ/অর্থ)\n0কেজি/0টাকা', icon: LineAwesomeIcons.dollar_sign, color: const Color(0xff11CDEF)),
  HomeMenuModel(title: 'আজকের মোট ক্রয়\n(পরিমাণ/অর্থ)\n0কেজি/0টাকা', icon: LineAwesomeIcons.shopping_cart, color: const Color(0xff2DCE89)),
  HomeMenuModel(title: 'বর্তমান মাসের মোট ক্রয়\n(পরিমাণ/অর্থ)\n0কেজি/0টাকা', icon: LineAwesomeIcons.shopping_cart, color: const Color(0xff343A40)),
  HomeMenuModel(title: 'আজকের মোট বকেয়া\n(পরিমাণ/অর্থ)\n0কেজি/0টাকা', icon: LineAwesomeIcons.dollar_sign, color: const Color(0xffDF2DE3)),
  HomeMenuModel(title: 'বর্তমান মাসের মোট পাওনা\n(পরিমাণ/অর্থ)\n0কেজি/0টাকা', icon: LineAwesomeIcons.dollar_sign, color: const Color(0xffFB6340)),
  HomeMenuModel(title: 'মোট কাস্টমার\n0', icon: LineAwesomeIcons.users, color: const Color(0xffF5365C)),
  HomeMenuModel(title: 'মোট সাপ্লায়ার\n0', icon: LineAwesomeIcons.user_plus, color: const Color(0xffCAD900))];

}
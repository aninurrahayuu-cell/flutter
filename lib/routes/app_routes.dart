import 'package:project_flutter/listgridview/Grid.dart';
import 'package:project_flutter/pages/about_page.dart';
import 'package:project_flutter/pages/home_page.dart';
import 'package:project_flutter/listgridview/DetailScreen.dart';
import 'package:project_flutter/listgridview/ListScreen.dart';
import 'package:project_flutter/row_column/ColumnWidget.dart';
import 'package:project_flutter/row_column/RowColumnWidget.dart';
import 'package:project_flutter/row_column/RowWidget.dart';
import 'package:project_flutter/sized_box/ExpendedWidget.dart';
import 'package:project_flutter/sized_box/SizedBoxWidget.dart';
import 'package:project_flutter/sized_box/StackWidget.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const gridProduct = '/grid-product-page';
  static const about = '/about';
  static const detail = '/article-detail-screen';
  static const list = '/article-list-screen';
  static const column = '/column-widget';
  static const rowcolum = '/row-column-widget';
  static const row  = '/row-widget';
  static const expanded = '/expended-widget';
  static const sizedbox = '/sizedbox-widget';
  static const stack = '/stack-widget';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    gridProduct: (context) => GridProductPage(),
    about: (context) => AboutPage(),
    detail: (context) => ArticleDetailScreen(
      data: {
        'image' : 'https://png.pngtree.com/png-clipart/20240812/original/pngtree-cute-panda-standing-with-happy-expression-png-image_15762144.png',
        'description' : 'panda'
      }
    ),
    list:(context) => ArticleListScreen(),
    column:(context) => ColumnWidget(),
    rowcolum:(context) => RowColumnWidget(),
    row:(context) => RowWidget(),
    expanded:(context) => ExpendedWidget(),
    sizedbox:(context) => SizedBoxWidget(),
    stack:(context) => StackWidget(),
  };
}
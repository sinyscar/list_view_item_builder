import 'package:list_view_item_builder/list_view_item_builder.dart';
import 'package:flutter/material.dart';

class QListViewTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QListViewTest();
}

class _QListViewTest extends State<QListViewTest> {
  ListViewItemBuilder _itemBuilder;

  @override
  void initState() {
    super.initState();
    _itemBuilder = ListViewItemBuilder(
      rowCountBuilder: (section) => 5,
      sectionCountBuilder: () => 2,
      sectionHeaderBuilder: _headerBuilder,
      sectionFooterBuilder: _footerBuilder,
      itemsBuilder: _itemsBuilder,
      itemOnTap: _itemOnTap,
      itemShouldTap: _itemShouldTap,
      headerWidgetBuilder: (ctx) =>
          _widgetBuilder('HeaderWidget', Colors.green, height: 80),
      footerWidgetBuilder: (ctx) =>
          _widgetBuilder('FooterWidget', Colors.green, height: 80),
      loadMoreWidgetBuilder: (ctx) =>
          _widgetBuilder('LoadMoreWidget', Colors.lightBlue, height: 80),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: _itemBuilder.itemBuilder,
      itemCount: _itemBuilder.itemCount,
      padding: const EdgeInsets.all(0),
    );
  }

  bool _itemShouldTap(BuildContext context, int section, int index) {
    return index != 0;
  }

  void _itemOnTap(BuildContext context, int section, int index) {
    print('clicked: section: ${section.toString()},index:${index.toString()}');
  }

  Widget _itemsBuilder(BuildContext context, int section, int index) {
    return _widgetBuilder(
        'Item:section=${section.toString()},index=${index.toString()}',
        Colors.white70);
  }

  Widget _headerBuilder(BuildContext context, int section) {
    return _widgetBuilder(
        'SectionHeader:section = ${section.toString()}', Colors.yellow,
        height: 30);
  }

  Widget _footerBuilder(BuildContext context, int section) {
    return _widgetBuilder(
        'SectionFooter:section = ${section.toString()}', Colors.orange,
        height: 30);
  }

  Widget _widgetBuilder(String text, Color color, {double height}) {
    return Container(
      height: height ?? 44,
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
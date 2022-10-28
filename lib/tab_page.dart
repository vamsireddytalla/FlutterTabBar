import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  List<String> tabItems = [
    'OPEN',
    'CONTACTED & MEETING FIXED',
    'PROPOSITION PRESENTED',
    'PRE-FIXED APPOINTMENT',
    'FOLLOW-UP',
    'CONVERTED',
    'NOT INTERESTED',
    'NOT CONTACTABLE',
    'ALL'
  ];
  late TabController tabController;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: tabItems.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {
        print(tabController.index);
        // _scrollController.move(tabController.index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: tabItems.length,
      child: Scaffold(
        body: SizedBox(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: TabBar(
                  //onTap: (index) => _scrollController.move(index),
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.orangeAccent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.red,
                  tabs: List<Widget>.generate(
                    tabItems.length,
                    (int index) {
                      return Tab(text: tabItems[index]);
                    },
                  ),
                ),
              ),
              /* const SizedBox(
                child: TabBarView(children: [Text('data')]),
              ) */
            ],
          ),
        ),
      ),
    );
  }
}

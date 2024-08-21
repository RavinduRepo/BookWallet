import 'package:book_wallert/functions/global_user_provider.dart';
import 'package:book_wallert/screens/history_screens/history_list_list_view.dart';
import 'package:flutter/material.dart';
import 'package:book_wallert/colors.dart';
import 'package:book_wallert/widgets/buttons/selection_bar.dart';

class HistoryListScreenBody extends StatefulWidget {
  final int globalUserId;
  const HistoryListScreenBody({
    super.key,
    required this.globalUserId,
  });

  @override
  State<HistoryListScreenBody> createState() {
    // returns a screen as state
    return _HistoryListScreenBodyState();
  }
}

class _HistoryListScreenBodyState extends State<HistoryListScreenBody>
    with SingleTickerProviderStateMixin {
  // ''with ticker'' is to make sure connnection between clicking and swiping
  late TabController _tabController;

  // add name to buttons on panel
  final List<String> _tabNames = [
    'All',
    'Reviews',
    'Books',
    'Profiles',
    // 'Groups'
  ];

  @override
  void initState() {
    // Tab controller
    super.initState();
    _tabController = TabController(
        length: _tabNames.length,
        vsync: this); // animation details are mentioned here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // making the screen body
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        toolbarHeight: 1,
        backgroundColor: MyColors.bgColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: // adding the selection bar widget
              SelectionBar(tabController: _tabController, tabNames: _tabNames),
        ),
      ),
      body: TabBarView(
        // adding corrosponding screens to each button on SelectionBar.
        controller: _tabController,
        children: [
          HistoryListViewAll(),
          HistoryListViewReviews(userId: globalUser!.userId),
          HistoryListViewBooks(userId: globalUser!.userId),
          HistoryListViewUser(userId: globalUser!.userId)
        ],
      ),
    );
  }
}
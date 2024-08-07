import 'package:book_wallert/colors.dart';
import 'package:book_wallert/models/review_model.dart';
import 'package:book_wallert/screens/review_screens/review_screen_details.dart';
import 'package:book_wallert/screens/review_screens/review_screen_list.dart';
import 'package:book_wallert/widgets/buttons/selection_bar.dart';
import 'package:flutter/material.dart';

class ReviewScreenBody extends StatefulWidget {
  final ReviewModel review;
  final int index;
  const ReviewScreenBody({super.key, required this.review, this.index = 0});

  @override
  State<ReviewScreenBody> createState() {
    return _ReviewScreenBodyState();
  }
}

class _ReviewScreenBodyState extends State<ReviewScreenBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  final List<String> _tabNames = ['Comment', 'Like', 'Share'];

  final double scrollThreshold = 300;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabNames.length, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= scrollThreshold &&
        !_scrollController.position.outOfRange) {
      _scrollController.jumpTo(scrollThreshold);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.index = widget.index;
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Stack(
        children: [
          Center(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: ReviewScreenDetails(review: widget.review),
                ),
                SliverToBoxAdapter(
                  child: SelectionBar(
                    tabController: _tabController,
                    tabNames: _tabNames,
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ReviewScreenListView(
                          reviewId: widget.review.reviewId,
                          screenName: 'Comment'),
                      ReviewScreenListView(
                          reviewId: widget.review.reviewId, screenName: 'Like'),
                      ReviewScreenListView(
                          reviewId: widget.review.reviewId, screenName: 'Share')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

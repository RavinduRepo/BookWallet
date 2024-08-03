import 'package:book_wallert/colors.dart';
import 'package:flutter/material.dart';

class UserProfileReviewListView extends StatefulWidget {
  final int userId;

  const UserProfileReviewListView({super.key, required this.userId});

  @override
  State<UserProfileReviewListView> createState() => _UserProfileReviewListViewState();
}

class _UserProfileReviewListViewState extends State<UserProfileReviewListView> {
  @override
  Widget build(BuildContext context) {
    // Fetch reviews based on the userId and display them
    // Placeholder implementation for now
    return Center(
      child: Text(
        'Reviews for user ID: ${widget.userId}',
        style: TextStyle(color: MyColors.selectedItemColor),
      ),
    );
  }
}

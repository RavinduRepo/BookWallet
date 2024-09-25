import 'package:book_wallert/colors.dart';
import 'package:book_wallert/controllers/BookStatusController.dart';
import 'package:book_wallert/controllers/review_comments_controller.dart';
import 'package:book_wallert/controllers/review_delete_controller.dart';
import 'package:book_wallert/controllers/saved_controller.dart';
import 'package:book_wallert/controllers/wishlist_controller.dart';
import 'package:book_wallert/functions/global_navigator_functions.dart';
import 'package:book_wallert/functions/global_user_provider.dart';
import 'package:book_wallert/models/review_model.dart';
import 'package:book_wallert/screens/main_screen/book_profile_screen/book_profile_screen_body.dart';
import 'package:book_wallert/services/BookStatusService.dart';
import 'package:book_wallert/services/wishlist_api_service.dart';
import 'package:book_wallert/widgets/buttons/comment_button.dart';
import 'package:book_wallert/widgets/buttons/custom_popup_menu_buttons_dynamic.dart';
import 'package:book_wallert/widgets/buttons/like_button.dart';
import 'package:book_wallert/widgets/buttons/share_button.dart';
import 'package:book_wallert/widgets/cards/rating_bar.dart';
import 'package:flutter/material.dart';

class ReviewScreenDetails extends StatefulWidget {
  final ReviewModel review;

  const ReviewScreenDetails({super.key, required this.review});

  @override
  State<ReviewScreenDetails> createState() {
    return _ReviewScreenDetailsState();
  }
}

class _ReviewScreenDetailsState extends State<ReviewScreenDetails> {
  bool _isComment = false;
  List<String> items = [
    'Save Review',
    'Add this book to wishlist',
  ];

  void _handleCommentChanged(bool value) {
    setState(() {
      _isComment = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ReviewDeleteController reviewDeleteController =
        ReviewDeleteController(widget.review.reviewId, widget.review.userId);
    final savedController = SavedController(globalUser!.userId);
    final bookStatusController = BookStatusController(BookStatusService());
    final WishlistController wishlistController =
        WishlistController(WishlistApiService());

    // Function to handle the logic when popup is opened
    Future<bool> onOpened(List<String> text) async {
      try {
        // Check the book ID before proceeding
        await bookStatusController.checkBookStatus(
            globalUser!.userId, widget.review.bookId);

        // Modify the popup items based on the fetched status
        if (bookStatusController.isInWishlist) {
          text[1] =
              'Remove this book from wishlist'; // Modify the wishlist text
        } else {
          text[1] = 'Add this book to wishlist';
        }

        if (await savedController.isReviewSaved(widget.review.reviewId)) {
          text[0] = 'Remove from saved'; // Modify the save text
        } else {
          text[0] = 'Save Review';
        }

        if (widget.review.userId == globalUser!.userId) {
          text[2] = 'Delete Review';
        }

        return true;
      } catch (e) {
        print('Error in onOpened: $e');
        return false;
      }
    }

    return Stack(
      children: [
        Center(
          child: Card(
            color: MyColors.bgColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      screenChange(context,
                          BookProfileScreenBody(bookId: widget.review.bookId));
                    },
                    child: SizedBox(
                      width: 80,
                      child: Image.network(widget.review.imagePath,
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      screenChange(context,
                          BookProfileScreenBody(bookId: widget.review.bookId));
                    },
                    child: Text(
                      widget.review.bookName,
                      style: const TextStyle(
                          color: MyColors.textColor, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Author: ${widget.review.authorName}',
                    style: const TextStyle(
                        color: MyColors.textColor, fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.review.context,
                    style: const TextStyle(
                        color: MyColors.textColor, fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Reviewed by: ${widget.review.reviwerName}',
                    style: const TextStyle(
                        color: MyColors.textColor, fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  RatingBar(rating: widget.review.rating),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LikeButton(
                            review: widget.review,
                            icon: Icons.thumb_up,
                            likesCount: widget.review.likesCount),
                        CommentButton(
                          review: widget.review,
                          icon: Icons.comment,
                          isComment: _isComment,
                          commentsCount: widget.review.commentsCount,
                          onCommentChanged: _handleCommentChanged,
                        ),
                        ShareButton(
                            review: widget.review,
                            icon: Icons.share,
                            sharesCount: widget.review.sharesCount),
                      ],
                    ),
                  ),
                  if (_isComment) _buildTextInput(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: CustomPopupMenuButtonsDynamic(
            onOpened: onOpened, // Call the function to handle logic when opened
            items: widget.review.userId == globalUser!.userId
                ? items + ['Delete Review']
                : items, // Pass the items list dynamically
            onItemTap: [
              () async {
                // save or remove
                if (await savedController
                    .isReviewSaved(widget.review.reviewId)) {
                  savedController.removeReviewFromSaved(
                      context, widget.review.reviewId);
                } else {
                  savedController.insertReviewToSaved(
                      context, widget.review.reviewId);
                }
              },
              () {
                //add wishlist and remove wishlist
                if (bookStatusController.isInWishlist) {
                  wishlistController
                      .removeBookFromWishlist(context, widget.review.bookId);
                } else {
                  wishlistController.addBookToWishlist(
                      context, widget.review.bookId);
                }
              },
              () {
                if (widget.review.userId == globalUser!.userId) {
                  // delete function
                  reviewDeleteController.deleteReview(context);
                }
              },
            ],
            icon: const Icon(
              Icons.more_vert_rounded,
              color: MyColors.nonSelectedItemColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextInput() {
    // Create an instance of CommentController
    final commentController = CommentController(widget.review.reviewId);

    return GestureDetector(
      onTap: () {
        // Prevent the outer GestureDetector from closing the input
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 32.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: MyColors.panelColor,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: MyColors.bgColor,
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentController
                            .commentController, // Use the controller from CommentController
                        style: const TextStyle(color: MyColors.textColor),
                        minLines: 1,
                        maxLines: 10, // Set a maximum number of lines
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: MyColors.text2Color),
                          hintText: 'Write your comment...',
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                      ),
                    ),
                    IconButton(
                      color: MyColors.selectedItemColor,
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        // Call the addComment method from CommentController
                        final commentText =
                            commentController.commentController.text;

                        if (commentText.isNotEmpty) {
                          try {
                            await commentController.addComment(context);
                            setState(() {
                              _isComment = false;
                            });
                          } catch (e) {
                            print('Error adding comment: $e');
                          }
                        } else {
                          print('Comment cannot be empty');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:book_wallert/widgets/buttons/custom_popup_menu_buttons.dart';
import 'package:book_wallert/widgets/cards/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:book_wallert/models/review_model.dart';
import 'package:book_wallert/colors.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Card(
            color: MyColors.panelColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("hello");
                        },
                        child: SizedBox(
                          //height: 120,
                          width: 80,
                          child: Image.asset(
                            review.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Container(
                                color: MyColors.text2Color,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                print("hello");
                              },
                              child: Text(
                                review.bookName,
                                style: const TextStyle(
                                  color: MyColors.textColor,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Text(
                              'Author: ${review.authorName}',
                              style: const TextStyle(
                                color: MyColors.text2Color,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const Divider(color: MyColors.nonSelectedItemColor),
                            Text(
                              review.context,
                              style: const TextStyle(
                                color: MyColors.textColor,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Text(
                            'Rating: ',
                            style: TextStyle(
                              color: MyColors.text2Color,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RatingBar(rating: review.rating),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => {print('hello')},
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Reviewed by: ${review.reviwerName}',
                              style: const TextStyle(
                                color: MyColors.textColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/Book_Image1.jpg'),
                              radius: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 10),
                  const Divider(color: MyColors.nonSelectedItemColor),
                  SizedBox(
                    height: 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          color: MyColors.nonSelectedItemColor,
                          iconSize: 20,
                          onPressed: () {
                            // like function
                          },
                        ),
                        Transform.translate(
                          offset: const Offset(-20, 0),
                          child: const Text(
                            '100',
                            style: TextStyle(color: MyColors.text2Color),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.comment_rounded),
                          color: MyColors.nonSelectedItemColor,
                          iconSize: 20,
                          onPressed: () {
                            // comment function
                          },
                        ),
                        Transform.translate(
                          offset: const Offset(-20, 0),
                          child: const Text(
                            '100',
                            style: TextStyle(color: MyColors.text2Color),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.share),
                          color: MyColors.nonSelectedItemColor,
                          iconSize: 20,
                          onPressed: () {
                            // share function
                          },
                        ),
                        Transform.translate(
                          offset: const Offset(-20, 0),
                          child: const Text(
                            '100',
                            style: TextStyle(color: MyColors.text2Color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: CustomPopupMenuButtons(
              items: const [
                'Add this book to Wishlist',
                'Save review',
              ],
              onItemTap: [
                // Item actions
                () {},
                () {},
              ],
              icon: const Icon(
                Icons.more_vert_rounded,
                color: MyColors.nonSelectedItemColor,
              )),
        )
      ],
    );
  }
}
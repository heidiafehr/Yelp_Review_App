import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../restaurant_class.dart';
import '../../yelp_review_app.dart';

class CardRestaurantInfo extends StatelessWidget {
  final Restaurant singleRestaurant;

  const CardRestaurantInfo({required this.singleRestaurant, Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.only(
          top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
              context, '/detailed_restaurant_view_screen',
              arguments: singleRestaurant.apiAlias);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    .3,
                height:
                MediaQuery.of(context).size.width *
                    .3,
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(10.0),
                  child: Image.network(
                      fit: BoxFit.cover,
                      singleRestaurant
                          .image),
                ),
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.width *
                    .3,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context)
                            .size
                            .width *
                            .51,
                        child: Text(
                          singleRestaurant
                              .name,
                          style: const TextStyle(
                              fontSize: 17.5,
                              fontFamily: 'LoraRegular'),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(singleRestaurant
                              .price),
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                left: 8.0),
                            child: Text(singleRestaurant
                                .categories
                                .first
                                .restaurantType),
                          ),
                        ],
                      ),
                      RatingBarIndicator(
                        rating: singleRestaurant
                            .rating
                            .toDouble(),
                        itemBuilder: (context, index) =>
                        const YelpStarIcon(),
                        itemCount: singleRestaurant
                            .rating
                            .toInt(),
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../../../core/component/custom_text.dart';
import '../../../../../../../core/utilis/constants/colors.dart';




class BuildFavoritesItem extends StatelessWidget {
  final String urlImage;
  final String hotelName;
  final String city;
  final String day;
  final String location;
  final String price;
  final double initialRating;

  const BuildFavoritesItem(
      {Key? key,
      required this.urlImage,
      required this.hotelName,
      required this.city,
      required this.day,
      required this.location,
      required this.price,
      required this.initialRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.darkGrey
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlImage),
              ),
            ),
          ),
          const SizedBox(width: 4,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 7,),
              CustomText(
                text: hotelName,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                color: AppColors.white,
              ),
              const SizedBox(height: 4,),
              CustomText(
                text: '$day, $city',
                fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.grey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20,),
              Row(
                children:  [
                  const Icon(Icons.location_on,color: AppColors.teal,size: 16,),
                  CustomText(
                    text: location,
                    fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.grey,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 8,),
                  CustomText(
                    text: '\$$price',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.white,
                  ),
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                children: [
                  // RatingBar.builder(
                  //   initialRating: initialRating,
                  //   minRating: 0,
                  //   direction: Axis.horizontal,
                  //   allowHalfRating: true,
                  //   itemCount: 5,
                  //   itemBuilder: (context, _) => const Icon(
                  //     Icons.star,
                  //     color: AppColors.teal,
                  //   ),
                  //   onRatingUpdate: (rating) {
                  //   },
                  //   itemSize: 20,
                  // ),
                  const SizedBox(width: 30,),
                  const CustomText(
                    text: '/per night',
                    fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.grey,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

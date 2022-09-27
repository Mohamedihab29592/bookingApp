import 'package:booking_app/core/component/others.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'build_favorites_item.dart';
import 'package:booking_app/features/home/presentation/screens/trips/presentation/screens/view_hotel_details.dart';


class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({Key? key}) : super(key: key);

  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  @override
  void initState() {
    HomeCubit.get(context).getCancelledBooking();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var upcomingItem = HomeCubit.get(context);
        if (state is GetCancelBookingDataSuccessState) {
          if (upcomingItem.cancelledModel!.bookingData.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      navigateTo(context: context, widget: ViewHotelDetails());
                    },
                    child: BuildFavoritesItem(
                      urlImage: (upcomingItem.cancelledModel!.bookingData[index].hotel!.images.isNotEmpty)? '$imageBaseUrl${upcomingItem.cancelledModel!.bookingData[index].hotel!.images[0].image}' : 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/25/d2/f1/44/exterior.jpg?w=1100&h=-1&s=1',
                      hotelName: upcomingItem
                          .cancelledModel!.bookingData[index].hotel!.name
                          .toString(),
                      city: upcomingItem
                          .cancelledModel!.bookingData[index].hotel!.address
                          .toString(),
                      day: 'Sunday',
                      location: '$index.0km to ${upcomingItem
                          .cancelledModel!.bookingData[index].hotel!.name}',
                      price: upcomingItem
                          .cancelledModel!.bookingData[index].hotel!.price
                          .toString(),
                      initialRating: index + .5,
                    ),
                  );
                },
                itemCount: upcomingItem.cancelledModel!.bookingData.length,
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  Image(
                    image: const AssetImage(
                      'assets/images/empty.png',
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  const Text(
                    'No Booking Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            );
          }
        } else {
          return const Center(child: CupertinoActivityIndicator(color: AppColors.white,));
        }
      },
    );


  }
}

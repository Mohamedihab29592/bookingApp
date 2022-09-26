import 'package:booking_app/core/component/custom_button.dart';
import 'package:booking_app/core/component/custom_text.dart';
import 'package:booking_app/features/home/presentation/screens/trips/presentation/widgets/favorites_widget.dart';

import 'package:flutter/material.dart';



import '../../../../../../../core/utilis/constants/colors.dart';
import '../widgets/finished_widget.dart';
import '../widgets/upcoming_widget.dart';

class TripsScreen extends StatefulWidget {

  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final List<Widget>screens=[
    const UpcomingWidget(),
    const FinishedWidget(),
    const FavoritesWidget(),
  ];

  int currentScreen=1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const CustomText(text: 'My Trip',fontSize: 22,fontWeight: FontWeight.bold,color: AppColors.white,),
              const SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.darkGrey
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          setState(() {
                            currentScreen=0;
                          });
                        },
                        child: CustomText(
                          text: 'Upcoming',
                          fontSize: 16,
                          fontWeight: currentScreen==0?FontWeight.w800:FontWeight.bold,
                          color: currentScreen==0?AppColors.teal:AppColors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          setState(() {
                            currentScreen=1;
                          });
                        },
                        child:  CustomText(
                          text: 'Finished',
                          fontSize: 16,
                          fontWeight: currentScreen==1?FontWeight.w800:FontWeight.bold,
                          color: currentScreen==1?AppColors.teal:AppColors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          setState(() {
                            currentScreen=2;
                          });
                        },
                        child: CustomText(
                          text: 'Favorites',
                          fontSize: 16,
                          fontWeight: currentScreen==2?FontWeight.w800:FontWeight.bold,
                          color: currentScreen==2?AppColors.teal:AppColors.grey,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 10,),
              screens[currentScreen],
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedIndex = -1;
  double _rating = 0.0;

  void updateRating(double newRating) {
    setState(() {
      _rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailsState detail = state as DetailsState;
      return SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'http://mark.bslmeiyu.com/uploads/${detail.place.img}'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 70,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<AppCubits>(context).goHome();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 320,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ).copyWith(top: 30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: detail.place.name,
                          size: 22,
                          // 'Yosemite',
                        ),
                        AppLargeText(
                          text: "\$ ${detail.place.price}",
                          // "\$ 250",
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                          color: AppColors.mainColor,
                        ),
                        AppText(
                          text: "  ${detail.place.location}",
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // const Text('rating'),
                    Row(
                      children: [
                        RatingBar.builder(
                            allowHalfRating: true,
                            direction: Axis.horizontal,
                            // unratedColor: Colors.white,
                            itemSize: 20,
                            itemCount: 5,
                            initialRating: detail.place.stars.toDouble(),
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            onRatingUpdate: (value) {
                              setState(() {
                                updateRating(value);
                              });
                            }),
                        AppText(
                          text: detail.place.stars.toDouble().toString(),
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    AppLargeText(
                      text: 'People',
                      size: 20,
                    ),
                    const SizedBox(height: 5),
                    AppText(text: "Number of people in your group"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            void changeSelection() {
                              setState(() {
                                _selectedIndex = index;
                              });
                            }

                            return InkWell(
                              onTap: changeSelection,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: _selectedIndex == index
                                        ? Colors.black
                                        : Colors.grey[200],
                                    //AppColors.textColor2,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: AppLargeText(
                                  text: (index + 1).toString(),
                                  size: 22,
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                )),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 30),
                    AppLargeText(
                      text: "Description",
                      size: 26,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                        text:
                            //  "Yosemite National Park is located in central Sierra Nevada in the US state of California. It is located near the wild protected areas.",
                            detail.place.description),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.mainColor, width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: AppColors.mainColor,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.mainColor),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(width: 25),
                                AppLargeText(
                                  text: "Book Trip Now",
                                  size: 18,
                                  color: Colors.white,
                                ),
                                Image.asset(
                                  'assets/images/button-one.png',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      );
    }));
  }
}

part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

enum categoryType { breakfast, lunch, dinner }

class _FoodPageState extends State<FoodPage> {
  categoryType selectedId;

  @override
  void initState() {
    selectedId = categoryType.breakfast;
    super.initState();
  }

  void setIndex(id) {
    setState(() {
      selectedId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight - 2 * defaultMargin,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            color: Colors.transparent,
            height: 65,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resep mamah',
                      style: titleStyle.copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Icon(
                    EvaIcons.search,
                    color: fontColor,
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8),
                width: double.infinity,
                height: screenHeight - 150,
                // color: fontColor,
                child: BlocBuilder<FoodCubit, FoodState>(
                  builder: (_, state) => (state is FoodLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.foods
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            left: (e == state.foods.first)
                                                ? defaultMargin + 35
                                                : 0,
                                            right: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            print("Details");
                                            Get.to(
                                              DetailsPage(
                                                food: e,
                                                onBackPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                            );
                                          },
                                          child: FoodCard(e),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : CustomLoading(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: screenWidth * 0.18,
                  height: 500,
                  margin: EdgeInsets.only(top: 50, bottom: 50),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: fontColor, blurRadius: 3),
                      ],
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: GestureDetector(
                          onTap: () {
                            setIndex(categoryType.breakfast);
                          },
                          child: CustomText(
                            text: "Breakfast",
                            textColor: selectedId == categoryType.breakfast
                                ? secondColorDark
                                : fontColor,
                            textWeight: FontWeight.bold,
                            textSize: 16,
                          ),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: GestureDetector(
                          onTap: () {
                            setIndex(categoryType.lunch);
                          },
                          child: CustomText(
                              text: "Lunch",
                              textColor: selectedId == categoryType.lunch
                                  ? secondColorDark
                                  : fontColor,
                              textWeight: FontWeight.bold,
                              textSize: 16),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: GestureDetector(
                          onTap: () {
                            setIndex(categoryType.dinner);
                          },
                          child: CustomText(
                              text: "Dinner",
                              textColor: selectedId == categoryType.dinner
                                  ? secondColorDark
                                  : fontColor,
                              textWeight: FontWeight.bold,
                              textSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

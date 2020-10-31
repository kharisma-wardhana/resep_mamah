part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 550,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: "foodImage" + food.name,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 10,
                      color: Colors.blueGrey[300],
                    ),
                  ],
                ),
                child: Image(
                  image: NetworkImage(food.picturePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
            width: 200,
            child: Center(
              child: Text(
                food.name,
                style: titleStyle.copyWith(
                    decoration: TextDecoration.none,
                    fontSize: 30,
                    fontWeight: FontWeight.w100),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: CustomRating(food.rate),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Text(
              food.description,
              style: infoStyle.copyWith(
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

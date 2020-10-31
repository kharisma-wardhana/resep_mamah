part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavBar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 50,
              height: 50,
              child: (selectedIndex == 0)
                  ? Icon(
                      EvaIcons.home,
                      color: fontColor,
                    )
                  : Icon(
                      EvaIcons.homeOutline,
                      color: Colors.grey,
                    ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 83),
                child: (selectedIndex == 1)
                    ? Icon(
                        Icons.favorite_rounded,
                        color: fontColor,
                      )
                    : Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.grey,
                      )),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 50,
              height: 50,
              child: (selectedIndex == 2)
                  ? Icon(
                      Icons.person_rounded,
                      color: fontColor,
                    )
                  : Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

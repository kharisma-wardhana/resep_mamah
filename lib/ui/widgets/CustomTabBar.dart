part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabBar({@required this.titles, this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: "F2F2F2".toColor(),
          ),
          Row(
            children: titles
                .map((e) => Padding(
                      padding: EdgeInsets.only(left: defaultMargin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (onTap != null) {
                                onTap(titles.indexOf(e));
                              }
                            },
                            child: Text(
                              e,
                              style: (titles.indexOf(e) == selectedIndex)
                                  ? titleStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: secondColorDark)
                                  : infoStyle,
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 3,
                            margin: EdgeInsets.only(top: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: (titles.indexOf(e) == selectedIndex)
                                    ? secondColorDark
                                    : Colors.transparent),
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

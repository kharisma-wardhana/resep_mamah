part of 'widgets.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey[300].withOpacity(0.4),
                Colors.white.withOpacity(0.2),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: LottieBuilder.asset("assets/animations/loading.json"),
          ),
        )
      ],
    );
  }
}

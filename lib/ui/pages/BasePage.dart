part of 'pages.dart';

class BasePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackPressed;
  final Widget child;
  final Color backgroundColor;
  final bool isLoading;

  BasePage(
      {this.title = "Title",
      this.subtitle = "Subtitle",
      this.onBackPressed,
      this.child,
      this.backgroundColor,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
            child: Container(
          color: backgroundColor ?? Colors.blueGrey[100],
        )),
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    width: double.infinity,
                    height: 100,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        onBackPressed != null
                            ? GestureDetector(
                                onTap: () {
                                  if (onBackPressed != null) {
                                    onBackPressed();
                                  }
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 26),
                                  child: Icon(EvaIcons.arrowBackOutline),
                                ),
                              )
                            : SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (title != null)
                                ? Text(
                                    title,
                                    style: titleStyle.copyWith(fontSize: 22),
                                  )
                                : SizedBox(),
                            (subtitle != null)
                                ? Text(
                                    subtitle,
                                    style: infoStyle.copyWith(fontSize: 16),
                                  )
                                : SizedBox(),
                          ],
                        )
                      ],
                    ),
                  ),
                  child ?? SizedBox()
                ],
              ),
            ],
          ),
        ),
        isLoading ? CustomLoading() : SizedBox()
      ],
    ));
  }
}

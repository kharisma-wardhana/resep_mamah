part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String btnTitle1;
  final String btnTitle2;
  final Function btnTapAction1;
  final Function btnTapAction2;

  IllustrationPage(
      {@required this.title,
      @required this.subtitle,
      @required this.picturePath,
      @required this.btnTapAction1,
      this.btnTapAction2,
      @required this.btnTitle1,
      this.btnTitle2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(picturePath),
              ),
            ),
          ),
          Text(
            title,
            style: titleStyle,
          ),
          Text(
            subtitle,
            style: titleStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: RaisedButton(
              onPressed: btnTapAction1,
              color: secondColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                btnTitle1,
                style: infoStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          (btnTapAction2 == null)
              ? SizedBox()
              : SizedBox(
                  width: 200,
                  height: 45,
                  child: RaisedButton(
                    onPressed: btnTapAction2,
                    color: fontColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      btnTitle2 ?? 'title',
                      style: infoStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

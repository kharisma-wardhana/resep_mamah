part of 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackbtn;
  final List<Widget> widgets;

  @override
  Size get preferredSize => new Size.fromHeight(50.0);

  const CustomAppBar(
      {Key key, this.title, this.showBackbtn = false, this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
        text: title,
        textColor: fontColor,
        textSize: titleSize,
        textWeight: FontWeight.bold,
      ),
      elevation: 0.0,
      bottomOpacity: 0,
      leading:
          showBackbtn ? Icon(Icons.arrow_back_ios, color: mainColorDark) : null,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      actions: widgets,
    );
  }
}

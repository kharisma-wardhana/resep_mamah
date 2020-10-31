part of 'widgets.dart';

class CustomRating extends StatelessWidget {
  final double rate;

  CustomRating(this.rate);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();

    return Row(
      children: List<Widget>.generate(
              5,
              (index) => Icon(
                    (index < numberOfStars)
                        ? EvaIcons.star
                        : EvaIcons.starOutline,
                    size: 16,
                    color: secondColorDark,
                  )) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: infoStyle.copyWith(
                decoration: TextDecoration.none,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
    );
  }
}

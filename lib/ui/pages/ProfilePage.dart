part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                height: 220,
                margin: EdgeInsets.only(bottom: defaultMargin),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/icons/photo_border.png'))),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: ((context.bloc<UserCubit>().state
                                                as UserLoaded)
                                            .user
                                            .picturePath !=
                                        null)
                                    ? NetworkImage((context
                                            .bloc<UserCubit>()
                                            .state as UserLoaded)
                                        .user
                                        .picturePath)
                                    : AssetImage("assets/icons/photo.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Text(
                      (context.bloc<UserCubit>().state as UserLoaded).user.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        color: secondColorDark,
                      ),
                    ),
                    Text(
                      (context.bloc<UserCubit>().state as UserLoaded)
                          .user
                          .email,
                      style: infoStyle.copyWith(fontWeight: FontWeight.w300),
                    )
                  ],
                )),
            //// Body
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ["Account", "Resep mamah"],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: ((selectedIndex == 0)
                            ? [
                                'Edit Profile',
                                'Security',
                              ]
                            : [
                                'Rate App',
                                'Help Center',
                                'Privacy & Policy',
                                'Term & Condition'
                              ])
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: 16,
                                  left: defaultMargin,
                                  right: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e,
                                    style: infoStyle,
                                  ),
                                  SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Icon(EvaIcons.arrowIosForward))
                                ],
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ],
    );
  }
}

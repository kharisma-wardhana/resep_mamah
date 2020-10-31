part of 'pages.dart';

class OnboardPage extends StatefulWidget {
  final int initialPage;
  OnboardPage({this.initialPage = 0});

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int currentPage = 0;
  bool isLastIndex = false;
  PageController pageController;

  List<Map<String, String>> onboardData = [
    {
      "title": "Craving for something?",
      "text": "We ready to take your daily food needs\nto the next level.",
      "image": "assets/images/food_wishes.png"
    },
    {
      "title": "Craving for something?",
      "text": "We ready to take your daily food needs\n to the next level.",
      "image": "assets/images/love_burger.png"
    },
    {
      "title": "Craving for something?",
      "text": "We ready to take your daily food needs\n to the next level.",
      "image": "assets/icons/cook.jpg"
    },
  ];

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // gunakan resizetoavoidbottominset=false utk menghindari overflow dibottom dikarenakan ada object yg muncul dari bawah/bottom seperti keyboard yg bisa muncul ketika kita mau input sesuatu di textfield, jika tidak di set false, ada kemungkinan akan overflow dibottom walau ketika tidak ada keyboard itu tidak overflow, utk jaga2, jika perlu, pasang paramater resizetoavoid ini. perlu dingat juga, jika dalam halamana yg mau dipasang resize ini ada listviewnya, maka resize ini tidak perlu dipasang. karena akan kontraproduktif
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 4,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                    isLastIndex = currentPage >= 2;
                  });
                },
                itemCount: onboardData.length,
                itemBuilder: (context, index) => SplashContent(
                  title: onboardData[index]["title"],
                  subtitle: onboardData[index]["text"],
                  image: onboardData[index]["image"],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onboardData.length,
                            (index) => buildDot(index: index))),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: isLastIndex
                            ? () {
                                Get.off(SignInPage());
                              }
                            : () {
                                setState(() {
                                  currentPage += 1;
                                });
                                pageController.jumpToPage(currentPage);
                              },
                        color: isLastIndex ? secondColor : fontColor,
                        child: Text(isLastIndex ? "Get Started" : "Continue",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot({int index}) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 15 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? mainColor : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  SplashContent({this.title, this.subtitle, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: <Widget>[
            // note: BACKDROP
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fitWidth)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.65 + 10,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0, 1),
                      end: Alignment(0, 0.03),
                      colors: [Colors.white, Colors.white.withOpacity(0)])),
            ),
          ],
        ),
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.white,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
          child: Column(
            children: [
              Container(
                height: 25,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0, 1),
                        end: Alignment(0, 0.9),
                        colors: [Colors.white, Colors.white.withOpacity(0)])),
              ),
              Text(title,
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: secondColorDark)),
              SizedBox(height: 30),
              Text(
                subtitle,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: fontColor,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

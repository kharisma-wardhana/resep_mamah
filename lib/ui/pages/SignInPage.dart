part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Sign In",
      subtitle: "Dapatkan dan bagikan resep terbaik\ndari mama",
      isLoading: isLoading,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
              child: Text(
                "Email Address",
                style: infoStyle,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                controller: emailController,
                validator: (text) {
                  return validateEmail(text);
                },
                decoration:
                    inputStyle.copyWith(hintText: 'Type your email address'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                "Password",
                style: infoStyle,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLines: 1,
                      validator: (text) {
                        return validatePassword(text);
                      },
                      obscureText: !isShowPassword,
                      controller: passwordController,
                      decoration:
                          inputStyle.copyWith(hintText: "Type your password"),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      child: Icon(
                        isShowPassword ? EvaIcons.eye : EvaIcons.eyeOff,
                        color: fontColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: RaisedButton(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: secondColorDark,
                child: Text(
                  "Sign In",
                  style: infoStyle.copyWith(color: Colors.white),
                ),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  if (_formKey.currentState.validate()) {
                    await context
                        .bloc<UserCubit>()
                        .signIn(emailController.text, passwordController.text);
                    UserState state = context.bloc<UserCubit>().state;
                    if (state is UserLoaded) {
                      context.bloc<FoodCubit>().getFoods();
                      Get.offNamed('/main');
                    } else {
                      Get.snackbar("", "",
                          duration: Duration(milliseconds: 1500),
                          margin: EdgeInsets.only(top: 20, left: 8, right: 8),
                          backgroundColor: "D9435E".toColor(),
                          snackPosition: SnackPosition.TOP,
                          icon: Icon(
                            EvaIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Sign In Failed",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          messageText: Text(
                            "Please check your input data again",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ));
                    }
                    setState(() {
                      isLoading = false;
                    });
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: RaisedButton(
                onPressed: () {
                  Get.toNamed('/signup');
                },
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: fontColor,
                child: Text(
                  'Create New Account',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

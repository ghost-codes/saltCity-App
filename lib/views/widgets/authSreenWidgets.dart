import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:saltcity_app/core/viewModels/authViewModel.dart';

class WelcomeScreen extends StatelessWidget {
  AuthViewModel model;
  WelcomeScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastLinearToSlowEaseIn,
      duration: Duration(milliseconds: 1000),
      color: Colors.white,
      transform: Matrix4.translationValues(0, -model.getStartedOffset, 1),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/Scribbles.png',
                fit: BoxFit.fill,
                color: Colors.grey.withOpacity(0.12),
              )),
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 32.0,
              right: 32.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  greeting(),
                  logoAndButtons(),
                  // aboutUs(context: context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container logoAndButtons() {
    return Container(
      padding: EdgeInsets.only(top: 69.0, bottom: 32.0),
      child: Column(children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 97,
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 34.0),
          child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffff354F52),
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              child: FlatButton(
                onPressed: () {
                  model.setPageState(model.pageState == 0 ? 1 : 0);
                  print(model.pageState);
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }

  Column greeting() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Hello',
        style: TextStyle(
          fontSize: 29.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        'Welcome!',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}

class LocalCarousel extends StatelessWidget {
  final AuthViewModel model;

  LocalCarousel(this.model);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: model.windowHeight * 0.37,
            child: Stack(children: [
              Carousel(
                images: [
                  Image.asset('assets/images/fun 1.jpg',
                      fit: BoxFit.cover,
                      color: Color(0xffff354F52).withOpacity(0.3),
                      colorBlendMode: BlendMode.multiply),
                  Image.asset('assets/images/fun 2.jpg',
                      fit: BoxFit.cover,
                      color: Color(0xffff354F52).withOpacity(0.3),
                      colorBlendMode: BlendMode.multiply),
                  Image.asset(
                    'assets/images/fun 3.jpg',
                    fit: BoxFit.cover,
                    color: Color(0xffff354F52).withOpacity(0.3),
                    colorBlendMode: BlendMode.multiply,
                  ),
                ],
                dotBgColor: Colors.transparent,
              ),
              Container()
            ]),
          )
        ],
      ),
    );
  }
}

class InputFields extends StatelessWidget {
  final AuthViewModel model;

  InputFields(this.model);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: KeyboardVisibilityBuilder(
          builder: (context, bool keyboardVisibility) {
        return Stack(
          children: <Widget>[
            createAccount(keyboardVisibility),
            login(keyboardVisibility),
          ],
        );
      }),
    );
  }

  Widget login(bool keyboardVisibility) {
    return AnimatedContainer(
      // height: model.windowHeight * 0.72,
      curve: Curves.easeInOut,
      duration: Duration(
        milliseconds: 1000,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      transform: Matrix4.translationValues(
          0, keyboardVisibility ? 40 : model.loginHeight, 0),
      child: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/Scribbles.png',
                fit: BoxFit.fill,
                color: Colors.grey.withOpacity(0.15),
              )),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(),
                                labelText: "Name",
                                icon: Icon(Icons.person)),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Phone",
                                icon: Icon(Icons.phone_android)),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: "Email",
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffff354F52),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32))),
                            child: FlatButton(
                              onPressed: () {
                                model
                                    .setPageState(model.pageState == 0 ? 1 : 0);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have an account?  ',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.setPageState(1);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xffff354F52),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createAccount(bool keyboardVisibility) {
    return AnimatedContainer(
      height: model.windowHeight * 0.7,
      curve: Curves.easeInOut,
      duration: Duration(
        milliseconds: 1000,
      ),
      width: model.signupWidth,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(model.signupOpacity),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          )),
      transform: Matrix4.translationValues(
          model.signupShift, keyboardVisibility ? 30 : model.signUpHeight, 0),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/Scribbles.png',
                fit: BoxFit.fill,
                color: Colors.grey.withOpacity(0.15),
              ),
            ),
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                milliseconds: 1000,
              ),
              transform: Matrix4.translationValues(model.firstFormOffset, 0, 0),
              padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Create An Account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      emailAndPasswordForm(),
                      Container(
                        padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have an account?  ',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                model.setPageState(2);
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xffff354F52),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(
                  milliseconds: 1000,
                ),
                transform:
                    Matrix4.translationValues(model.secondFormOffset, 0, 0),
                padding: EdgeInsets.all(35.0),
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Create An Account",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            detailsForm(),
                          ]),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget detailsForm() {
    return Container(
      child: Form(
        // key: formkey2,
        child: Column(
          children: <Widget>[
            TextFormField(
              // onSaved: (val) => saveinfo.zone,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                  labelText: "Zone",
                  icon: Icon(Icons.location_on)),
              validator: (val) {
                // return nullValidate(val);
              },
            ),
            TextFormField(
              // onSaved: (val) => saveinfo.hostel,
              validator: (val) {
                // return nullValidate(val);
              },
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Hostel",
                  icon: Icon(Icons.airline_seat_individual_suite)),
            ),
            TextFormField(
              // onSaved: (val) =>
              // saveinfo.roomNumber,
              validator: (val) {
                // return nullValidate(val);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.confirmation_number),
                labelText: "Room Number",
                border: UnderlineInputBorder(),
              ),
            ),
            TextFormField(
              // onSaved: (val) => saveinfo.Program,
              validator: (val) {
                // return nullValidate(val);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.import_contacts),
                labelText: "Programme",
                border: UnderlineInputBorder(),
              ),
            ),
            TextFormField(
              // onSaved: (val) => saveinfo.Year,
              validator: (val) {
                // return nullValidate(val);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Year",
                border: UnderlineInputBorder(),
              ),
            ),
            TextFormField(
              // onSaved: (val) => saveinfo.ministry,
              validator: (val) {
                // return nullValidate(val);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.volume_up),
                labelText: "Ministry",
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffff354F52),
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              child: FlatButton(
                onPressed: () {
                  // _savesignUp();
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Color(0xffff354F52)),
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              child: FlatButton(
                onPressed: () {
                  model.signupNext();
                  model.setPageState(1);
                },
                child: Text(
                  "Back",
                  style: TextStyle(
                    color: Color(0xffff354F52),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget emailAndPasswordForm() {
    return Form(
      key: model.formkey1,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (val) {
              return model.nullValidate(val);
            },
            onSaved: (val) => model.userModel.userName = val,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(),
                labelText: "Name",
                icon: Icon(Icons.person)),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              var n;
              n = model.nullValidate(val);
              if (n != null) {
                return n;
              } else if (val.contains('+')) {
                return val.length == 13 ? null : 'Invalid mobile number';
              } else if (val.length != 10) {
                return 'Invalid mobile number';
              }
              return null;
            },
            onSaved: (val) => model.userModel.mobile = val,
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Phone",
                icon: Icon(Icons.phone_android)),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              var n;
              n = model.nullValidate(val);
              if (n != null) {
                return n;
              } else if (!(val.contains('@') && val.contains('.'))) {
                return 'Invalid Email';
              }
              return null;
            },
            onSaved: (val) => model.userModel.email = val,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              labelText: "Email",
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Color(0xffff354F52)),
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: FlatButton(
              onPressed: () {
                model.signupNext();
                // model.setPageState(3);
              },
              child: Text(
                "Next",
                style: TextStyle(
                  color: Color(0xffff354F52),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

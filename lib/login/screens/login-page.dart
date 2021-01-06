import 'package:flutter/material.dart';
import 'package:registration_ui2/login/model/user-info.dart';
import 'package:registration_ui2/login/screens/profile-page.dart';
import '../animation/fade-animation.dart';
import '../services/http-service.dart';

class LoginPage extends StatelessWidget {
  final eMailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 340,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 10,
                      height: 200,
                      width: 150,
                      child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/light-1.png',
                              ),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      left: 270,
                      height: 140,
                      width: 150,
                      child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/light-2.png',
                              ),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 20,
                      left: 170,
                      height: 200,
                      width: 150,
                      child: FadeAnimation(
                        1.5,
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/clock.png',
                              ),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      child: FadeAnimation(
                    1.6,
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, 1),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: TextField(
                                controller: eMailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email or Phone',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: TextField(
                                controller: passController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    2,
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .3),
                          ],
                        ),
                      ),
                      child: Container(
                        color: Colors.transparent,
                        child: FlatButton(
                          onPressed: () async {
                            MyService service = new MyService();
                            // called controller here
                            UserInfo userInfo = await service.httpService(
                              eMailController.text,
                              passController.text,
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProfilePage(userInfo),
                              ),
                            );
                          },
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                      1.5,
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(143, 148, 251, 1),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

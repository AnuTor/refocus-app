import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/auth/register_form.dart';
import '../screens/intro_survey_screen.dart';
import '../tests/panas.dart';
import '../tests/cerq.dart';
import '../providers/survey.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/intro-screen';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isLoading = false;
  bool _showText = false;
  bool _questionsAnswered = false;
  Map<String, Map> answers = {};
  late List _pages;
  final _path = "cuestionarios de base";
  var _userEmail = "";
  var _userName = "";
  var _userPassword = "";

  final List<Survey> introSurveys = [
    panas(1),
    cerq(2),
  ];

  @override
  void initState() {
    _pages = [
      IntroSurveyScreen(
        survey: introSurveys[0],
        onAnswered: _answerQuestion,
      ),
      IntroSurveyScreen(
        survey: introSurveys[1],
        onAnswered: _answerQuestion,
      ),
      RegisterForm(
        key: const ValueKey('RegisterForm'),
        formKey: _formKey,
        setMail: _setMail,
        setUser: _setUser,
        setPassword: _setPassword,
      ),
    ];
    super.initState();
  }

  void _finish() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _submitRegisterForm(
    String email,
    String password,
    String username,
    BuildContext ctx,
  ) async {
    UserCredential authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .set({
        'username': username,
        'email': email,
        'startdate': Timestamp.now(),
        'userId': authResult.user!.uid,
      });
      for (Survey survey in introSurveys) {
        await FirebaseFirestore.instance.collection('questionnaires').add({
          'createdAt': Timestamp.now(),
          'userId': authResult.user!.uid,
          'path': _path,
          'questionnaire': survey.testName,
          'answer': answers[survey.testName]
        });
      }
      _finish();
    } on PlatformException catch (err) {
      var message = 'An error occurred, pelase check your credentials!';
      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _setMail(String email) {
    setState(() {
      _userEmail = email.trim();
    });
  }

  void _setUser(String username) {
    setState(() {
      _userName = username.trim();
    });
  }

  void _setPassword(String password) {
    setState(() {
      _userPassword = password.trim();
    });
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      _submitRegisterForm(
        _userEmail,
        _userPassword,
        _userName,
        context,
      );
    }
  }

  void _answerQuestion(String testName, Map<String, String> questionAnswer) {
    setState(() {
      _questionsAnswered = true;
      answers[testName] = questionAnswer;
    });
  }

  void _selectPage(int index) {
    setState(() {
      _currentPage = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: _selectPage,
              itemBuilder: (ctx, index) {
                return _pages[index];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Colors.blue
                            : Colors.blue.withOpacity(0.5),
                      ),
                    );
                  }),
                ),
                if (_isLoading) const CircularProgressIndicator(),
                if (!_isLoading)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (_currentPage > 0)
                        InkWell(
                          onTap: () {
                            if (_currentPage > 0) {
                              setState(() {
                                _showText = false;
                              });
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeInOutQuint,
                              );
                            }
                            if (_currentPage == _pages.length - 1) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 300),
                            height: 70,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.navigate_before,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          if ((_currentPage < _pages.length - 1) &&
                              !_questionsAnswered) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Por favor responda todas las preguntas",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          if ((_currentPage < _pages.length - 1) &&
                              _questionsAnswered) {
                            setState(() {
                              _questionsAnswered = false;
                            });
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint,
                            );
                          }
                          if (_currentPage == _pages.length - 1) {
                            _trySubmit();
                          }
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 300),
                          height: 70,
                          width:
                              (_currentPage == (_pages.length - 1)) ? 200 : 75,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          onEnd: () {
                            (_currentPage == (_pages.length - 1))
                                ? setState(() {
                                    _showText = true;
                                  })
                                : setState(() {
                                    _showText = false;
                                  });
                          },
                          child: _showText
                              ? const Text("Comenzar", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )
                              : const Icon(
                                Icons.navigate_next,
                                size: 50,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

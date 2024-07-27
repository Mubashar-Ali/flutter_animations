import 'package:flutter/material.dart';
import 'package:flutter_animations/Implicit_Animation/customClip.dart';
import 'package:flutter_animations/Implicit_Animation/myButton.dart';

class AnimatedForm extends StatefulWidget {
  const AnimatedForm({super.key});

  @override
  State<AnimatedForm> createState() => _AnimatedFormState();
}

class _AnimatedFormState extends State<AnimatedForm> {
  var pos = -280.0;
  var opacity1 = 0.0;
  var opacity2 = 1.0;
  var inputHeight = 0.0;
  var gap = 0.0;
  var h, w;
  var anim = 350.0;
  var topAnim = -100.0;
  var greenCont = -400.0;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // greenCont = -h * .5;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: h,
          width: w,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                top: pos,
                right: pos,
                child: ClipPath(
                  clipper: Clip2(),
                  child: GestureDetector(
                    onTap: blackCont,
                    child: Container(
                      width: w,
                      height: h * .755,
                      color: Colors.black,
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(left: anim),
                        duration: const Duration(seconds: 50),
                        child: const Stack(
                          children: [
                            Positioned(
                              left: 20,
                              top: 20,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 50,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 50,
                              top: 25,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 100,
                              top: 100,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 150,
                              top: 150,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 100,
                              top: 150,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 150,
                              top: 100,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 200,
                              top: 200,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 100,
                              top: 300,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 200,
                              top: 300,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 300,
                              top: 100,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 400,
                              top: 130,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 350,
                              top: 150,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 280,
                              top: 180,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 100,
                              top: 100,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 50,
                              top: 200,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 150,
                              top: 250,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 200,
                              top: 50,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 250,
                              top: 250,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 300,
                              top: 300,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 350,
                              top: 50,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 400,
                              top: 200,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 450,
                              top: 100,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 500,
                              top: 150,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 550,
                              top: 50,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 50,
                              top: 250,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 130,
                              top: 220,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 50,
                              top: 100,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 30,
                              top: 150,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 350,
                              top: 250,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 220,
                              top: 140,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 320,
                              top: 140,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 320,
                              top: 320,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 380,
                              top: 450,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                            Positioned(
                              left: 370,
                              top: 390,
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                bottom: pos,
                left: pos,
                child: ClipPath(
                  clipper: Clip1(),
                  child: GestureDetector(
                    onTap: () => firstAnim(),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: h * .2, left: 15),
                      color: Colors.blue,
                      width: w,
                      height: h * .7,
                      child: AnimatedOpacity(
                        opacity: opacity1,
                        duration: const Duration(seconds: 2),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              AnimatedContainer(
                                height: inputHeight,
                                width: w * .7,
                                // color: Colors.purple,
                                duration: const Duration(seconds: 1),
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This Field is required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Full Name'),
                                ),
                              ),
                              AnimatedContainer(
                                height: inputHeight,
                                width: w * .7,
                                // color: Colors.purple,
                                duration: const Duration(seconds: 1),
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This Field is required';
                                    } else if (!value.endsWith('@gmail.com')) {
                                      return 'Invalid Format';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email'),
                                ),
                              ),
                              AnimatedContainer(
                                height: inputHeight,
                                width: w * .7,
                                // color: Colors.red,
                                duration: const Duration(milliseconds: 600),
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: passwordController,
                                  onChanged: (value) {
                                    setState(() {
                                      if (formKey.currentState!.validate()) {
                                        gap = 0;
                                        opacity2 = 1;
                                      } else {
                                        gap = 135;
                                        opacity2 = 0;
                                      }
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This Field is required';
                                    } else if (value.length < 8) {
                                      return 'Minimum 8 characters are required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                padding: EdgeInsets.only(top: gap),
                                duration: const Duration(milliseconds: 500),
                                child: AnimatedOpacity(
                                  opacity: opacity2,
                                  duration: const Duration(milliseconds: 500),
                                  child: MyButton(
                                    onPressed: btnClick,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                left: 50,
                top: topAnim,
                duration: const Duration(seconds: 1),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.white60,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Registration Form',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                top: greenCont,
                child: Container(
                  color: Colors.green.shade700,
                  width: w,
                  height: h * .5,
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    'Registered',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                bottom: greenCont,
                child: Container(
                  color: Colors.green.shade700,
                  width: w,
                  height: h * .5,
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Successfully',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  firstAnim() {
    setState(() {
      pos = 0;
      opacity1 = 1;
    });
  }

  void btnClick() {
    setState(() {
      greenCont = 0;
    });
  }

  void blackCont() {
    setState(() {
      inputHeight = 70;
      gap = 135;
      opacity2 = 0;
      anim = 0;
      topAnim = 120;
    });
  }
}

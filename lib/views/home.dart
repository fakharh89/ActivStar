import 'package:activestar/controllers/appcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
        builder: (controller) => !controller.isLoading.value
            ? Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black12)),
                  height: 85,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/protein-supplement.png',
                                width: 24,
                                height: 24,
                              )),
                          const Text("Produkty"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/home.png',
                                width: 48,
                                height: 41,
                              )),
                          const Text("Domov"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/file-text.png',
                                width: 24,
                                height: 24,
                              )),
                          const Text("Články"),
                        ],
                      )
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Icon(
                                        Icons.mail_outline,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.more_vert,
                                        color: Colors.black,
                                        size: 24,
                                      )
                                    ],
                                  ),
                                ),
                                right: 0,
                                top: 10,
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/logo.png',
                                  width: 120,
                                  height: 120,
                                ),
                                // top: 10,
                                // left: MediaQuery.of(context).size.width / 4,
                              ),
                            ],
                          ),
                        ),
                        Stack(children: [
                          Container(
                            height:
                                189, //MediaQuery.of(context).size.height / 4,
                            width:
                                307, //MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.black.withOpacity(0.6),
                                      Colors.black.withOpacity(0.5),
                                      Colors.transparent,
                                      Colors.transparent
                                    ],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                                child: Image.network(
                                  controller
                                      .items[controller.randomnum.value].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            child: Text("Prečítať",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                )),
                            top: 8.0,
                            right: 8.0,
                          ),
                          Positioned(
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: Flex(direction: Axis.vertical, children: [
                                Text(
                                  controller
                                      .items[controller.randomnum.value].title,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ]),
                            ),
                            bottom: 8,
                            left: 8,
                          )
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(38.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 143,
                                  height: 55,
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Center(
                                          child: Text(
                                              "PAktuálna výška provízii:")),
                                      Text(
                                        "1000€",
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                              Container(
                                  width: 143,
                                  height: 55,
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Center(
                                          child: Text("Počet ľudí v tíme:")),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.person_outline_outlined,
                                            size: 32,
                                          ),
                                          Text(
                                            "22",
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Container(
                            color: const Color.fromARGB(100, 229, 229, 229),
                            height: 20,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: slider()),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(child: CircularProgressIndicator())),
              ));
  }
}

slider() {
  var controller = Get.find<AppController>();
  return Obx(
    () => Slider(
      value: controller.slidervalue.value,
      min: 0.0,
      max: 10.0,
      divisions: 10,
      onChangeStart: (double value) {
        print('Start value is ' + value.toString());
      },
      onChangeEnd: (double value) {
        print('Finish value is ' + value.toString());
      },
      onChanged: (double newValue) {
        controller.slidervalue.value = newValue;
      },
      activeColor: const Color.fromRGBO(222, 192, 60, 100),
      inactiveColor: Colors.transparent,
    ),
  );
}

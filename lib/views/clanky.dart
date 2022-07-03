import 'package:activestar/controllers/appcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Clanky extends StatefulWidget {
  const Clanky({Key? key}) : super(key: key);

  @override
  State<Clanky> createState() => _ClankyState();
}

class _ClankyState extends State<Clanky> {
  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
        builder: (controller) => !controller.isLoading.value
            ? Scaffold(
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
                              onPressed: () {
                                Get.to(Clanky());
                              },
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
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  leadingWidth: 162,
                  toolbarHeight: 90,
                  elevation: 0,
                  leading: SizedBox(
                    height: 100,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: "logo",
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  actions: const [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.black,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                  title: const Padding(
                    padding: EdgeInsets.only(top: 68.0),
                    child: Text(
                      'CLanky',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height - 190,
                        child: ListView.builder(
                            physics:
                                const AlwaysScrollableScrollPhysics(), // new

                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.items.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 303,
                                  width: 310,
                                  child: Card(
                                    shadowColor: Colors.black,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 369,
                                            height: 150,
                                            child: Image.network(
                                              controller.items[i].image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            controller.items[i].title,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              Bidi.stripHtmlIfNeeded(controller
                                                      .items[i].description)
                                                  .trim(),
                                              maxLines: 3,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  overflow: TextOverflow.clip),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    elevation: 8.0,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            })),
                  ),
                ),
              )
            : Scaffold());
  }
}

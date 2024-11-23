import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/orders.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/drawer.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/size_config.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = 'MyHomePage';
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController searchBarController = TextEditingController();
  final String username = 'Sebastian';

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Lista de pantallas
    final screens = [
      SingleChildScrollView( 
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                width: getProportionateScreenWidth(600),
                height: getProportionateScreenHeight(100),
                decoration: const BoxDecoration(
                  color: AppColors.White,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: Container(
                        width: 500,
                        height: 89,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(181, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 0, top: 10, bottom: 5),
                                  child: Container(
                                    width: 65.0,
                                    height: 65.0,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Icon(Icons.account_circle,
                                          size: 70),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, top: 20),
                                        child: Row(children: [
                                          MyText(
                                            label: username,
                                            size: 20,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ])),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 25, top: 0),
                                      child: MyText(
                                        label: 'Looking for specialist',
                                        size: 12,
                                        color: AppColors.Subtitulos,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const Padding                                 (
                                      padding: EdgeInsets.only(left: 25),
                                      child: RatingStars(rating: 3.5),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: getProportionateScreenHeight(1000),
                width: getProportionateScreenWidth(600),
                decoration: const BoxDecoration(
                  color: AppColors.White,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: MyTextfield(
                        altura: 50,
                        ancho: 340,
                        color: AppColors.Subtitulos,
                        controller: searchBarController,
                        hintText: 'Search from us services',
                        label: 'Hola',
                        obscureText: false,
                        icon: Icons.search,
                        iconColor: AppColors.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Carta(
                                  descripcion: 'Plumber',
                                  numeroEspecialistas: '5000 specialist',
                                  icon: Icons.plumbing,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Carta(
                                  descripcion: 'Housekeeper',
                                  numeroEspecialistas: '4700 specialist',
                                  icon: Icons.house,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Carta(
                                  descripcion: 'Computer Repairs',
                                  numeroEspecialistas: '4000 specialist',
                                  icon: Icons.computer,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Carta(
                                  descripcion: 'Vehicle repairs',
                                  numeroEspecialistas: '3750 specialist',
                                  icon: Icons.car_crash,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Carta(
                                  descripcion: 'Air conditioner maintenance',
                                  numeroEspecialistas: '4000 specialist',
                                  icon: Icons.air,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Carta(
                                  descripcion: 'Loaders',
                                  numeroEspecialistas: '3750 specialist',
                                  icon: Icons.house,
                                ),
                              ),
                            ],
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
      ),
      const Orders()
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.AppBarColor,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.teal),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  'assets/img/taskly_logo.jpg',
                  width: 100,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer_menu(username: username),
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey),
              label: 'Services',
              activeIcon: Icon(Icons.search, color: Colors.black),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long, color: Colors.grey),
              activeIcon: Icon(Icons.receipt_long, color: Colors.black),
              label: 'My orders',
            ),
          ],
          selectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
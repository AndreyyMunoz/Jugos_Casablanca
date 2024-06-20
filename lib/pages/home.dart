import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jugos_casablanca/pages/details.dart';
import 'package:jugos_casablanca/service/database.dart';
import 'package:jugos_casablanca/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool jugoverde = false,
      jugobetabel = false,
      jugozanahoria = false,
      jugonaranja = false;
  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem('Jugos');
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              detail: ds["Detail"],
                              image: ds['Image'],
                              price: ds['Price'],
                              name: ds['Name'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                          bottom: 20,
                        ),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Text(
                                          ds["Name"],
                                          style: AppWidget.semiBoldTextFeildStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Text(
                                          ds["Detail"],
                                          style: AppWidget.lightTextFeildStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Text("\$" + ds["Price"],
                                          style: AppWidget.semiBoldTextFeildStyle()
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : const Center(child: CircularProgressIndicator());
        });
  }

  Widget allItems() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              detail: ds["Detail"],
                              image: ds['Image'],
                              price: ds['Price'],
                              name: ds['Name'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                          bottom: 5,
                          top: 4,
                          left: 4,
                        ),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ds["Name"],
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ds["Detail"],
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("\$" + ds["Price"],
                                    style: AppWidget.semiBoldTextFeildStyle())
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : const Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 40,
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bienvenido a Jugos Casablanca!",
                    style: AppWidget.boldTextFeildStyle(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Variedad de Jugos Deliciosos",
                style: AppWidget.headlineTextFeildStyle(),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Descubre la Gran Cantidad de opciones Disponibles",
                style: AppWidget.lightTextFeildStyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: showItem(),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 270,
                child: allItems(),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: allItemsVertically(),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            jugoverde = false;
            jugobetabel = false;
            jugozanahoria = false;
            jugonaranja = true;
            fooditemStream = await DatabaseMethods().getFoodItem("Jugos");
            setState(() {});
          },
          child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: jugonaranja
                        ? const Color.fromARGB(255, 153, 255, 0)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "assets/images/naranja.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              )),
        ),
        GestureDetector(
          onTap: () async {
            jugoverde = true;
            jugobetabel = false;
            jugozanahoria = false;
            jugonaranja = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Chocos");
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: jugoverde
                      ? const Color.fromARGB(255, 153, 255, 0)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/verde.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            jugoverde = false;
            jugobetabel = false;
            jugozanahoria = true;
            jugonaranja = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Licuados");
            setState(() {});
          },
          child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: jugozanahoria
                        ? const Color.fromARGB(255, 153, 255, 0)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "assets/images/zana.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              )),
        ),
        GestureDetector(
          onTap: () async {
            jugoverde = false;
            jugobetabel = true;
            jugozanahoria = false;
            jugonaranja = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Snacks");
            setState(() {});
          },
          child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: jugobetabel
                        ? const Color.fromARGB(255, 153, 255, 0)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "assets/images/betabel.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ],
    );
  }
}

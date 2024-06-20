import 'package:flutter/material.dart';
import 'package:jugos_casablanca/admin/add_food.dart';
import 'package:jugos_casablanca/widget/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 22.0, right: 22.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Ventana de Administrador",
                style: AppWidget.headlineTextFeildStyle(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                "Aqui puedes agregar todos los productos que desees a tu catalogo.",
                style: AppWidget.tinyTextFeildStyle(),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddFood()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/add_item.jpeg',
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        const Text(
                          "Agregar productos",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

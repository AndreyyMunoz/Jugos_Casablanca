import 'package:flutter/material.dart';

class AppWidget{
  static TextStyle boldTextFeildStyle(){
    return const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle headlineTextFeildStyle(){
    return const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle lightTextFeildStyle(){
    return const TextStyle(
      
      color: Colors.black54,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }
  
  static TextStyle semiBoldTextFeildStyle(){
    return const TextStyle(
      color: Colors.black87,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
    );
  }

    static TextStyle tinyTextFeildStyle(){
    return const TextStyle(
      
      color: Colors.black54,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
  }

    static TextStyle blueTextFeildStyle(){
    return const TextStyle(
      color: Color.fromARGB(255, 34, 71, 255),
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
    );
  }
}
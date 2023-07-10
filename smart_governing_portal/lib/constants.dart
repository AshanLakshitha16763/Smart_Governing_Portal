import 'package:flutter/material.dart';

/*This navbar1 contains the login and register 
button for desktop and tablet versions*/
var navbar1 = AppBar(
  toolbarHeight: 120,
  title: SizedBox(
    width: 150,
    child: Image.asset(
      'lib/Assets/logo.png',
      fit: BoxFit.cover,
    ),
  ),
  actions: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Services',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'About us',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 255, 255))),
              child: const Text(
                'Login',
                style: TextStyle(color: Color.fromARGB(255, 10, 4, 70)),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 10, 4, 70))),
              child: const Text(
                'Register',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        )
      ],
    ),
  ],
  backgroundColor: const Color.fromARGB(255, 115, 185, 250),
  //flexibleSpace: FlexibleSpaceBar(),
);

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:smart_governing_portal/pages/Admin/adminFormPage.dart';
import 'package:smart_governing_portal/pages/User/after_registration_page.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          _appbar(),

          Center(
            child: SizedBox(
              width: width/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("lib/Assets/aboutus.png"),
                  const Text(
                    "About Let's Gov",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
                  //########################################
                  const Text("History",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
                  //########################################
                  const Text("Vision & Mission",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
                  //########################################
                  const Text("Our Services",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
                  //########################################
                  const Text("Contact Us",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //appbar
  Widget _appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120,
      leadingWidth: 180,
      leading: SizedBox(
        width: 150,
        child: Image.asset(
          'lib/Assets/logo.png',
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context as BuildContext,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const AfterRegistrationPage(),
                          ),
                        );
                      },
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
                      'About Us',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context as BuildContext,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const AdminHomePage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Admin',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      top: 5,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'lib/Assets/person.png',
                          width: 40,
                          height: 40,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
      backgroundColor: const Color.fromARGB(255, 115, 185, 250),
    );
  }
}

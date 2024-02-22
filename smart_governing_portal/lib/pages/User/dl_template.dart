import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_governing_portal/pages/User/qrimage.dart';

class DLTemplate extends StatefulWidget {
  const DLTemplate({super.key});

  @override
  State<DLTemplate> createState() => _DLTemplateState();
}

class _DLTemplateState extends State<DLTemplate> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> data;
  bool _showAnimation = true;
  late double width;
  late double height;
  late String issuedDate;
  late String dlNo;
  String userUid = '';

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userUid = user.uid;
    }
    data = FirebaseFirestore.instance.collection('DLtest').doc(userUid).get();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return _showAnimation
        ? Center(child: Lottie.asset('lib/Assets/animations/id.json'))
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 115, 185, 250),
              title: const Text('Driving License Template'),
            ),
            body:
                _body()
            );
  }

  Widget _buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width * 0.6,
          maxHeight: height * 0.8,
        ),
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(
                child: Text(
                  'Document not found',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              var documentData = snapshot.data!.data()!;
              issuedDate = documentData['Issued Date'] ?? '';
              dlNo = documentData['License No'] ?? '';
              var validation = documentData['Validation'] ?? '';
              if (validation == 'valid') {
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/Assets/verified.png",
                            width: 144,
                            height: 144,
                          ),
                          const Text(
                            'Your Driving License is Verified',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: width * 0.8,
                          minHeight: height * 0.8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 249, 247, 232),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 5),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Driving License",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "lib/Assets/government.png"),
                                        width: 100,
                                        height: 100,
                                      ),
                                      Image(
                                        image:
                                            AssetImage("lib/Assets/person.png"),
                                        width: 100,
                                        height: 100,
                                      ),
                                    ]),
                                Column(
                                  children: [
                                    _buildField('Full Name: ',
                                        documentData['Full Name'] ?? ''),
                                    _buildField(
                                        'NIC No: ', documentData['NIC'] ?? ''),
                                    _buildField('License No: ',
                                        documentData['License No'] ?? ''),
                                    _buildField('Address: ',
                                        documentData['Address'] ?? ''),
                                    _buildField('Date of Birth: ',
                                        documentData['Date of Birth'] ?? ''),
                                    _buildField('Gender: ',
                                        documentData['Gender'] ?? ''),
                                    _buildField('Blood Group: ',
                                        documentData['Blood Group'] ?? ''),
                                    _buildField('Document Number: ',
                                        documentData['Doc No'] ?? ''),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          issuedDate,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationStyle:
                                                  TextDecorationStyle.dotted),
                                        ),
                                        const Text(
                                          "Date",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          ".......................",
                                          style: TextStyle(
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationStyle:
                                                  TextDecorationStyle.dotted),
                                        ),
                                        Text(
                                          "Commissioner General of",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Motor Traffic",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: const FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Department of Motor Traffic - Sri Lanka",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => QRImage(
                                uid: userUid,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size.fromWidth(width / 4),
                          foregroundColor:
                              const Color.fromARGB(255, 243, 242, 234),
                          backgroundColor: const Color.fromARGB(255, 10, 4, 70),
                          fixedSize: const Size(800, 50),
                          textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          elevation: 5,
                          side: const BorderSide(
                            color: Color.fromARGB(255, 249, 252, 251),
                            width: 4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const FittedBox(child: Text('DL QR Code')),
                      ),
                    ],
                  ),
                );
              } else {
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/Assets/clockwise.png",
                            width: 75,
                            height: 75,
                          ),
                          const Text(
                            ' Waiting for approval...',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: width * 0.8,
                          minHeight: height * 0.8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 249, 247, 232),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 5),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Driving License",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "lib/Assets/government.png"),
                                        width: 100,
                                        height: 100,
                                      ),
                                      Image(
                                        image:
                                            AssetImage("lib/Assets/person.png"),
                                        width: 100,
                                        height: 100,
                                      ),
                                    ]),
                                Column(
                                  children: [
                                    _buildField('Full Name: ',
                                        documentData['Full Name'] ?? ''),
                                    _buildField(
                                        'NIC No: ', documentData['NIC'] ?? ''),
                                    _buildField('License No: ',
                                        documentData['License No'] ?? ''),
                                    _buildField('Address: ',
                                        documentData['Address'] ?? ''),
                                    _buildField('Date of Birth: ',
                                        documentData['Date of Birth'] ?? ''),
                                    _buildField('Gender: ',
                                        documentData['Gender'] ?? ''),
                                    _buildField('Blood Group: ',
                                        documentData['Blood Group'] ?? ''),
                                    _buildField('Document Number: ',
                                        documentData['Doc No'] ?? ''),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          issuedDate,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationStyle:
                                                  TextDecorationStyle.dotted),
                                        ),
                                        const Text(
                                          "Date",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          ".......................",
                                          style: TextStyle(
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationStyle:
                                                  TextDecorationStyle.dotted),
                                        ),
                                        Text(
                                          "Commissioner General of",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Motor Traffic",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: const FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Department of Motor Traffic - Sri Lanka",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

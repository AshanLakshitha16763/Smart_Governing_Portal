import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NICTemplate extends StatefulWidget {
  const NICTemplate({Key? key}) : super(key: key);

  @override
  State<NICTemplate> createState() => _NICTemplateState();
}

class _NICTemplateState extends State<NICTemplate> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> data;
  bool _showAnimation = true;
  late double width;
  late double height;
  late String issuedDate;
  late String nicNo;

  @override
  void initState() {
    super.initState();
    String userUid = '';
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userUid = user.uid;
    }
    data = FirebaseFirestore.instance.collection('NICtest').doc(userUid).get();
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
              title: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'National ID Card Template',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  )),
            ),
            body: _body());
  }

  Widget _buildField(String label, String value) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              '$label:',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Center(
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
            nicNo = documentData['NIC No'] ?? '';
            return FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sri Lanka",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              nicNo,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage("lib/Assets/government.png"),
                                width: 100,
                                height: 100,
                              ),
                              Image(
                                image: AssetImage("lib/Assets/person.png"),
                                width: 100,
                                height: 100,
                              ),
                            ]),
                        Column(
                          children: [
                            _buildField(
                                'Full Name', documentData['Full Name'] ?? ''),
                            _buildField('Other Names',
                                documentData['Other Names'] ?? ''),
                            _buildField(
                                'Address', documentData['Address'] ?? ''),
                            _buildField('Birth Place',
                                documentData['Birth Place'] ?? ''),
                            _buildField('Date of Birth',
                                documentData['Date of Birth'] ?? ''),
                            _buildField('Gender', documentData['Gender'] ?? ''),
                            _buildField(
                                'Profession', documentData['Profession'] ?? ''),
                            _buildField('Document Number',
                                documentData['Doc No'] ?? ''),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  issuedDate,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
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
                                      decoration: TextDecoration.underline,
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
                                  "Registration of Persons",
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
                              "Registration of Persons Act No.32 of 1968",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

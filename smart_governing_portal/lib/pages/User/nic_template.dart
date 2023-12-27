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

  @override
  void initState() {
    super.initState();
    String userUid = '';
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userUid = user.uid;
    }
    data = FirebaseFirestore.instance.collection('NICtest').doc(userUid).get();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showAnimation
        ? Center(child: Lottie.asset('lib/Assets/animations/id.json'))
        : Scaffold(
            appBar: AppBar(
              title: const Text('National ID Card Template'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                      return Center(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: SingleChildScrollView(
                            child: Card(
                              elevation: 1,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 40),
                                          child: Text(
                                            "Sri Lanka",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          "1236547825",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "lib/Assets/government.png"),
                                          width: 150,
                                          height: 150,
                                        ),
                                        //SizedBox(width: 50,),
                                        Image(
                                          image: AssetImage(
                                              "lib/Assets/person.png"),
                                          width: 150,
                                          height: 150,
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'National Identity Card',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Full Name',
                                          documentData['Ful Name'] ?? ''),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Other Names',
                                          documentData['Other Names'] ?? ''),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Birth Place',
                                          documentData['Birth Place'] ?? ''),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Address',
                                          documentData['Address'] ?? ''),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Profession',
                                          documentData['Profession'] ?? ''),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Document Number',
                                          documentData['Doc No'] ?? ''),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Date of Birth',
                                          documentData['Date of Birth'] ?? ''),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Issued Date',
                                          documentData['Issued Date'] ?? ''),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      child: _buildField('Gender',
                                          documentData['Gender'] ?? ''),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: const Text(
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
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
  }

  Widget _buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$label:',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_governing_portal/pages/Admin/adminDashboardPage.dart';


class ReqNICTemplate extends StatefulWidget {
  final String documentId;
  const ReqNICTemplate({
    super.key,
    required this.documentId,
  });

  @override
  State<ReqNICTemplate> createState() => _ReqNICTemplateState();
}

class _ReqNICTemplateState extends State<ReqNICTemplate> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> data;
  late double width;
  late double height;
  late String issuedDate;
  late String nicNo;
  String correctValidation = "valid";
  String wrongValidation = "invalid";
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    data = FirebaseFirestore.instance
        .collection('NICtest')
        .doc(widget.documentId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 115, 185, 250),
          title: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'National ID Card Template',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  FittedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Sri Lanka",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    nicNo,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
                                  _buildField('Full Name',
                                      documentData['Full Name'] ?? ''),
                                  _buildField('Other Names',
                                      documentData['Other Names'] ?? ''),
                                  _buildField(
                                      'Address', documentData['Address'] ?? ''),
                                  _buildField('Birth Place',
                                      documentData['Birth Place'] ?? ''),
                                  _buildField('Date of Birth',
                                      documentData['Date of Birth'] ?? ''),
                                  _buildField(
                                      'Gender', documentData['Gender'] ?? ''),
                                  _buildField('Profession',
                                      documentData['Profession'] ?? ''),
                                  _buildField('Document Number',
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
                  ),
                  const Text(
                    'Please make sure all the fields are 100% correct',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          correcctButtonMsg();
                        },
                        icon: const Icon(
                          Icons.check_outlined,
                        ),
                        label: const Text("Correct"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 243, 242, 234),
                          backgroundColor: const Color.fromARGB(255, 10, 4, 70),
                          padding: const EdgeInsets.all(20),
                          fixedSize: const Size(200, 50),
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
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          wrongButtonMsg();
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                        label: const Text(
                          "Incorrect",
                          style: TextStyle(),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 243, 242, 234),
                          backgroundColor: const Color.fromARGB(255, 10, 4, 70),
                          padding: const EdgeInsets.all(20),
                          fixedSize: const Size(200, 50),
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
                        ), /*ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 10, 4, 70)),
                        ),*/
                      )
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future updateDBcorrect() async {
    try {
      // Reference to the document in the "NICtest" collection with the current user's UID
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('NICtest')
          .doc(widget.documentId);

      // Update fields or add new fields
      await documentReference.update({
        "Validation": correctValidation,
        "Authorized Time": DateTime.now()
        // Add as many fields as needed
      });

      _showCompletedDialog();
    } catch (e) {
      _showIncompeleteDialog();
    }
  }

  Future updateDBwrong() async {
    try {
      // Reference to the document in the "NICtest" collection with the current user's UID
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('NICtest')
          .doc(widget.documentId);

      // Update fields or add new fields
      await documentReference.update({
        "Validation": wrongValidation,
        "Authorized Time": DateTime.now()
        // Add as many fields as needed
      });

      _showIncompeleteDialog();
    } catch (e) {
      _showIncompeleteDialog();
    }
  }

  void _showCompletedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Form Validation Complete'),
        content: const Text('You will receive the QR Code for NIC soon.'),
        actions: [
          TextButton(
            onPressed: (){
            Navigator.pop(context); // Close the dialog
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AdminDashboardPage(), // Navigate to another page
              ),
            );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showIncompeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('NIC Validation Incomplete'),
        content: const Text('Instruct user to do the neccessary changes.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AdminDashboardPage(), // Navigate to another page
              ),
            );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void correcctButtonMsg() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are You Sure?'),
        content: const Text('Make sure all the details are 100% correct.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              updateDBcorrect();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void wrongButtonMsg() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are You Sure?'),
        content: const Text('Make sure all the details are 100% correct.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              updateDBwrong();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

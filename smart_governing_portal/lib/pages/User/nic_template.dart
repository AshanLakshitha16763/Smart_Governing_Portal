import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NICTemplate extends StatefulWidget {
  const NICTemplate({super.key,});

  @override
  State<NICTemplate> createState() => _NICTemplateState();
}

class _NICTemplateState extends State<NICTemplate> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> data;

  @override
  void initState() {
    super.initState();
    String userUid = '';
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userUid = user.uid;
    }
    data = FirebaseFirestore.instance.collection('NICtest').doc(userUid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('National ID Card Template'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Text('Document not found');
              } else {
                var documentData = snapshot.data!.data()!;
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'National Identity Card',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        _buildField('Full Name : ', documentData['Full Name']?? ''),
                        _buildField('Other Names : ', documentData['Other Names']?? ''),
                        _buildField('Birth Place : ', documentData['Birth Place']?? ''),
                        _buildField('Address : ', documentData['Address']?? ''),
                        _buildField('Profession : ', documentData['Profession']?? ''),
                        _buildField('Document Number : ', documentData['Doc No']?? ''),
                        _buildField('Date of Birth : ', documentData['Date of Birth']?? ''),
                        _buildField('Issued Date : ', documentData['Issued Date']?? ''),
                        _buildField('Gender : ', documentData['Gender']?? ''),
                      ],
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
}

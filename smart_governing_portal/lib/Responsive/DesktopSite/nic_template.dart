import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NICTemplate extends StatefulWidget {
  const NICTemplate({super.key});

  @override
  State<NICTemplate> createState() => _NICTemplateState();
}

class _NICTemplateState extends State<NICTemplate> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> data;

  @override
  void initState() {
    super.initState();
    String userUid = FirebaseAuth.instance.currentUser?.uid ?? '';
    data = FirebaseFirestore.instance.collection('NICtest').doc(userUid).get();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('National ID Card Template'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text('Document not found');
            } else {
              var documentData = snapshot.data!.data()!;
              return Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'National Identity Card',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _buildField('Full Name', documentData['fullName']),
                      _buildField('Other Names', documentData['otherNames']),
                      _buildField('Birth Place', documentData['birthPlace']),
                      _buildField('Address', documentData['address']),
                      _buildField('Profession', documentData['profession']),
                      _buildField('Document Number', documentData['docNo']),
                      _buildField('Date of Birth', documentData['dob']),
                      _buildField('Issued Date', documentData['issuedDate']),
                      _buildField('Gender', documentData['gender']),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
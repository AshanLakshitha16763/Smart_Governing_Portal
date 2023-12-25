import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:smart_governing_portal/pages/Admin/requestingNicTemplate.dart';



class RequestingNIC extends StatefulWidget {
  @override
  _RequestingNICState createState() => _RequestingNICState();
}

class _RequestingNICState extends State<RequestingNIC> {
  final CollectionReference nicTestCollection =
      FirebaseFirestore.instance.collection('NICtest');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore User Data'),
      ),
      body: StreamBuilder(
        stream: nicTestCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          List<DataRow> rows = snapshot.data!.docs.map((doc) {
            // Check if the 'Name' and 'Time' fields exist in the document
            String name = doc['Full Name'] ?? 'No Name';
            String nic = doc['NIC No'] ?? 'No Name';
            Timestamp timestamp = doc['Time'] ?? Timestamp(0, 0);

            // Format the timestamp as "YYYY-MM-DD hh:mm"
            String formattedTime =
                DateFormat('yyyy-MM-dd HH:mm').format(timestamp.toDate());

            return DataRow(
              cells: [
                DataCell(Text(nic)),
                DataCell(Text(name)),
                DataCell(Text(formattedTime)),
                DataCell(ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => ReqNICTemplate(documentId: doc.id,),
                      ),
                    );
                  },
                  child: const Text("View"),
                ))
              ],
            );
          }).toList();

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('NIC')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Time')),
                DataColumn(label: Text('')),
              ],
              rows: rows,
            ),
          );
        },
      ),
    );
  }
}

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
        centerTitle: true,
        title: const Text('Firestore User Data',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: const Color.fromARGB(255, 115, 185, 250),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(double.infinity),
              child: StreamBuilder(
                stream: nicTestCollection.where('Validation', isEqualTo: "").snapshots(),
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
              
                  List<TableRow> rows = snapshot.data!.docs.map((doc) {
                    String name = doc['Full Name'] ?? 'No Name';
                    String nic = doc['NIC No'] ?? 'No Name';
                    Timestamp timestamp = doc['Time'] ?? Timestamp(0, 0);
                    String formattedTime =
                        DateFormat('yyyy-MM-dd HH:mm').format(timestamp.toDate());
              
                    return TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(nic),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(name),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(formattedTime),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReqNICTemplate(documentId: doc.id,),
                                  ),
                                );
                              },
                              child: const Text("View"),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList();
              
                  return Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(color: const Color.fromARGB(255, 49, 101, 185)),
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth(),
                      2: IntrinsicColumnWidth(),
                      3: IntrinsicColumnWidth(),
                    },
                    children: [
                      const TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('NIC',style: TextStyle(color:Color.fromARGB(255, 49, 101, 185),fontSize: 18,fontWeight: FontWeight.w600 ),),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Name',style: TextStyle(color:Color.fromARGB(255, 49, 101, 185),fontSize: 18,fontWeight: FontWeight.w600 ),),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Time',style: TextStyle(color:Color.fromARGB(255, 49, 101, 185),fontSize: 18,fontWeight: FontWeight.w600 ),),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(''),
                            ),
                          ),
                        ],
                      ),
                      ...rows,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

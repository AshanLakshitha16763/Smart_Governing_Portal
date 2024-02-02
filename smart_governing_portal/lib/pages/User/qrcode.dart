import 'package:flutter/material.dart';
class QRCODE extends StatefulWidget {
  const QRCODE({super.key});

  @override
  State<QRCODE> createState() => _QRCODEState();
}

class _QRCODEState extends State<QRCODE> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Enter your URL"),
            ),
          ),
          ElevatedButton(
              onPressed: () {/*
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        QRImage(controller: controller),
                  ),
                );
              */},
              child: const Text("Generate QR code")),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

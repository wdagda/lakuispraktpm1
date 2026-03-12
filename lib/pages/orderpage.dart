import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String nama;
  final int harga;
  final String gambar;

  const OrderPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.gambar,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController jumlahController = TextEditingController();

  int total = 0;

  void hitung() {
    int jumlah = int.tryParse(jumlahController.text) ?? 0;

    setState(() {
      total = jumlah * widget.harga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Order")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Image.asset(widget.gambar, height: 150),

            const SizedBox(height: 10),

            Text(
              widget.nama,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text("Harga: Rp ${widget.harga}"),

            const SizedBox(height: 20),

            TextField(
              controller: jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Jumlah",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: hitung,
                child: const Text("Submit"),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Total Harga: Rp $total",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

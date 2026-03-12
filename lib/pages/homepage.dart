import 'package:flutter/material.dart';
import 'orderpage.dart';
import 'loginpage.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  final List<Map<String, dynamic>> daftarMenu = const [
    {
      "nama": "Nasi Goreng",
      "harga": 15000,
      "gambar": "lib/assets/nasigoreng.jpg",
    },
    {"nama": "Mie Ayam", "harga": 12000, "gambar": "lib/assets/mieayam.jpg"},
    {"nama": "Sate Ayam", "harga": 20000, "gambar": "lib/assets/sateayam.jpg"},
    {"nama": "Bakso", "harga": 10000, "gambar": "lib/assets/bakso.jpg"},
    {
      "nama": "Ayam Geprek",
      "harga": 17000,
      "gambar": "lib/assets/ayamgeprek.jpg",
    },
    {
      "nama": "Nasi Padang",
      "harga": 22000,
      "gambar": "lib/assets/nasipadang.jpg",
    },
    {"nama": "Soto Ayam", "harga": 15000, "gambar": "lib/assets/sotoayam.jpg"},
    {"nama": "Gado-Gado", "harga": 13000, "gambar": "lib/assets/gadogado.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Halo @$username"),
            const Text(
              "Mau Makan Apa Hari Ini?",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Image.asset(
            "lib/assets/banner.jpg",
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 10),

          const Text(
            "Daftar Menu:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: daftarMenu.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final menuItem = daftarMenu[index];

                return menu(
                  context,
                  menuItem["nama"],
                  menuItem["harga"],
                  menuItem["gambar"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget menu(BuildContext context, String nama, int harga, String gambar) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(gambar, height: 70),

          const SizedBox(height: 10),

          Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),

          Text("Rp $harga"),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OrderPage(nama: nama, harga: harga, gambar: gambar),
                ),
              );
            },
            child: const Text("Pesan"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Impor paket Google Fonts
import 'package:animated_text_kit/animated_text_kit.dart'; // Impor pustaka animasi teks

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[8],
        appBar: AppBar(
          title: Text(
            'Demo Assets, Fonts & Styling',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(child: CustomProductCard()),
      ),
    );
  }
}

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Assets: Menampilkan gambar dari aset lokal
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/laptop.png', // Jalur aset lokal terdaftar di pubspec.yaml
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                // Callback jika berkas aset belum dimasukkan ke folder proyek
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 160,
                    color: Colors.blueAccent.withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.laptop,
                      size: 60,
                      color: Colors.blueAccent,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 2. Fonts: Judul Menggunakan GoogleFonts (Poppins)
            // ANIMASI TEKS: Menggabungkan TypewriterAnimatedText dengan GoogleFonts
            SizedBox(
              height: 30,
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Laptop Premium Flutter',
                    textStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                    speed: const Duration(milliseconds: 90),
                  ),
                ],
                totalRepeatCount: 3,
              ),
            ),
            const SizedBox(height: 6),

            // 3. Styling & Fonts: Deskripsi Menggunakan GoogleFonts (Lato)
            Text(
              'Perangkat terbaik untuk pengembangan aplikasi multi-platform dengan performa tinggi.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),

            // 4. Container Styling: Tombol dengan Gradien Warna
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const ProductDetailPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Lihat Detail',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Produk',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/laptop.png',
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.blueAccent.withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.laptop,
                      size: 80,
                      color: Colors.blueAccent,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Laptop Premium Flutter',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Laptop ini dirancang untuk mendukung pengembangan aplikasi '
              'multi-platform dengan performa tinggi. Prosesor yang cepat dan '
              'memori yang responsif membantu menjalankan editor kode, '
              'emulator, serta berbagai aplikasi produktivitas secara nyaman.',
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.black87,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Cocok untuk belajar pemrograman, membuat proyek Flutter, dan '
              'menyelesaikan pekerjaan sehari-hari.',
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

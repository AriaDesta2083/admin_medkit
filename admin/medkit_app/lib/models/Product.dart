import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//! MEDICAL CHECK UP

class DoctorList {
  final String name, spesialis, img, jadwal;

  DoctorList({
    required this.name,
    required this.spesialis,
    required this.img,
    required this.jadwal,
  });
}

List<DoctorList> listDoctor = [
  DoctorList(
    name: 'de. Lukman O., Sp.A',
    spesialis: 'Anak',
    img: 'https://rscitrahusada.com/assets/upload/image/Lukman.jpg',
    jadwal: 'Senin - Jumat',
  ),
  DoctorList(
      name: 'dr Bagas K., Sp.M',
      spesialis: 'Mata',
      img: 'https://rscitrahusada.com/assets/upload/image/Bagas.jpg',
      jadwal: 'Senin - Jumat'),
  DoctorList(
      name: 'dr Natalia K., Sp.A',
      spesialis: 'Anak',
      img: 'https://rscitrahusada.com/assets/upload/image/Natalia.jpg',
      jadwal: 'Senin - Jumat'),
];

class PesananItem {
  final int price;
  final Timestamp datecreate;
  final String id,
      title,
      timepick,
      product,
      categories,
      imgurl,
      status,
      payment,
      datepick,
      uid,
      name,
      kode;

  PesananItem({
    required this.id,
    required this.timepick,
    required this.product,
    required this.price,
    required this.title,
    required this.categories,
    required this.imgurl,
    required this.status,
    required this.payment,
    required this.datepick,
    required this.datecreate,
    required this.uid,
    required this.name,
    required this.kode,
  });
}

class PsikoList {
  final int id;
  final String title, images, description, time;
  final List<double> price;
  final List<String> categories;
  final double rating;
  final bool isFavourite, isPopular;

  PsikoList({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.time,
    required this.description,
    required this.categories,
  });
}

List<PsikoList> listPsikoInstalasi = [
  PsikoList(
      id: 1,
      images: 'assets/images/PInstansi.png',
      title: 'Level Staff Rekrutmen',
      price: [125000, 150000],
      time: 'Senin - Jumat',
      categories: ['Psikotes', 'Psikotes dan Wawancara'],
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 2,
      images: 'assets/images/PInstansi.png',
      title: 'Level Staff Evaluasi/Promosi',
      price: [250000, 275000],
      categories: ['Psikotes', 'Psikotes dan Wawancara'],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 3,
      images: 'assets/images/PInstansi.png',
      title: 'Level Supervisor Rekrutmen',
      price: [180000, 200000],
      categories: ['Psikotes', 'Psikotes dan Wawancara'],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 4,
      images: 'assets/images/PInstansi.png',
      title: 'Level Supervisor Evaluasi/Promosi',
      price: [200000, 220000],
      categories: ['Psikotes', 'Psikotes dan Wawancara'],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 5,
      images: 'assets/images/PInstansi.png',
      title: 'Level Manager Rekrutmen',
      price: [250000, 275000],
      categories: ['Psikotes', 'Psikotes dan Wawancara'],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 6,
      images: 'assets/images/PInstansi.png',
      title: 'Level Manager Evaluasi/Promosi',
      price: [275000, 300000],
      categories: ['Psikotes', 'Psikotes dan Wawancara'],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
];

List<PsikoList> listPsikoIndividual = [
  PsikoList(
      id: 7,
      images: 'assets/images/PIndividu.png',
      title: 'Konseling',
      price: [100000],
      categories: [],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 8,
      images: 'assets/images/PIndividu.png',
      title: 'Psikoterapi',
      price: [100000],
      categories: [],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 9,
      images: 'assets/images/PIndividu.png',
      title: 'Tes Kecerdasan (IQ)',
      price: [180000, 200000],
      categories: [
        'Tanpa Konsultasi Hasil Psikotes',
        'Dengan Konsultasi Hasil Psikotes'
      ],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 10,
      images: 'assets/images/PIndividu.png',
      title: 'Tes Kepribadian',
      price: [180000, 200000],
      categories: [
        'Tanpa Konsultasi Hasil Psikotes',
        'Dengan Konsultasi Hasil Psikotes'
      ],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
];

List<PsikoList> listPsikoSekolah = [
  PsikoList(
      id: 11,
      images: 'assets/images/PSekolah.png',
      title: 'Kesiapan Masuk Sekolah Dasar (SD)',
      price: [50000, 55000],
      categories: ['Tanpa Tes Kepribadian', 'Disertai Tes Kepribadian'],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 12,
      images: 'assets/images/PSekolah.png',
      title:
          'Pemilihan Jurusan Kuliah (untuk siswa SMA kelas 2-3 dan Calon Mahasiswa)',
      price: [70000, 75000],
      categories: ['Tanpa Tes Kepribadian', 'Disertai Tes Kepribadian'],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
  PsikoList(
      id: 13,
      images: 'assets/images/PSekolah.png',
      title: 'Seleksi Mahasiswa Baru',
      price: [70000, 80000],
      categories: ['Tanpa Tes Kepribadian', 'Disertai Tes Kepribadian'],
      time: 'Senin - Jumat',
      description:
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
];

//!wooooooooooooooyyyyy

class MCUList {
  final int id;
  final String title, description, time;
  final List<String> images;
  final double rating, price;
  final bool isFavourite, isPopular;

  MCUList({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.time,
    required this.description,
  });
}

List<MCUList> listMCU = [
  MCUList(
    id: 21,
    images: ['assets/images/MCU.png'],
    title: 'Paket Bronze I ',
    price: 193200,
    rating: 4.0,
    time: 'Senin - Jumat',
    description: '''Darah Lengkap 
Urine Lengkap 
Feaces Lengkap 
Gula Darah Sewaktu 
Pemeriksaan Fisik oleh Dokter''',
  ),
  MCUList(
    id: 22,
    images: ['assets/images/MCU.png'],
    title: 'Paket Bronze II ',
    price: 233700,
    rating: 4.3,
    time: 'Senin - Jumat',
    description: '''Darah Lengkap 
    Urine Lengkap 
    HbsAg Kreatinin 
    Gula Darah Sewaktu 
    Pemeriksaan Fisik oleh Dokter''',
  ),
  MCUList(
    id: 23,
    images: ['assets/images/MCU.png'],
    title: 'Paket Silver I ',
    price: 444600,
    rating: 4.4,
    time: 'Senin - Jumat',
    description: '''Darah Lengkap 
Lemak Lengkap 
Asam Urat 
SGPT Kreatinin 
Gula Darah Sewaktu 
Urine Lengkap 
Thorax Foto 
Pemeriksaan Fisik oleh Dokter''',
  ),
  MCUList(
    id: 24,
    images: ['assets/images/MCU.png'],
    title: 'Paket Silver II ',
    price: 509200,
    rating: 4.7,
    time: 'Senin - Jumat',
    description: '''Darah Lengkap 
Lemak Lengkap 
Asam Urat 
SGOT 
SGPT 
Kreatinin 
BUN 
Gula Darah Sewaktu 
Urine Lengkap 
Thorax Foto 
Pemeriksaan Fisik oleh Dokter''',
  ),
  MCUList(
    id: 25,
    images: ['assets/images/MCU.png'],
    title: 'Paket Gold ',
    price: 646950,
    rating: 4.9,
    time: 'Senin - Jumat',
    description: '''Darah Lengkap 
Lemak Lengkap 
Urine Lengkap 
Feaces Lengkap 
Asam Urat 
SGOT 
SGPT 
Kreatinin 
BUN 
HbsAg 
Gula Darah Sewaktu 
EKG 
Thorax Foto 
Pemeriksaan Fisik oleh Dokter''',
  ),
];

//! RAWAT INAP

class RawatList {
  final int id;
  final String title, description;
  final List<String> images;
  final double rating, price, stock;
  final bool isFavourite, isPopular;

  RawatList({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.stock,
  });
}

List<RawatList> listRawat = [
  RawatList(
      id: 31,
      images: [
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/vvipa2.JPG',
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/vvipa3.JPG',
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/vvipa1.JPG',
      ],
      title: 'VVIP A',
      rating: 5.0,
      price: 0000000,
      description: '''Bed Electric
TV LCD
Lemari Es
Ruang Tamu
AC
Bed Penunggu
Sofa Keluarga
Tea & Coffe set
Kamar Mandi dengan Air Hangat
''',
      stock: 00),
  RawatList(
      id: 32,
      images: [
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/vvipb1.JPG',
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/vvipb2.JPG',
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/vvipb3.JPG',
      ],
      title: 'VVIP B',
      rating: 5.0,
      price: 0000000,
      description: '''
Bed Electric
TV LCD
Lemari Es
Ruang Tamu
AC
Bed Penunggu
Sofa Keluarga
Tea & Coffe set
Kamar Mandi dengan Air Hangat''',
      stock: 00),
  RawatList(
      id: 33,
      images: [
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/11.JPG',
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/12.JPG',
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/13.JPG',
      ],
      title: 'KELAS 1',
      rating: 5.0,
      price: 0000000,
      description: '''1 Bed Pasien
Sofa Keluarga
Lemari Es
TV
AC
Kamar Mandi dengan Air Hangat
''',
      stock: 00),
  RawatList(
      id: 34,
      images: [
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/21.jpg',
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/22.jpg',
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/23.JPG',
      ],
      title: 'KELAS 2',
      price: 0000000,
      rating: 5.0,
      description: '''1 Bed Pasien
Sofa Keluarga
Lemari Es
TV
AC
Kamar Mandi dengan Air Hangat''',
      stock: 00),
  RawatList(
      id: 35,
      images: [
        'https://rscitrahusada.com/assets/upload/image/thumbs/ruang/kelas3.jpg'
      ],
      title: 'KELAS 3',
      price: 0000000,
      rating: 5.0,
      description: '''8 Bed Pasien
Kamar Mandi
Kipas Angin
''',
      stock: 00),
];

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

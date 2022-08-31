import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CProduct extends GetxController {
  CollectionReference mproduct =
      FirebaseFirestore.instance.collection('product');

  var title = 'default'.obs;
  var product = 'default'.obs;
  var deskripsi = 'default'.obs;
  var price = [].obs;
  var categories = [].obs;
  var photoUrl = [].obs;
  var jamOp = [].obs;
  var active = false.obs;
  var rate = 5.0.obs;

  void onReload() {
    title.value = 'default';
    product.value = 'default';
    deskripsi.value = 'default';
    price.value = [];
    categories.value = [];
    photoUrl.value = [];
    jamOp.value = [];
    active.value = false;
    rate.value = 5.0;
  }

  void onRefresh() {
    title.value = 'default';
    deskripsi.value = 'default';
    price.value = [];
    categories.value = [];
    photoUrl.value = [];
    jamOp.value = [];
    active.value = false;
    rate.value = 5.0;
  }

  Future<void> onProduct() async {
    mproduct
        .doc(title.value)
        .set({
          'title': title.value,
          'product': product.value,
          'price': price,
          'categories': categories,
          'deskripsi': deskripsi.value,
          'jamOp': jamOp,
          'photoUrl': photoUrl,
          'active': active.value,
          'rate': rate.value,
          'datecreate':
              DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        })
        .then((value) => print('Product add'))
        .catchError((error) => print('Failed to add : $error'));
  }

  Future<void> onEditProduct(idProduct) async {
    mproduct
        .doc(idProduct)
        .update({
          'title': title.value,
          'product': product.value,
          'price': price,
          'categories': categories,
          'deskripsi': deskripsi.value,
          'jamOp': jamOp,
          'photoUrl': photoUrl,
          'active': active.value,
          'rate': rate.value,
          'datecreate':
              DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        })
        .then((value) => print('Product add'))
        .catchError((error) => print('Failed to add : $error'));
  }

  Future<void> updateProduct(id, namepath, valuepath) async {
    await mproduct
        .doc(id)
        .update({namepath: valuepath})
        .then((value) => print("Product updated"))
        .catchError((error) => print("Failed to updated: $error"));
  }

  Future<void> deleteProduct(id) async {
    await mproduct
        .doc(id)
        .delete()
        .then((value) => print("Pesanan del"))
        .catchError((error) => print("Failed to delete: $error"));
  }

  Future<bool> cekProduct(String myTitle) async {
    final myProduct = await mproduct.where('title', isEqualTo: myTitle).get();

    if (myProduct.docs.isNotEmpty) {
      print('ada data');
      return true;
    } else {
      print('tidak ada data');
      return false;
    }
  }

  Future<void> pushDataAwal() async {
    final data = ProductModels.pushProduct;
    for (var i = 0; i < data.length; i++) {
      final cek = await cekProduct(data[i].title);
      if (cek != true) {
        mproduct
            .doc(data[i].title)
            .set({
              'title': data[i].title,
              'product': data[i].product,
              'price': data[i].price,
              'categories': data[i].categories,
              'deskripsi': data[i].deskripsi,
              'jamOp': data[i].jamOp,
              'photoUrl': data[i].photoUrl,
              'active': data[i].active,
              'rate': data[i].rate,
              'datecreate': data[i].datecreate
            })
            .then((value) => print(data[i].title + ' Berhasil Ditambahkan'))
            .catchError((error) => print('Failed to add : $error'));
      }
    }
  }
}

class ProductModels {
  String? id;
  final String title, product, deskripsi, datecreate;
  late List<dynamic> categories, price, photoUrl, jamOp = [];
  late bool active = true;
  final double rate;

  ProductModels(
      {required this.id,
      required this.title,
      required this.product,
      required this.deskripsi,
      required this.price,
      required this.categories,
      required this.photoUrl,
      required this.datecreate,
      required this.jamOp,
      required this.active,
      required this.rate});

  static List<ProductModels> pushProduct = [
    //! PSIKO INSTANSI
    ProductModels(
        photoUrl: ['rawatjalan.png'],
        product: 'Rawat Jalan',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Instalasi Rawat Jalan',
        price: [
          525000,
          250000,
          825000,
          550000,
          125000,
          350000,
          525000,
          650000,
          825000,
          550000,
          925000,
          550000
        ],
        categories: [
          'Poli Spesialis Penyakit Dalam',
          'Poli Spesialis Anak',
          'Poli Spesialis Bedah',
          'Poli Spesialis Kandungan',
          'Poli Spesialis Mata',
          'Poli Spesialis Gigi & Mulut',
          'Poli Spesialis Syaraf',
          'Poli Spesialis Jantung',
          'Poli Spesialis Orthopedi',
          'Poli Spesialis Kulit dan Kelamin',
          'Poli Umum',
          'Poli KIA',
        ],
        deskripsi:
            '''Rawat jalan adalah pelayanan medis kepada seorang pasien untuk tujuan pengamatan, diagnosis, pengobatan, rehabilitasi, dan pelayanan kesehatan lainnya tanpa mengharuskan pasien tersebut dirawat inap.Rawat jalan di Rumah Sakit Citra Husada dilengkapi dengan sarana dan fasilitas lengkap guna memberikan pelayanan terbaik demi kepuasan pasien.'''),
    ProductModels(
        photoUrl: ['PInstansi.png'],
        product: 'Psikologis Instansi',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Level Staff Rekrutmen',
        price: [125000, 150000],
        categories: ['Psikotes', 'Psikotes dan Wawancara'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PInstansi.png'],
        product: 'Psikologis Instansi',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Level Staff Evaluasi/Promosi',
        price: [250000, 275000],
        categories: ['Psikotes', 'Psikotes dan Wawancara'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PInstansi.png'],
        product: 'Psikologis Instansi',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Level Supervisor Rekrutmen',
        price: [180000, 200000],
        categories: ['Psikotes', 'Psikotes dan Wawancara'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PInstansi.png'],
        product: 'Psikologis Instansi',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Level Supervisor Evaluasi/Promosi',
        price: [200000, 220000],
        categories: ['Psikotes', 'Psikotes dan Wawancara'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PInstansi.png'],
        product: 'Psikologis Instansi',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Level Manager Rekrutmen',
        price: [250000, 275000],
        categories: ['Psikotes', 'Psikotes dan Wawancara'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PInstansi.png'],
        product: 'Psikologis Instansi',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Level Manager Evaluasi/Promosi',
        price: [275000, 300000],
        categories: ['Psikotes', 'Psikotes dan Wawancara'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),

    //! PSIKO Individu

    ProductModels(
        photoUrl: ['PIndividu.png'],
        product: 'Psikologis Individu',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Konseling',
        price: [100000],
        categories: ['default'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PIndividu.png'],
        product: 'Psikologis Individu',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Psikoterapi',
        price: [100000],
        categories: ['default'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PIndividu.png'],
        product: 'Psikologis Individu',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Tes Kecerdasan (IQ)',
        price: [180000, 200000],
        categories: [
          'Tanpa Konsultasi Hasil Psikotes',
          'Dengan Konsultasi Hasil Psikotes'
        ],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PIndividu.png'],
        product: 'Psikologis Individu',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Tes Kepribadian',
        price: [180000, 200000],
        categories: [
          'Tanpa Konsultasi Hasil Psikotes',
          'Dengan Konsultasi Hasil Psikotes'
        ],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),

    //! PSIKO SEKOLAH

    ProductModels(
        photoUrl: ['PSekolah.png'],
        product: 'Psikologis Sekolah',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Kesiapan Masuk Sekolah Dasar (SD)',
        price: [50000, 55000],
        categories: ['Tanpa Tes Kepribadian', 'Disertai Tes Kepribadian'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PSekolah.png'],
        product: 'Psikologis Sekolah',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title:
            'Pemilihan Jurusan Kuliah (untuk siswa SMA kelas 2-3 dan Calon Mahasiswa)',
        price: [70000, 75000],
        categories: ['Tanpa Tes Kepribadian', 'Disertai Tes Kepribadian'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),
    ProductModels(
        photoUrl: ['PSekolah.png'],
        product: 'Psikologis Sekolah',
        datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        id: '',
        jamOp: [
          '09.30',
          '10.00',
          '10.30',
          '11.00',
          '18.30',
          '19.00',
          '19.30',
          '20.00',
        ],
        active: true,
        rate: 4.8,
        title: 'Seleksi Mahasiswa Baru',
        price: [70000, 80000],
        categories: ['Tanpa Tes Kepribadian', 'Disertai Tes Kepribadian'],
        deskripsi:
            '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo ea quos ipsum! At ratione reprehenderit sapiente reiciendis veritatis ex doloribus nobis quis, suscipit provident, animi totam earum obcaecati, fugiat blanditiis.
Quisquam maiores facere, sapiente recusandae doloribus similique modi aspernatur hic iure odio corporis vitae? Commodi, error repellendus deserunt deleniti adipisci porro iste veniam quos voluptates minus rerum aliquam, et illum.'''),

    //! MCU

    ProductModels(
      photoUrl: ['MCU.png'],
      product: 'Medical Check Up',
      categories: ['default'],
      title: 'Paket Bronze I ',
      price: [193200],
      datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      id: '',
      jamOp: [
        '09.30',
        '10.00',
        '10.30',
        '11.00',
        '18.30',
        '19.00',
        '18.30',
        '20.00',
      ],
      active: true,
      rate: 4.0,
      deskripsi: '''Darah Lengkap 
Urine Lengkap 
Feaces Lengkap 
Gula Darah Sewaktu 
Pemeriksaan Fisik oleh Dokter''',
    ),
    ProductModels(
      photoUrl: ['MCU.png'],
      product: 'Medical Check Up',
      categories: ['default'],
      title: 'Paket Bronze II ',
      price: [233700],
      datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      id: '',
      jamOp: [
        '09.30',
        '10.00',
        '10.30',
        '11.00',
        '18.30',
        '19.00',
        '18.30',
        '20.00',
      ],
      active: true,
      rate: 4.3,
      deskripsi: '''Darah Lengkap 
    Urine Lengkap 
    HbsAg Kreatinin 
    Gula Darah Sewaktu 
    Pemeriksaan Fisik oleh Dokter''',
    ),
    ProductModels(
      photoUrl: ['MCU.png'],
      product: 'Medical Check Up',
      categories: ['default'],
      title: 'Paket Silver I ',
      price: [444600],
      datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      id: '',
      jamOp: [
        '09.30',
        '10.00',
        '10.30',
        '11.00',
        '18.30',
        '19.00',
        '18.30',
        '20.00',
      ],
      active: true,
      rate: 4.4,
      deskripsi: '''Darah Lengkap 
Lemak Lengkap 
Asam Urat 
SGPT Kreatinin 
Gula Darah Sewaktu 
Urine Lengkap 
Thorax Foto 
Pemeriksaan Fisik oleh Dokter''',
    ),
    ProductModels(
      photoUrl: ['MCU.png'],
      product: 'Medical Check Up',
      categories: ['default'],
      title: 'Paket Silver II ',
      price: [509200],
      datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      id: '',
      jamOp: [
        '09.30',
        '10.00',
        '10.30',
        '11.00',
        '18.30',
        '19.00',
        '18.30',
        '20.00',
      ],
      active: true,
      rate: 4.7,
      deskripsi: '''Darah Lengkap 
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
    ProductModels(
      photoUrl: ['MCU.png'],
      product: 'Medical Check Up',
      categories: ['default'],
      title: 'Paket Gold ',
      price: [646950],
      datecreate: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      id: '',
      jamOp: [
        '09.30',
        '10.00',
        '10.30',
        '11.00',
        '18.30',
        '19.00',
        '18.30',
        '20.00',
      ],
      active: true,
      rate: 4.9,
      deskripsi: '''Darah Lengkap 
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
}

import 'package:flutter/material.dart';

class MPembayaran {
  final String title;
  final List<String> name, images;

  MPembayaran({required this.title, required this.name, required this.images});
}

List<MPembayaran> listMpembayaran = [
  MPembayaran(
      title: 'E-Wallets',
      name: ['gopay', 'Qris', 'ShopeePay'],
      images: ['gopay.png', 'qris.png', 'shopeepay.png']),
  MPembayaran(
      title: 'Pembayaran Dengan Kartu',
      name: ['Visa', 'JCB', 'MasterCard'],
      images: ['visa.png', 'jcb.png', 'mastercard.png']),
  MPembayaran(title: 'Transfer Bank', name: [
    'BCA',
    'Mandiri',
    'BRIva',
    'BNI',
  ], images: [
    'bca.png',
    'mandiri.png',
    'briva.png',
    'BNI.png',
  ]),
  MPembayaran(
    title: 'Over The Counter',
    name: ['Indomaret', 'Alfamart'],
    images: ['indomaret.png', 'alfamart.png'],
  ),
  MPembayaran(
      title: 'Direct Debit',
      name: ['BCA Klik Pay', 'BRImo'],
      images: ['bcaklikpay.png', 'brimo.png']),
];

// https://midtrans.com/features/payment-methods/direct-debit/uob-ez-pay-1
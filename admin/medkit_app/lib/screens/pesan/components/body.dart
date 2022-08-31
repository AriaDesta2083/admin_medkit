import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medkit_app/components/custom_surfix_icon.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/components/form_error.dart';
import 'package:medkit_app/controller/get_controll.dart';
import 'package:medkit_app/helper/keyboard.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/home/home_screen.dart';
import 'package:medkit_app/screens/pembayaran/pembayaran_screen.dart';
import 'package:medkit_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                // Text('Silahkan pilih tanggal janji medis :'),

                CompletePesanForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompletePesanForm extends StatefulWidget {
  @override
  _CompletePesanFormState createState() => _CompletePesanFormState();
}

class _CompletePesanFormState extends State<CompletePesanForm> {
  final auth = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference profile = FirebaseFirestore.instance.collection('admin');
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  final cpayment = Get.put(CPayment());
  final cPesan = Get.put(CPemesanan());
  DateTime selectedDay = DateTime.now();
  String? datepick = 'Pilih Tanggal Janji Medis';
  String? name;
  String? id;
  String? email;
  String pesan = 'Data belum terisi';

  // String? lastName;
  String? phoneNumber;
  String? address;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: profile.where('id', isEqualTo: auth!.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var myData = snapshot.data!.docs;
            if (myData.isNotEmpty) {
              for (var i = 0; i < myData.length; i++) {
                id = myData[i].id;
                name = myData[i]['name'];
                phoneNumber = myData[i]['phone'];
                address = myData[i]['addres'];
                email = myData[i]['email'];
              }

              // var test = id.toString() +
              //     name.toString() +
              //     email.toString() +
              //     address.toString();

            } else if (myData.isEmpty) {
              name = auth!.displayName == null
                  ? pesan
                  : auth!.displayName.toString();
              phoneNumber = auth!.phoneNumber == null
                  ? pesan
                  : auth!.phoneNumber.toString();
              address = pesan;
              email = auth!.email.toString() == null
                  ? pesan
                  : auth!.email.toString();

              profile.add({
                'id': auth!.uid,
                'name': name.toString(),
                'phone': phoneNumber.toString(),
                'addres': address.toString(),
                'email': email.toString(),
              });
              // print('profile belum siap');
            }
          }
          return Form(
            key: id == null ? null : _formKey,
            child: Column(
              children: [
                buildNameFormField(name.toString().toTitleCase()),
                SizedBox(height: getProportionateScreenHeight(30)),
                // buildLastNameFormField(),

                // SizedBox(height: getProportionateScreenHeight(30)),
                buildPhoneNumberFormField(phoneNumber.toString()),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildAddressFormField(address.toString().toTitleCase()),
                SizedBox(height: getProportionateScreenHeight(30)),
                //! DATE TIME
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(SizeConfig.screenWidth, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: kPrimaryColor,
                        elevation: 0.5,
                        shadowColor: kShadow),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: selectedDay,
                          locale: Locale("id", "ID"),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 2),
                          helpText: 'JANJI MEDIS',
                          selectableDayPredicate: (DateTime q) {
                            return q.weekday == 6 || q.weekday == 7
                                ? false
                                : true;
                          },
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                  colorScheme: ColorScheme.light()
                                      .copyWith(primary: kPrimaryColor)),
                              child: child!,
                            );
                          }).then((value) {
                        setState(() {
                          if (value != null) {
                            selectedDay = value;
                            datepick = DateFormat('EEEE, dd MMMM y', 'id')
                                .format(selectedDay);
                            print(DateFormat('EEEE, dd MMMM y', 'id')
                                .format(selectedDay));
                          }
                        });
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(datepick.toString()),
                        Icon(
                          Icons.calendar_month,
                          color: kWhite,
                        )
                      ],
                    )),

                SizedBox(height: getProportionateScreenHeight(30)),

                //! MPembayaran
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(SizeConfig.screenWidth, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: kPrimaryColor,
                        elevation: 0.5,
                        shadowColor: kShadow),
                    onPressed: () {
                      Get.to(() => PembayaranScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(() => Text(cpayment.payment.value.toString())),
                        Icon(
                          Icons.payment,
                          color: kWhite,
                        )
                      ],
                    )),

                SizedBox(height: getProportionateScreenHeight(40)),

                FormError(errors: errors),

                DefaultButton(
                  text: "CONFIRM",
                  press: () {
                    //! PUSH
                    if (datepick == 'Pilih Tanggal Janji Medis') {
                      addError(error: 'Silahkan memilih tanggal janji medis');
                    }
                    if (cpayment.payment.value == 'Pilih Metode Pembayaran') {
                      addError(error: 'Silahkan memilih metode pembayaran');
                    } else {
                      removeError(
                          error: 'Silahkan memilih tanggal janji medis');
                      removeError(error: 'Silahkan memilih metode pembayaran');
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        KeyboardUtil.hideKeyboard(context);

                        //! FINAL PEMBAYARAN ///////
                        cPesan.uid.value = auth!.uid;
                        cPesan.datepick.value = datepick.toString();
                        cPesan.datecreate.value =
                            DateFormat('EEEE, dd MMMM y', 'id')
                                .format(DateTime.now())
                                .toString();
                        cPesan.payment.value =
                            cpayment.payment.value.toString();
                        cPesan.name.value = name.toString();
                        setState(() {
                          cPesan.onCekPesan();
                        });
                        cPesan.onPemesanan();
                        //! ////////////////////////
                        Get.defaultDialog(
                            title: 'Pesanan Berhasil',
                            titleStyle: headingStyle.copyWith(fontSize: 20),
                            middleText:
                                'Terima Kasih $name pesanan telah berhasi dipesan',
                            // 'Terima Kasih $name $product.title telah berhasi dipesan',
                            textConfirm: 'Oke',
                            confirmTextColor: kWhite,
                            buttonColor: kPrimaryColor,
                            onConfirm: () {
                              Get.offAllNamed(HomeScreen.routeName);
                            });
                      }
                    }
                  },
                ),
              ],
            ),
          );
        });
  }

  TextFormField buildAddressFormField(String addres) {
    return TextFormField(
      initialValue: addres.toString() == pesan || addres == null
          ? null
          : addres.toString(),
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField(String phone) {
    return TextFormField(
      initialValue:
          phone.toString() == pesan || phone == null ? null : phone.toString(),
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.length >= 11) {
          removeError(error: kPhoneNumberLength);
        } else if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else if (value.length < 11) {
          addError(error: kPhoneNumberLength);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  // TextFormField buildLastNameFormField() {
  //   return TextFormField(
  //     onSaved: (newValue) => lastName = newValue,
  //     decoration: InputDecoration(
  //       labelText: "Last Name",
  //       hintText: "Enter your last name",
  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
  //     ),
  //   );
  // }

  TextFormField buildNameFormField(String myname) {
    return TextFormField(
      initialValue: myname.toString() == pesan || myname == null
          ? null
          : myname.toString(),
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nama Lengkap",
        hintText: "Enter your name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}

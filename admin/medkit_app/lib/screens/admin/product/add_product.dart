import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/components/form_error.dart';
import 'package:medkit_app/controller/get_admin.dart';
import 'package:medkit_app/controller/storage_services.dart';
import 'package:medkit_app/helper/keyboard.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/size_config.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final cProduct = Get.put(CProduct());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Product ADD'),
      // ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Container(
                    decoration: BoxDecoration(
                        color: kOrange,
                        borderRadius: BorderRadius.circular(40)),
                    child: ListTile(
                      minVerticalPadding: 0,
                      leading: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: kWhite,
                          )),
                      title: Text(
                        'Tambah Product',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: kWhite),
                      ),
                      subtitle: (cProduct.product.toString() != 'default')
                          ? Text(
                              cProduct.product.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: kWhite),
                            )
                          : Text(
                              'new product',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: kWhite),
                            ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  ProductAddForm(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductAddForm extends StatefulWidget {
  @override
  _ProductAddFormState createState() => _ProductAddFormState();
}

class _ProductAddFormState extends State<ProductAddForm> {
  final _formKey = GlobalKey<FormState>();
  final cProduct = Get.put(CProduct());

  // final productname = Get.put(CPemesanan()).product;
  final List<String?> errors = [];
  List imageList = [];
  String? title;
  String? deskripsi;
  String? product;
  String? newPrice;
  String? newCatgo = 'default';
  TextEditingController? catgo = TextEditingController(text: 'default');
  TextEditingController? price = TextEditingController();
  TextEditingController? Cproduct = TextEditingController();
  TextEditingController? Cdeskripsi = TextEditingController();
  TextEditingController? Ctitle = TextEditingController();
  TimeOfDay time = TimeOfDay.now();
  String? getTime;
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final StorageProduct storages = StorageProduct();
    if (cProduct.product.value != 'default') {
      product = cProduct.product.value;
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cProduct.product.value == 'default')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  buildProductField(),
                ],
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Title',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            buildTitleField(),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Deskripsi',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            buildDeksField(),
            Text(
              'Categoris',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              //! Categoris
              child: Column(
                children: [
                  buildCatgoField(),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: (SizeConfig.screenWidth - 40) / 3,
                        child: Text(
                          'Price',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: (SizeConfig.screenWidth - 40) / 2.5,
                          child: buildPriceField()),
                      ElevatedButton(
                        onPressed: () {
                          //! Add Categoris Product
                          if (newCatgo != null && newPrice != null) {
                            setState(() {
                              cProduct.categories.add(newCatgo);
                              cProduct.price.add(int.parse(newPrice!));
                            });
                          }
                          // print('object');
                        },
                        child: const Icon(
                          Icons.done,
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            fixedSize: const Size(40, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1000))),
                      )
                      // IconButton(onPressed: () {}, icon: Icon(Icons.done))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //! Value categoris product
            Obx(
              () => Wrap(
                children: [
                  ...List.generate(
                    cProduct.categories.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: kOrange,
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              cProduct.categories
                                  .remove('${cProduct.categories[index]}');
                              cProduct.price.remove('${cProduct.price[index]}');
                            });
                          },
                          child: Text(
                            cProduct.categories[index] +
                                ' Rp' +
                                cProduct.price[index].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: kWhite),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            //! IMG PRODUCT
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size((SizeConfig.screenWidth - 40) / 2, 40),
                  primary: kPrimaryColor),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.image,
                  // allowedExtensions: ['png', 'jpg', 'jpeg'],
                );
                if (result == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'No file selected',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kWhite),
                      ),
                    ),
                  );
                  return null;
                }

                final path = result.files.single.path;
                final fileName = result.files.single.name;
                // print('path : ' +
                //     path.toString() +
                //     'name: ' +
                //     fileName.toString());
                await storages
                    .onUploadImg(path.toString(), fileName.toString())
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text(
                        'Upload completed',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kWhite),
                      ),
                    ),
                  );
                });
                setState(() {
                  // authC.updateImgProfile(id, 'img', myimage.toString());
                  cProduct.photoUrl.add(fileName.toString());
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Upload Image'),
                  Icon(Icons.add_a_photo_rounded)
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(
              () => Wrap(
                children: [
                  ...List.generate(
                    cProduct.photoUrl.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          cProduct.photoUrl
                              .remove('${cProduct.photoUrl[index]}');
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(40)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cProduct.photoUrl[index].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: kWhite),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            //!! TIMEE

            Text('time'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size((SizeConfig.screenWidth) / 2, 40),
                  primary: kPrimaryColor),
              onPressed: () async {
                TimeOfDay? newTime = await showTimePicker(
                  context: context,
                  initialTime: time,
                  initialEntryMode: TimePickerEntryMode.input,
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child!,
                    );
                  },
                );
                if (newTime == null) return;
                setState(() {
                  time = newTime;
                  KeyboardUtil.hideKeyboard(context);
                  getTime =
                      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
                  print(getTime);
                  cProduct.jamOp.add(getTime);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Jam Operasional'),
                  Icon(Icons.more_time_rounded)
                ],
              ),
            ),
            Obx(
              () => Wrap(
                children: [
                  ...List.generate(
                    cProduct.jamOp.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: kOrange,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              cProduct.jamOp.remove('${cProduct.jamOp[index]}');
                            });
                          },
                          child: Text(
                            cProduct.jamOp[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: kWhite),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            //!!! PUSH
            FormError(errors: errors),
            DefaultButton(
              text: "Add Product",
              press: () async {
                if (_formKey.currentState!.validate()) {
                  if (cProduct.photoUrl.isEmpty &&
                      cProduct.jamOp.isEmpty &&
                      cProduct.categories.isEmpty) {
                    addError(error: 'Data tidak lengkap data');
                    setState(() {});
                  } else {
                    removeError(error: 'Data tidak lengkap data');
                    cProduct.title.value = title.toString();
                    cProduct.product.value = product.toString();
                    cProduct.deskripsi.value = deskripsi.toString();
                    final cekdata = await cProduct.cekProduct(title.toString());
                    if (cekdata == true) {
                      Get.defaultDialog(
                          title: 'Gagal Tambah Data',
                          middleText:
                              '${cProduct.title.value.toString()} telah tersedia');
                    } else {
                      Get.defaultDialog(
                          title: 'Tambah Product',
                          content: Column(
                            children: [
                              Text('Product : ' +
                                  cProduct.product.value.toString()),
                              Text(
                                  'Title : ' + cProduct.title.value.toString()),
                              ...List.generate(
                                cProduct.categories.length,
                                (item) => Column(
                                  children: [
                                    Text('Categories' +
                                        cProduct.categories[item] +
                                        cProduct.price[item].toString()),
                                  ],
                                ),
                              ),
                              Text(
                                'Deskripsi : ' + cProduct.deskripsi.value,
                              ),
                              ...List.generate(
                                cProduct.jamOp.length,
                                (item) => Column(
                                  children: [
                                    Text('Jam Operasi : ' +
                                        cProduct.jamOp[item]),
                                  ],
                                ),
                              ),
                              ...List.generate(
                                imageList.length,
                                (item) => Column(
                                  children: [
                                    Text('image :' + imageList[item]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          buttonColor: kPrimaryColor,
                          confirmTextColor: kWhite,
                          cancelTextColor: kPrimaryColor,
                          onCancel: () {},
                          onConfirm: () {
                            setState(() {
                              cProduct.onProduct();
                              cProduct.onRefresh();
                              price!.clear();
                              catgo!.clear();
                              Cproduct?.clear();
                              Ctitle?.clear();
                              Cdeskripsi?.clear();
                              Get.back();
                            });
                            setState(() {});
                          });
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildDeksField() {
    return TextFormField(
        controller: Cdeskripsi,
        maxLines: null,
        minLines: 4,
        onSaved: (newValue) => deskripsi = newValue,
        onChanged: (value) => deskripsi = value,
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        decoration:
            productfield.copyWith(hintText: 'Masukkan deskripsi product'));
  }

  TextFormField buildTitleField() {
    return TextFormField(
        controller: Ctitle,
        onSaved: (newValue) => title = newValue,
        onChanged: (value) => title = value,
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        decoration: productfield.copyWith(hintText: 'Masukan judul product'));
  }

  TextFormField buildProductField() {
    return TextFormField(
        controller: Cproduct,
        onSaved: (newValue) => product = newValue,
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        onChanged: (value) => product = value,
        decoration: productfield.copyWith(hintText: 'Masukan judul product'));
  }

  TextField buildCatgoField() {
    return TextField(
        controller: catgo,
        onChanged: (value) => newCatgo = value,
        decoration: productfield.copyWith(
          hintText: 'Masukkan kategori product ',
          border: outlineInputBorderPrimary,
          focusedBorder: outlineInputBorderPrimary,
          enabledBorder: outlineInputBorderPrimary,
        ));
  }

  TextField buildPriceField() {
    return TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("^[1-9].*")),
          FilteringTextInputFormatter.digitsOnly
        ],
        controller: price,
        onChanged: (value) => newPrice = value,
        decoration: productfield.copyWith(
          hintText: 'RP ',
          border: outlineInputBorderPrimary,
          focusedBorder: outlineInputBorderPrimary,
          enabledBorder: outlineInputBorderPrimary,
        ));
  }
}

OutlineInputBorder outlineInputBorderr = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide:
      const BorderSide(color: kOrange, width: 1, style: BorderStyle.solid),
  gapPadding: 2.0,
);
OutlineInputBorder outlineInputBorderPrimary = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
      color: kPrimaryColor, width: 1, style: BorderStyle.solid),
  gapPadding: 2.0,
);

InputDecoration productfield = InputDecoration(
  fillColor: kPrimaryColor,
  filled: false,
  border: outlineInputBorderr,
  focusedBorder: outlineInputBorderr,
  enabledBorder: outlineInputBorderr,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 10,
  ),
);

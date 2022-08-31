import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/controller/get_controll.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/MPembayaran.dart';
import 'package:medkit_app/screens/pesan/pesan_screen.dart';
import 'package:medkit_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: Column(
          children: [
            ...List.generate(listMpembayaran.length, ((index) {
              return DropWidget(
                listMpembayaran[index],
              );
            }))
          ],
        ),
      )
    ]);
  }
}

class DropWidget extends StatefulWidget {
  DropWidget(this.data);
  final MPembayaran data;

  @override
  State<DropWidget> createState() => _DropWidgetState();
}

class _DropWidgetState extends State<DropWidget> {
  bool changee = false;
  final cpayment = Get.put(CPayment());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          changee = !changee;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(width: 1, color: kWhite)),
            gradient: kPrimaryGraColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.data.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: kWhite),
                    ),
                    Icon(
                      changee == false
                          ? Icons.arrow_drop_down_sharp
                          : Icons.arrow_drop_up_sharp,
                      color: kWhite,
                    ),
                  ],
                ),
              ),
              if (changee == true)
                ...List.generate(
                    widget.data.name.length,
                    ((index) => InkWell(
                          onTap: () {
                            var newPayment = widget.data.name[index];
                            cpayment.changePayment(newPayment);
                            Get.back();
                          },
                          child: Items(widget.data.name[index],
                              widget.data.images[index]),
                        ))),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  final String nama, images;

  Items(this.nama, this.images);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      height: 50,
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadowBOX,
          border: Border.all(color: Color.fromARGB(139, 90, 90, 90))),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: 100,
            child: Text(
              nama,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/images/' + images,
            width: 90,
            height: 40,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

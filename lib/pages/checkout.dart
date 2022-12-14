// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider/cart.dart';
import 'package:test_app/shared/appbar.dart';
import 'package:test_app/shared/color.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("Checkout"),
        actions: [pap()],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
                height: 550,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: cart.selectedProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(cart.selectedProducts[index].name),
                          subtitle: Text(
                              "${cart.selectedProducts[index].price} - ${cart.selectedProducts[index].location}"),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                cart.selectedProducts[index].imgPath),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                cart.delete(cart.selectedProducts[index]);
                              },
                              icon: Icon(Icons.remove)),
                        ),
                      );
                    })),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Pay \$${cart.price}",
              style: TextStyle(fontSize: 19),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(BTNpink),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
          ),
        ],
      ),
    );
  }
}

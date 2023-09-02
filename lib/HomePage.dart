import 'package:flutter/material.dart';
import 'package:shopify/ApiConstants.dart';
import 'package:shopify/DioHelper.dart';
import 'package:shopify/products.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<products> product = [];

  Future<List> getData() async {
    List myproducts = await DioHelper()
        .getProducts(path: ApiConstants.baseUrl + ApiConstants.EndPoint);
    product = products.ConvertToProducts(myproducts);
    return product;
    //setState(() {});
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: FutureBuilder(
            future: getData(),
            builder: (context, Snapshot) {
              if (Snapshot.hasError)
                return Center(child: Text('ERROR'));
              else if (Snapshot.hasData)
                return ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return Container(
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.only(bottom: 8),
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(children: [
                          Expanded(
                            child: Column(children: [
                              Image.network(
                                product[index].Image,
                                fit: BoxFit.fitWidth,
                              ),
                              Text(
                                product[index].title,
                                style: TextStyle(color: Colors.black),
                              ),
                            ]),
                          ),
                         PressedIconButton(product[index])
                        ]));
                  },
                );
              else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

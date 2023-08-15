import 'package:flutter/material.dart';
import 'package:gprojuktitask/provider/product_provider.dart';
import 'package:gprojuktitask/screen/product_page.dart';
import 'package:provider/provider.dart';

import '../models/categorymodel.dart';

class SubCategoryPage extends StatefulWidget {

  final List<Categories>? categoriesList;


  SubCategoryPage(this.categoriesList);

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context,productprovider,child){
      return Scaffold(
        appBar: AppBar(
          title: Text('Sub Category'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: widget.categoriesList!.length,
              itemBuilder: (_,index){
                var data = widget.categoriesList![index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context,(MaterialPageRoute(builder: (builder)=> ProductPage(data.slug.toString()))));
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Image.network(data.logo.toString())
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(data.name.toString()),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    });
  }
}

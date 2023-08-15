import 'package:flutter/material.dart';
import 'package:gprojuktitask/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final String slug;
  const ProductPage(this.slug,{super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context,listen: false).getProductBySlug(widget.slug);
    return Consumer<ProductProvider>(builder: (context,product,child){
      return Scaffold(
        appBar: AppBar(
          title: Text('Product Page'),
        ),
        body: product.isLoading?Center(
          child: CircularProgressIndicator(),
        ):ListView.builder(
          itemCount: product.productList.length,
          itemBuilder: (_,index){
            var data = product.productList[index];
            return Container(
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(data.image.toString(),scale: 1,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(data.name.toString()),
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

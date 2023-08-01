import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery_store/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_store/features/home/bloc/home_bloc.dart';
import 'package:grocery_store/features/home/models/product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget(
      {super.key, required this.product, required this.cartBloc});

  final ProductDataModel product;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(product.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${product.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  // IconButton(
                  //   onPressed: () {
                  //     // cartBloc.add(HomeProductWishlistButtonClickedEvent(
                  //     //     clickedProduct: product));
                  //   },
                  //   icon: const Icon(Icons.favorite_outline),
                  // ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemoveFromCartEvent(
                        productDataModel: product
                      ));
                    },
                    icon: const Icon(Icons.shopping_bag),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

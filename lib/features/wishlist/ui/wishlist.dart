import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_store/data/wishlist_items.dart';
import 'package:grocery_store/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_store/features/cart/ui/cart_tile_widget.dart';
import 'package:grocery_store/features/home/ui/product_tile_widget.dart';
import 'package:grocery_store/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:grocery_store/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist Items'),
           backgroundColor: Colors.teal,
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is !WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                        wishlistBloc: wishlistBloc,
                        product: successState.wishlistItems[index]);
                  },
                );
              default:
                return const SizedBox();
            }
          },
        ));
  }
}

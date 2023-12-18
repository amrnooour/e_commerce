import 'package:e_commerce/ui/screens/cart/cart_item.dart';
import 'package:e_commerce/ui/shared_view_models/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  static const String routeName = "cart";

  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late CartViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    print("cartdm: ${viewModel.cartDm}");
    print("list: ${viewModel.cartDm?.products}");
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Cart"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 20,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: viewModel,
        builder: (context, _) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: viewModel.cartDm?.products?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CartItem(
                          cartProduct: viewModel.cartDm!.products![index]);
                    }),
              ),
              Text("${viewModel.cartDm?.totalCartPrice}")
            ],
          );
        },
      ),
    );
  }
}
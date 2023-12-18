import 'package:e_commerce/data/model/response/categories_dm.dart';
import 'package:e_commerce/data/model/response/product_dm.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/cart/cart.dart';
import 'package:e_commerce/ui/screens/main/tabs/home/home_view_model.dart';
import 'package:e_commerce/ui/shared_view_models/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:e_commerce/ui/utils/exennsions.dart';
import 'package:e_commerce/ui/widgets/category_item.dart';
import 'package:e_commerce/ui/widgets/error_view.dart';
import 'package:e_commerce/ui/widgets/loading_widget.dart';
import 'package:e_commerce/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel viewModel = getIt();
  late CartViewModel cartViewModel;

  @override
  void initState() {
    super.initState();
    cartViewModel = BlocProvider.of(context, listen: false);
    viewModel.loadCategories();
    viewModel.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Home"),
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
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pushNamed(context, Cart.routeName);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: BlocBuilder(
                  bloc: viewModel.getAllCategoriesUseCase,
                  builder: (context, state) {
                    if (state is BaseRequestSuccessState<List<CategoryDM>>) {
                      return buildCategoriesGridView(state.data!);
                    } else if (state is BaseRequestErrorState) {
                      return ErrorView(message: state.message);
                    } else {
                      return const LoadingWidget();
                    }
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: BlocBuilder(
                  bloc: viewModel.getAllProductsUseCase,
                  builder: (context, state) {
                    if (state is BaseRequestSuccessState<List<ProductDM>>) {
                      return buildProductsListView(state.data!);
                    } else if (state is BaseRequestErrorState) {
                      return ErrorView(message: state.message);
                    } else {
                      return const LoadingWidget();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCategoriesGridView(List<CategoryDM> list) => GridView.builder(
      itemCount: list.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryItem(categoryDM: list[index]);
      });

  Widget buildProductsListView(List<ProductDM> list) =>
      BlocBuilder<CartViewModel, dynamic>(
        builder: (context, state) {
          if (state is! BaseRequestLoadingState) {
            return ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = list[index];
                  return ProductItem(
                      productDM: product,
                      isInCart: cartViewModel.isInCart(product) != null);
                });
          } else {
            return const LoadingWidget();
          }
        },
      );
}
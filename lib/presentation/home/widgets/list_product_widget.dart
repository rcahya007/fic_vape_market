import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vape_market/bloc/checkout/checkout_bloc.dart';
import 'package:vape_market/bloc/get_products/get_products_bloc.dart';
import 'package:vape_market/data/models/responses/list_product_response_model.dart';

class ListProductWidget extends StatefulWidget {
  const ListProductWidget({super.key});

  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  void initState() {
    context.read<GetProductsBloc>().add(DoGetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsError) {
          return const Center(
            child: Text('data error'),
          );
        }

        if (state is GetProductsLoaded) {
          if (state.data.data!.isEmpty) {
            return const Center(
              child: Text('Data Kosong'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final Product product = state.data.data![index];

              return Card(
                elevation: 2,
                shadowColor: const Color(0xffEE4d2d),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Hero(
                      tag: product.attributes!.imageUrl!,
                      child: SizedBox(
                        width: 150,
                        height: 120,
                        child: Image.network(
                          product.attributes!.imageUrl!,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      product.attributes!.productPrice!.toString(),
                      style: const TextStyle(
                        color: Color(0xffee4d2d),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Text(
                        product.attributes!.productName!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  size: 20,
                                  color: Color(0xffee4d2d),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Beli',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(
                                      0xffee4d2d,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<CheckoutBloc>().add(
                                        RemoveFromCartEvent(product: product));
                                  },
                                  child: const Icon(
                                    Icons.remove_circle_outline,
                                    size: 18,
                                    color: Color(
                                      0xffee4d2d,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Text('0'),
                                ),
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<CheckoutBloc>()
                                        .add(AddToCartEvent(product: product));
                                  },
                                  child: const Icon(
                                    Icons.add_circle_outline,
                                    size: 18,
                                    color: Color(
                                      0xffee4d2d,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            itemCount: state.data.data!.length,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

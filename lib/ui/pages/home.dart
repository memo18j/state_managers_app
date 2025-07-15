import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers_app/config/providers/bloc/shopping_bloc.dart';
import 'package:state_managers_app/config/providers/cubit/cat_cubit.dart';
import 'package:state_managers_app/ui/widgets/shopping_list.dart';
import 'package:weinds/weinds.dart';

import '../../config/routes/app_routes.dart';
import '../widgets/cat_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();
    final shoppingBloc = BlocProvider.of<ShoppingBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: WeinDSSizes.sizeXXS,
        backgroundColor: WeinDsColors.strongPrimary,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: WeinDsColors.strongPrimary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ejemplo Gestor Estado',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Cocogoose',
                      color: WeinDsColors.light,
                      fontSize: WeinDsFoundation.fontSizeH4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 31),
                  const Text(
                    'Provider',
                    style: TextStyle(
                      fontFamily: 'Cocogoose',
                      color: WeinDsColors.light,
                      fontSize: WeinDsFoundation.fontSizeH6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  BlocBuilder<CatCubit, CatState>(
                    builder: (context, state) {
                      return CatCardWidget(
                        action: state.action,
                        imageCat: state.image,
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.stateCat);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: WeinDsColors.light,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListView(
                    children: [
                      const Text(
                        'Lista de Compras',
                        style: TextStyle(
                          fontFamily: 'Cocogoose',
                          fontWeight: FontWeight.bold,
                          color: WeinDsColors.strongPrimary,
                          fontSize: WeinDsFoundation.fontSizeH4,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        '¿Que deseas comprar?',
                        style: TextStyle(
                          fontFamily: 'Cocogoose',
                          fontWeight: FontWeight.bold,
                          color: WeinDsColors.scale05,
                          fontSize: WeinDsFoundation.fontSizeH4,
                        ),
                      ),
                      TextFormField(
                        controller: myController,
                        validator: (value) => value!.isEmpty
                            ? 'Por favor ingrese un valor'
                            : null, // Validación de campo requerido
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: WeinDsColors.scale02,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: WeinDsColors.dark,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        minWidth: 100,
                        height: 50,
                        onPressed: () {
                          if (myController.text.isNotEmpty) {
                            shoppingBloc.add(
                              AddItemEvent(item: myController.text),
                            );
                            myController
                                .clear(); // Clear the text field after adding
                          }
                        },
                        color: WeinDsColorsFoundation
                            .colorButtonPrimary, // Transparent background for secondary button
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.5,
                            color: WeinDsColors.strongPrimary,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Text(
                          'Adicionar!',
                          style: TextStyle(
                            color: WeinDsColors.light,
                            fontSize: 27,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 300,
                        child: BlocBuilder<ShoppingBloc, ShoppingState>(
                          bloc: BlocProvider.of<ShoppingBloc>(context),
                          builder: (context, state) {
                            if (state is LoadingListState) {
                              return const CircularProgressIndicator();
                            } else if (state is ShoppingInitial) {
                              return Center(
                                child: const Text('No hay items en la lista'),
                              );
                            } else if (state is LoadedListState) {
                              return ShoppingListWidget(
                                list: state.items,
                                onPressed: (index) {
                                  shoppingBloc.add(
                                    RemoveItemEvent(index: index),
                                  );
                                },
                              );
                            } else {
                              return const Text('Error al cargar la lista');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

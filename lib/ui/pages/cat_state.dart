import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers_app/config/contants/copys_app.dart';
import 'package:state_managers_app/config/providers/bloc/shopping_bloc.dart';
import 'package:state_managers_app/config/providers/cubit/cat_cubit.dart';
import 'package:state_managers_app/ui/widgets/cat_card.dart';
import 'package:state_managers_app/ui/widgets/shopping_list.dart';
import 'package:weinds/weinds.dart';

class CatStatePage extends StatelessWidget {
  const CatStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final catBloc = BlocProvider.of<CatCubit>(context);
    final shoppingBloc = BlocProvider.of<ShoppingBloc>(context);
    return Scaffold(
      backgroundColor: WeinDsColors.strongPrimary,
      appBar: AppBar(
        foregroundColor: WeinDsColors.light,
        toolbarHeight: WeinDSSizes.sizeXXS,
        backgroundColor: WeinDsColors.strongPrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      'Establecer estado',
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
                      '¿En que estado se encuentra el gato?',
                      style: TextStyle(
                        fontFamily: 'Cocogoose',
                        color: WeinDsColors.light,
                        fontSize: WeinDsFoundation.fontSizeH6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    CatCardWidget(
                      imageCat: CopysApp.pathCatEat,
                      action: CopysApp.actionEat,
                      viewScafoldMsg: true,
                      onPressed: () {
                        catBloc.updateCat(
                          image: CopysApp.pathCatEat,
                          action: CopysApp.actionEat,
                        );
                      },
                    ),
                    const SizedBox(height: 18.0),
                    CatCardWidget(
                      imageCat: CopysApp.pathCatJump,
                      action: CopysApp.actionJump,
                      viewScafoldMsg: true,
                      onPressed: () {
                        catBloc.updateCat(
                          image: CopysApp.pathCatJump,
                          action: CopysApp.actionJump,
                        );
                      },
                    ),
                    const SizedBox(height: 18.0),
                    CatCardWidget(
                      imageCat: CopysApp.pathCatSleep,
                      action: CopysApp.actionSleep,
                      viewScafoldMsg: true,
                      onPressed: () {
                        catBloc.updateCat(
                          image: CopysApp.pathCatSleep,
                          action: CopysApp.actionSleep,
                        );
                      },
                    ),
                    const SizedBox(height: 18.0),
                    CatCardWidget(
                      imageCat: CopysApp.pathCatPlay,
                      action: CopysApp.actionPlay,
                      viewScafoldMsg: true,
                      onPressed: () {
                        catBloc.updateCat(
                          image: CopysApp.pathCatPlay,
                          action: CopysApp.actionPlay,
                        );
                      },
                    ),
                    const SizedBox(height: 18.0),
                    CatCardWidget(
                      imageCat: CopysApp.pathCatRunning,
                      action: CopysApp.actionRunning,
                      viewScafoldMsg: true,
                      onPressed: () {
                        catBloc.updateCat(
                          image: CopysApp.pathCatRunning,
                          action: CopysApp.actionRunning,
                        );
                      },
                    ),
                    const SizedBox(height: 18.0),
                    const Text(
                      'Lista actual de compras',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Cocogoose',
                        color: WeinDsColors.light,
                        fontSize: WeinDsFoundation.fontSizeH4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 400,
                      decoration: const BoxDecoration(
                        color: WeinDsColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: BlocBuilder<ShoppingBloc, ShoppingState>(
                          builder: (BuildContext context, ShoppingState state) {
                            if (state is LoadingListState) {
                              return const CircularProgressIndicator();
                            } else if (state is LoadedListState) {
                              return ShoppingListWidget(
                                list: state.items,
                                colorBackground: Colors.transparent,
                                colorText: Colors.white,
                                onPressed: (index) {
                                  shoppingBloc.add(
                                    RemoveItemEvent(index: index),
                                  );
                                },
                              );
                            } else {
                              return const Text('algo salio mal');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

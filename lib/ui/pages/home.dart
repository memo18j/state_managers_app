import 'package:flutter/material.dart';
import 'package:weinds/weinds.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();
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

                  Container(
                    height: 184,
                    width: MediaQuery.of(context).size.width * 0.9,
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg-card.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          WeinDsAssetImage(
                            path: 'assets/images/cat-eat.png',
                            widthImage: 180,
                          ),
                          Expanded(
                            child: MaterialButton(
                              minWidth: 100,
                              height: 50,
                              onPressed: () {},
                              color: WeinDsColorsFoundation
                                  .colorButtonSecondary, // Transparent background for secondary button
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 0.5,
                                  color: WeinDsColors.strongPrimary,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: SizedBox(
                                height: 63,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('el gato esta'),
                                    Text('comiendo'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          if (myController.text.isNotEmpty) {}
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
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          itemCount: 0,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: WeinDsColors.scale01,
                              ),
                              child: ListTile(
                                title: Text('title'),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {},
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 8);
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

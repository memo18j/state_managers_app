import 'package:flutter/material.dart';
import 'package:weinds/weinds.dart';

import '../../config/contants/copys_app.dart';

class CatCardWidget extends StatelessWidget {
  final String imageCat;
  final String action;
  final VoidCallback onPressed;
  final bool? viewScafoldMsg;
  const CatCardWidget({
    super.key,
    required this.imageCat,
    required this.action,
    required this.onPressed,
    this.viewScafoldMsg = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184,
      width: MediaQuery.of(context).size.width * 0.9,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CopysApp.pathBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            WeinDsAssetImage(path: imageCat, widthImage: 180),
            Expanded(
              child: MaterialButton(
                minWidth: 100,
                height: 50,
                onPressed: () {
                  onPressed();
                  if (viewScafoldMsg == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Estado cambiado, el gato esta $action'),
                      ),
                    );
                  }
                },
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
                    children: [const Text('el gato esta'), Text(action)],
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

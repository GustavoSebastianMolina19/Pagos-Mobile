import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/data/tarjetas.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/tarjeta_page.dart';
import 'package:stripe_app/widgets/total_pago.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe pay'),
        actions: [
          IconButton(
            onPressed: () async {
              //mostrarAlerta(context, 'msj2', 'msj3');
              mostrarLoading(context);
              await Future.delayed(const Duration(seconds: 2));
              Navigator.pop(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 100,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: tarjetas.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, i) {
                final tarjeta = tarjetas[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, navegarFadeIn(context, TarjetaPage()));
                  },
                  child: Hero(
                    tag: tarjeta.cardNumber,
                    child: CreditCardWidget(
                      cardNumber: tarjeta.cardNumberHidden,
                      expiryDate: tarjeta.expiracyDate,
                      cardHolderName: tarjeta.cardHolderName,
                      cvvCode: tarjeta.cvv,
                      showBackView: false,
                      onCreditCardWidgetChange: (CreditCardBrand) {},
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            child: TotalPayButton(),
            bottom: 0,
          ),
        ],
      ),
    );
  }
}

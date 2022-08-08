import 'package:caronapp_front/pages/final_corrida/widgets/opcao_gorjeta.dart';
import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botao_vermelho_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

import '../motorista/models/motorista/Motorista.dart';

class AvalieMotoristaPage extends StatefulWidget {
  final Motorista motorista;
  const AvalieMotoristaPage({Key? key, required this.motorista})
      : super(key: key);

  @override
  State<AvalieMotoristaPage> createState() => _AvalieMotoristaPageState();
}

class _AvalieMotoristaPageState extends State<AvalieMotoristaPage> {
  double rating = 5;
  List<int> gorjetaPrecos = [2, 5, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Column(
          children: [
            const Text(
              "Avalie o Motorista",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                  color: AppColors.cinzaEscuro,
                  borderRadius: BorderRadius.circular(16)),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.cinzaClaro,
                        borderRadius: BorderRadius.circular(44),
                      ),
                      child: SvgPicture.string(
                          height: 80,
                          width: 80,
                          multiavatar(widget.motorista.foto,
                              trBackground: true))),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.motorista.rate.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.star,
                              color: AppColors.brancosSub,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${widget.motorista.idade} anos",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "${widget.motorista.nome} ${widget.motorista.sobrenome}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.verified,
                              color: AppColors.azulClaro,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.assignment),
                            const SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                widget.motorista.curso,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            RatingBar.builder(
                allowHalfRating: true,
                initialRating: 5,
                itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: AppColors.vermelhoGrena,
                    ),
                onRatingUpdate: (val) {
                  rating = val;
                }),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(gorjetaPrecos.length,
                  (index) => OpcaoWidgetGorjeta(preco: gorjetaPrecos[index])),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Escolhe outro valor...",
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                )),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: const Icon(
                          Icons.warning,
                          size: 60,
                        ),
                        tooltip: 'Denunciar',
                        onPressed: () {}),
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: const Icon(
                          Icons.chat,
                          size: 60,
                        ),
                        tooltip: 'Chat',
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
            const Spacer(),
            BotaoVermelhoWidget(
              fontSize: 24,
              child: "Avaliar",
              width: null,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

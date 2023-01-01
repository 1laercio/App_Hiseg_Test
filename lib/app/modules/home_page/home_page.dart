import 'package:app_hiseg_test/app/core/data/model/users.dart';
import 'package:app_hiseg_test/app/core/utils/constants/app_strings.dart';
import 'package:app_hiseg_test/app/core/utils/style/colors/general_colors.dart';
import 'package:app_hiseg_test/app/core/utils/style/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/home_service.dart';

class HomePage extends StatefulWidget {
  final Users? users;

  const HomePage({super.key, this.users});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeService controller;
  late Future<List<Users>> dadosLista;
  @override
  void initState() {
    super.initState();
    // _controller = context.read<EventoService>();
    controller = context.read<HomeService>();
    dadosLista = carregarUsers();

    // favExiste = favoritoExiste();
  }

  Future<List<Users>> carregarUsers() async {
    return await controller.buscar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackgroundUser,
      appBar: AppBar(
        backgroundColor: kColorBackground,
        title: Text(
          kUsers,
          style: TextStyles.headline1(),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder(
              future: dadosLista,
              builder: (context, snapshot) {
                if (controller.status == StatusForm.parado ||
                    controller.status == StatusForm.falha) {
                  return Center(
                    child: Text(controller.mensagem),
                  );
                } else if (controller.status == StatusForm.carregando) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var listaDados = (snapshot.data) as List<Users>;

                  return listaDados.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 4),
                          child: const Center(
                            child: Text(
                              "Não encontramos nenhum resultado!",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: listaDados.length,
                            scrollDirection: Axis.vertical,
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 15),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.id = (listaDados[index].id!);
                                  /*    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DetalhesWidget(),
                                    ),
                                  ); */
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: const BoxDecoration(
                                        color: kColorBackground,
                                        borderRadius:
                                            BorderRadiusDirectional.all(
                                                Radius.circular(10))),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              'assets/localization/maps.png',
                                              width: 74,
                                              height: 74,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        /*    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundColor: kColorBackgroundUser,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/localization/maps.png'),
                          ),
                        ),
                      ), */
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(kUserName),
                                                Text(widget.users!.name
                                                    .toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(kLocalizaton),
                                                Text(widget.users!.localization
                                                    .toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(kAge),
                                                Text(widget.users!.age
                                                    .toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(kUserType),
                                                Text(widget.users!.tipeUser
                                                    .toString())
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

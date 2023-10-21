import 'package:calculadora_imc/model/calculadora_imc.dart';
import 'package:calculadora_imc/repositories/calculadora_imc_repository.dart';
import 'package:calculadora_imc/service/imc_tabela_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var calculadoraImcRepository = CalculadoraImcRepository();
  var _listaCalculos = const <CalculadorImc>[];
  ImcTabelaService medidorImc = ImcTabelaService();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    super.initState(); 
    calculadoraImcRepository.abrirBancoDeDados();
    listarCalculos();
  }

  void listarCalculos() async {
    _listaCalculos = await calculadoraImcRepository.listar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora Imc")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pesoController.text = "";
          alturaController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return SingleChildScrollView(
                  child: AlertDialog(
                    title: const Text("Cálculo Imc"),
                    content: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(labelText: "Peso"),
                          controller: pesoController,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          decoration:
                              const InputDecoration(labelText: "Altura"),
                          controller: alturaController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            try {
                              await calculadoraImcRepository.adicionar(CalculadorImc(
                                id: _listaCalculos.length,
                                peso: double.parse(pesoController.text),
                                altura: double.parse(alturaController.text),
                                imc: ImcTabelaService.CalculadorImc(
                                    double.parse(pesoController.text),
                                    double.parse(alturaController.text)),
                                data: DateTime.now(),
                              ));
                            } catch (e) {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: const Text("Calculadora IMC"),
                                      content: const Text(
                                          "Tente informar uma altura e peso válidos"),
                                    );
                                  });
                              return;
                            }

                            Navigator.pop(context);
                            listarCalculos();
                          },
                          child: const Text("Salvar")),
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListView.builder(
          itemCount: _listaCalculos.length,
          itemBuilder: (BuildContext bc, int index) {
            var calculos = _listaCalculos[index];
            return Dismissible(
              onDismissed: (DismissDirection dismissDirection) async {
                await calculadoraImcRepository.remover(calculos.id);
                listarCalculos();
              },
              key: Key(calculos.id as String),
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                elevation: 8,
                shadowColor: Colors.grey,
                child: ListTile(
                  title: Column(
                    children: [
                      Text("Peso: ${calculos.peso}"),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("Altura: ${calculos.altura.toStringAsFixed(2)}"),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("IMC: ${calculos.imc.toStringAsFixed(1)}"),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "A situação desse IMC é: ${ImcTabelaService.calcularImc(calculos.imc)}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

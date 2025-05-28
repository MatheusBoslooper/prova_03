import 'package:flutter/material.dart';

void main() {
  runApp(const PetApp());
}

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue.shade200,
        hintColor: Colors.pink.shade200,
        scaffoldBackgroundColor: Colors.blueGrey.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue.shade200,
          foregroundColor: Colors.black87,
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink.shade200,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.pink.shade200,
            side: BorderSide(color: Colors.pink.shade200),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purple.shade200,
          foregroundColor: Colors.white,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.green.shade200),
          trackColor: MaterialStateProperty.all(Colors.green.shade100),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.green.shade200),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(Colors.green.shade200),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blueGrey.shade200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blueGrey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.lightBlue.shade200, width: 2),
          ),
          labelStyle: TextStyle(color: Colors.blueGrey.shade600),
          hintStyle: TextStyle(color: Colors.blueGrey.shade400),
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue.shade800,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue.shade700,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.blueGrey.shade800,
          ),
        ),
      ),
      home: const PerfilPetScreen(),
    );
  }
}

enum PetGenero { macho, femea }

class PerfilPetScreen extends StatefulWidget {
  const PerfilPetScreen({super.key});

  @override
  State<PerfilPetScreen> createState() => _PerfilPetScreenState();
}

class _PerfilPetScreenState extends State<PerfilPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final racaController = TextEditingController();
  final idadeController = TextEditingController();
  final observacoesController = TextEditingController();

  PetGenero? _generoSelecionado;
  bool _gostaCriancas = false;
  bool _conviveOutrosAnimais = false;
  bool _disponivelParaAdocao = false;

  @override
  void dispose() {
    nomeController.dispose();
    racaController.dispose();
    idadeController.dispose();
    observacoesController.dispose();
    super.dispose();
  }

  void _limparCampos() {
    nomeController.clear();
    racaController.clear();
    idadeController.clear();
    observacoesController.clear();
    setState(() {
      _generoSelecionado = null;
      _gostaCriancas = false;
      _conviveOutrosAnimais = false;
      _disponivelParaAdocao = false;
    });
  }

  void _salvarDados() {
    if (_formKey.currentState!.validate()) {
      final petData = {
        'nome': nomeController.text,
        'raca': racaController.text,
        'idade': int.tryParse(idadeController.text),
        'observacoes': observacoesController.text,
        'genero': _generoSelecionado?.name,
        'gostaCriancas': _gostaCriancas,
        'conviveOutrosAnimais': _conviveOutrosAnimais,
        'disponivelParaAdocao': _disponivelParaAdocao,
      };
      print('Dados do Pet Salvos: $petData');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dados do pet salvos com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Pet'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Perfil do usuário clicado')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cadastro de Perfil do Pet',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Preencha os dados do seu pet!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Pet',
                      prefixIcon: Icon(Icons.pets),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o nome do pet.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: racaController,
                    decoration: const InputDecoration(
                      labelText: 'Raça',
                      prefixIcon: Icon(Icons.category),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe a raça do pet.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: idadeController,
                    decoration: const InputDecoration(
                      labelText: 'Idade (em anos)',
                      prefixIcon: Icon(Icons.cake),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe a idade do pet.';
                      }
                      final idade = int.tryParse(value);
                      if (idade == null || idade < 0) {
                        return 'Por favor, insira uma idade válida.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: observacoesController,
                    decoration: const InputDecoration(
                      labelText: 'Observações (comportamento, saúde, etc.)',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.notes),
                    ),
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gênero',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          RadioListTile<PetGenero>(
                            title: const Text('Macho'),
                            value: PetGenero.macho,
                            groupValue: _generoSelecionado,
                            onChanged: (PetGenero? value) {
                              setState(() {
                                _generoSelecionado = value;
                              });
                            },
                          ),
                          RadioListTile<PetGenero>(
                            title: const Text('Fêmea'),
                            value: PetGenero.femea,
                            groupValue: _generoSelecionado,
                            onChanged: (PetGenero? value) {
                              setState(() {
                                _generoSelecionado = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preferências de Convivência',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          CheckboxListTile(
                            title: const Text('Gosta de crianças'),
                            value: _gostaCriancas,
                            onChanged: (bool? valor) {
                              setState(() {
                                _gostaCriancas = valor ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            title: const Text('Convive bem com outros animais'),
                            value: _conviveOutrosAnimais,
                            onChanged: (bool? valor) {
                              setState(() {
                                _conviveOutrosAnimais = valor ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status de Adoção',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SwitchListTile(
                            title: const Text('Disponível para adoção'),
                            value: _disponivelParaAdocao,
                            onChanged: (bool valor) {
                              setState(() {
                                _disponivelParaAdocao = valor;
                              });
                            },
                            activeColor: Colors.green.shade200,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 4),
                            child: Text(
                              _disponivelParaAdocao
                                  ? 'Status: Disponível para adoção'
                                  : 'Status: Indisponível para adoção',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _disponivelParaAdocao
                                    ? Colors.green.shade700
                                    : Colors.red.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.save),
                          label: const Text('Salvar'),
                          onPressed: _salvarDados,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.refresh),
                          label: const Text('Limpar'),
                          onPressed: _limparCampos,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

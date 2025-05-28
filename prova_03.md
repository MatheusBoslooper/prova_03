# 🚀 Componentes de Layout no Flutter: Guia Prático

---

## 👥 Equipe de Desenvolvimento

* **Amanda Baggio Azevedo**
* **Matheus Henrique Boslooper**
* **Nickson Jean Ferreira Walachy**

---

## 📱 Protótipo: Perfil do Pet

Este repositório documenta os principais **componentes de layout** utilizados na criação do protótipo de **perfil do pet** em Flutter. Todo o desenvolvimento seguiu rigorosamente os princípios do **Material Design 3**, garantindo uma interface moderna e intuitiva.

---

## 🔧 Componentes de Layout Detalhados

Abaixo, você encontrará uma descrição e exemplos de uso dos componentes essenciais que estruturam a aplicação:

### 1. `Scaffold`

* **Descrição:** A estrutura base de qualquer tela no Flutter. Oferece um layout padrão com barra superior (`AppBar`), corpo principal e outros elementos opcionais, servindo como o contêiner fundamental da interface.
* **Aplicação:** Contêiner principal da interface do protótipo.
* **Exemplo:**
    ```dart
    Scaffold(
      appBar: AppBar(title: Text('Perfil do Pet')),
      body: SingleChildScrollView(
        child: Column(children: [...]),
      ),
    )
    ```

### 2. `AppBar`

* **Descrição:** Uma barra superior que exibe o título da tela, ícones de ação e navegação.
* **Aplicação:** Identidade visual da tela "Perfil do Pet" e acesso rápido a ações como o perfil do usuário.
* **Exemplo:**
    ```dart
    AppBar(
      title: Text('Perfil do Pet'),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        ),
      ],
    )
    ```

### 3. `Column`

* **Descrição:** Um widget que organiza seus filhos em uma sequência vertical.
* **Aplicação:** Empilhar textos, campos de formulário, cards e botões no layout.
* **Exemplo:**
    ```dart
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...],
    )
    ```

### 4. `Row`

* **Descrição:** Um widget que organiza seus filhos em uma sequência horizontal.
* **Aplicação:** Exibir o status de adoção do pet (ícone + texto).
* **Exemplo:**
    ```dart
    Row(
      children: [
        Icon(Icons.check_circle),
        Text('Disponível'),
      ],
    )
    ```

### 5. `Text`

* **Descrição:** Exibe uma string de texto com estilos personalizados.
* **Aplicação:** Usado para títulos, descrições, rótulos e status informativos.
* **Exemplo:**
    ```dart
    Text(
      'Cadastro de Perfil do Pet',
      style: Theme.of(context).textTheme.headlineLarge,
    )
    ```

### 6. `TextFormField`

* **Descrição:** Um campo de entrada de texto que suporta validação e interações de formulário.
* **Aplicação:** Captura de informações como nome, raça, idade e observações do pet.
* **Exemplo:**
    ```dart
    TextFormField(
      controller: nomeController,
      decoration: InputDecoration(
        labelText: 'Nome do Pet',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe o nome do pet';
        }
        return null;
      },
    )
    ```

### 7. `SingleChildScrollView`

* **Descrição:** Permite que seu conteúdo seja rolado se exceder o tamanho da tela, evitando estouro de layout.
* **Aplicação:** Garante compatibilidade com telas menores e quando o teclado virtual está ativo, permitindo que todo o conteúdo seja visualizado.
* **Exemplo:**
    ```dart
    SingleChildScrollView(
      child: Column(children: [...]),
    )
    ```

### 8. `Card`

* **Descrição:** Um painel Material Design usado para agrupar informações relacionadas, geralmente com bordas arredondadas e uma leve sombra.
* **Aplicação:** Agrupar visualmente informações como gênero, status e preferências do pet.
* **Exemplo:**
    ```dart
    Card(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(children: [...]),
      ),
    )
    ```

### 9. `Icon` / `IconButton`

* **Descrição:** `Icon` exibe ícones visuais estáticos; `IconButton` exibe um ícone que pode ser clicado para disparar uma ação.
* **Aplicação:** Usados na `AppBar`, para exibir o status de adoção e para ações rápidas.
* **Exemplos:**
    ```dart
    Icon(Icons.pets)

    IconButton(
      icon: Icon(Icons.account_circle),
      onPressed: () {},
    )
    ```

### 10. `RadioListTile`

* **Descrição:** Um widget que permite a seleção única de uma opção em um grupo de escolhas.
* **Aplicação:** Selecionar o gênero do pet (Macho/Fêmea).
* **Exemplo:**
    ```dart
    RadioListTile<PetGenero>(
      title: Text('Macho'),
      value: PetGenero.macho,
      groupValue: _generoSelecionado,
      onChanged: (PetGenero? value) {
        setState(() {
          _generoSelecionado = value;
        });
      },
    )
    ```

### 11. `CheckboxListTile`

* **Descrição:** Um widget que permite múltiplas seleções de estados booleanos (verdadeiro/falso).
* **Aplicação:** Definir preferências do pet como 'gosta de crianças' e 'convive com outros animais'.
* **Exemplo:**
    ```dart
    CheckboxListTile(
      title: Text('Gosta de crianças'),
      value: _gostaCriancas,
      onChanged: (bool? valor) {
        setState(() {
          _gostaCriancas = valor ?? false;
        });
      },
    )
    ```

### 12. `SwitchListTile`

* **Descrição:** Um widget que permite alternar um estado entre ligado e desligado (on/off).
* **Aplicação:** Definir se o pet está disponível para adoção.
* **Exemplo:**
    ```dart
    SwitchListTile(
      title: Text('Disponível para adoção'),
      value: _disponivelParaAdocao,
      onChanged: (bool valor) {
        setState(() {
          _disponivelParaAdocao = valor;
        });
      },
    )
    ```

### 13. `ElevatedButton`

* **Descrição:** Um botão Material Design com uma elevação visual, usado para ações principais.
* **Aplicação:** Salvar os dados do formulário de perfil do pet.
* **Exemplo:**
    ```dart
    ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.save),
      label: Text('Salvar'),
    )
    ```

### 14. `OutlinedButton`

* **Descrição:** Um botão Material Design com borda, usado para ações secundárias ou menos proeminentes.
* **Aplicação:** Limpar os dados do formulário de perfil do pet.
* **Exemplo:**
    ```dart
    OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.refresh),
      label: Text('Limpar'),
    )
    ```

### 15. `Padding` / `EdgeInsets`

* **Descrição:** `Padding` é um widget que adiciona espaço interno ao seu filho. `EdgeInsets` define a quantidade e direção desse espaçamento.
* **Aplicação:** Organização e alinhamento preciso dos elementos da interface.
* **Exemplo:**
    ```dart
    Padding(
      padding: EdgeInsets.all(16),
      child: Text('Texto'),
    )
    ```

### 16. `SizedBox`

* **Descrição:** Cria uma caixa com um tamanho fixo, útil para adicionar espaçamento vertical ou horizontal específico entre widgets.
* **Aplicação:** Separar elementos com um espaçamento fixo e consistente.
* **Exemplo:**
    ```dart
    SizedBox(height: 16)
    ```

### 17. `ThemeData` & `TextTheme`

* **Descrição:** `ThemeData` define o tema visual para toda a aplicação (cores, formas, etc.). `TextTheme` especifica os estilos de tipografia (tamanhos de fonte, pesos, etc.) para diferentes tipos de texto.
* **Aplicação:** Aplicar um esquema de cores, tipografia e estilo visual consistente em todo o protótipo.
* **Exemplo:**
    ```dart
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.teal,
    )
    ```

---

## 🚀 Conclusão

A seleção e o uso cuidadoso desses componentes resultaram no desenvolvimento de uma interface moderna, acessível e totalmente aderente aos padrões do **Material Design 3, que foi disponibilizado como material de apoio**. O protótipo final garante uma ótima experiência de usuário e foi devidamente testado para execução no ambiente Flutter.

---

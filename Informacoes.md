# Tutorial Técnico - Componentes de Layout

**Equipe**

- Amanda Baggio Azevedo  
- Matheus Henrique Boslooper  
- Nickson Jean Ferreira Walachy  

---

## Perfil do Pet

Este documento descreve os principais componentes de layout utilizados no desenvolvimento do protótipo de cadastro e visualização do perfil de um pet.

---

## Componentes Utilizados

### 1. Scaffold

**Descrição:**  
Estrutura base da interface, fornece um layout visual padrão com barra superior, corpo e outros elementos opcionais.

**Aplicações:**  
Contêiner principal da interface.

**Exemplo:**
```dart
Scaffold(
  appBar: AppBar(title: Text('Perfil do Pet')),
  body: SingleChildScrollView(
    child: Column(children: [...]),
  ),
)

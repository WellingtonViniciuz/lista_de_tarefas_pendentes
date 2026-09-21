# Gestor de Tarefas - Atividade Prática (Sábado Letivo)

Este projeto é um aplicativo mobile simples desenvolvido em Flutter para o gerenciamento de tarefas pendentes. A aplicação foi construída para aplicar os conceitos estudados na disciplina de Desenvolvimento Mobile.

**Nota técnica:** Conforme especificado nas instruções da atividade, este projeto **não utiliza persistência de dados**. Todas as tarefas criadas são mantidas apenas em memória durante a execução do aplicativo. Ao reiniciar a aplicação, a lista voltará ao estado inicial vazio.

## 📋 Funcionalidades Implementadas

### Requisitos Obrigatórios
* **Adicionar Tarefa:** O utilizador pode registar novas tarefas inserindo um "Título" e uma "Descrição".
* **Validação de Campos Vazios:** O sistema impede a criação de tarefas sem conteúdo. Se o utilizador tentar guardar uma tarefa em branco, será exibido um aviso (SnackBar) a orientar o preenchimento.
* **Listar Tarefas:** O ecrã principal exibe todas as tarefas cadastradas de forma organizada.
* **Concluir Tarefa (e desfazer):** Através de uma *Checkbox*, é possível alternar o estado da tarefa entre "Pendente" e "Concluída".
* **Diferenciação Visual:** Tarefas concluídas recebem um tratamento visual específico (o texto fica na cor cinzenta e riscado).
* **Excluir Tarefa:** O utilizador pode remover uma tarefa definitivamente da lista em memória clicando no ícone da lixeira.

### ⭐ Funcionalidades Extras
Para além dos requisitos básicos, foram implementadas as seguintes funcionalidades extra:
1. **Contador de Tarefas:** No topo do ecrã (na AppBar), existe um contador dinâmico que informa em tempo real quantas tarefas ainda se encontram **pendentes**.
2. **Confirmação antes de excluir:** Ao clicar no botão de eliminar uma tarefa, é exibida uma caixa de diálogo (AlertDialog) a pedir a confirmação da ação. Isto evita que o utilizador elimine tarefas por engano.

## 🚀 Como Executar o Projeto

Para correr esta aplicação na sua máquina, certifique-se de que tem o Flutter SDK instalado. Siga os passos abaixo no seu terminal:

**Clone este repositório:**
```bash
git clone https://github.com/WellingtonViniciuz/lista_de_tarefas_pendentes.git
```
**Entre na pasta do projeto:**
```bash
cd lista_de_tarefas_pendentes
```
**Instale as dependências do Flutter:**
```bash
flutter pub get
```
**Inicie a aplicação:**
```bash
flutter run
```

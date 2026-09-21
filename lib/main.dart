import 'package:flutter/material.dart';

void main() {
  runApp(const GestorTarefasApp());
}

class GestorTarefasApp extends StatelessWidget {
  const GestorTarefasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TelaTarefas(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Tarefa {
  String titulo;
  String descricao;
  bool concluida;

  Tarefa({
    required this.titulo,
    required this.descricao,
    this.concluida = false,
  });
}

class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final List<Tarefa> _tarefas = [];
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  void _adicionarTarefa() {
    if (_tituloController.text.trim().isEmpty || _descricaoController.text.trim().isEmpty) {
      // Informa o utilizador caso a tarefa não possa ser registada (campos vazios)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha o título e a descrição da tarefa.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _tarefas.add(Tarefa(
        titulo: _tituloController.text.trim(),
        descricao: _descricaoController.text.trim(),
      ));
    });

    _tituloController.clear();
    _descricaoController.clear();
    Navigator.of(context).pop();
  }

  void _mostrarDialogoAdicionar() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nova Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Título da Tarefa'),
              ),
              TextField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _tituloController.clear();
                _descricaoController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: _adicionarTarefa,
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _alternarStatus(int index) {
    setState(() {
      _tarefas[index].concluida = !_tarefas[index].concluida;
    });
  }

  void _confirmarExclusao(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar eliminação'),
          content: const Text('Tem a certeza que deseja remover esta tarefa da lista?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  _tarefas.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Eliminar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tarefasPendentes = _tarefas.where((t) => !t.concluida).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                'Pendentes: $tarefasPendentes',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: _tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa registada.'))
          : ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                final tarefa = _tarefas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Checkbox(
                      value: tarefa.concluida,
                      onChanged: (bool? valor) {
                        _alternarStatus(index);
                      },
                    ),
                    title: Text(
                      tarefa.titulo,
                      style: TextStyle(
                        decoration: tarefa.concluida
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: tarefa.concluida ? Colors.grey : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      tarefa.descricao,
                      style: TextStyle(
                        decoration: tarefa.concluida
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmarExclusao(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAdicionar,
        child: const Icon(Icons.add),
      ),
    );
  }
}
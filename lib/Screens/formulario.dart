import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();

  // Variables para almacenar los valores
  String? _dropdownValue;
  bool _isChecked = false;
  bool _isSwitched = false;
  String? _radioValue;
  double _sliderValue = 0.0;
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextFormField
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Escribe tu nombre',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo no puede estar vacío';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // DropdownButton
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Selecciona un juego',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                ),
                value: _dropdownValue,
                items: ['Catan', 'Brass', 'Magic']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _dropdownValue = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    activeColor: const Color.fromARGB(
                        255, 255, 136, 0), // Color cuando está seleccionado
                    checkColor: Colors.white,
                  ),
                  const Text('Acepto los términos y condiciones'),
                ],
              ),
              const SizedBox(height: 16.0),

              // Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Activar notificaciones'),
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                    activeColor: const Color.fromARGB(255, 255, 136, 0),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // RadioButton
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Selecciona un horario:'),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Mañana',
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 255, 136, 0),
                      ),
                      const Text('Mañana'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Tarde',
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 255, 136, 0),
                      ),
                      const Text('Tarde'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Slider
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Selecciona una nota para el desarrollador: ${_sliderValue.toStringAsFixed(1)}'),
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: _sliderValue.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                    activeColor: const Color.fromARGB(255, 255, 136, 0),
                    thumbColor: const Color.fromARGB(255, 255, 136, 0),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),

              // Botón de enviar
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Aquí puedes manejar los datos del formulario
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Formulario enviado con éxito')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 136, 0),
                  ),
                  child: const Text(
                    'Enviar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

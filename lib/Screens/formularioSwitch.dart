import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'MenuLateral.dart';

class FormularioSwitch extends StatefulWidget {
  const FormularioSwitch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormularioSwitchState createState() => _FormularioSwitchState();
}

class _FormularioSwitchState extends State<FormularioSwitch> {
  bool isLeft = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool hasChildren = false;
  final List<TextEditingController> childrenAgeControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  DateTime? birthDate;
  String selectedCity = "";
  List<String> hobbies = ["Deporte", "Música", "Lectura", "Viajes", "Cine"];
  Map<String, bool> selectedHobbies = {
    "Deporte": false,
    "Música": false,
    "Lectura": false,
    "Viajes": false,
    "Cine": false,
  };
  String selectedGender = "";

  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$');
  final RegExp phoneRegex = RegExp(r'^[0-9]{9}\$');

  void toggleSwitch() {
    setState(() {
      isLeft = !isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario con Switch"),
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Izquierda"),
                Switch(
                  value: !isLeft,
                  onChanged: (value) => toggleSwitch(),
                  activeColor: const Color.fromARGB(255, 255, 136, 0),
                ),
                const Text("Derecha"),
              ],
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: isLeft ? _buildLeftForm() : _buildRightForm(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Formulario enviado")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 136, 0),
              ),
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftForm() {
    return ListView(
      children: [
        TextFormField(
          controller: fullNameController,
          decoration: const InputDecoration(
            labelText: "Nombre Completo",
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Este campo es obligatorio";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          decoration: const InputDecoration(
            labelText: "Correo Electrónico",
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || !emailRegex.hasMatch(value)) {
              return "Ingrese un correo válido";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(
            labelText: "Teléfono",
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
          ),
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || !phoneRegex.hasMatch(value)) {
              return "Ingrese un teléfono válido de 9 dígitos";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        CheckboxListTile(
          title: const Text("¿Tiene hijos?"),
          value: hasChildren,
          onChanged: (value) {
            setState(() {
              hasChildren = value ?? false;
            });
          },
          activeColor: const Color.fromARGB(255, 255, 136, 0),
          checkColor: Colors.white,
        ),
        if (hasChildren) ...[
          Column(
            children: [
              _buildChildAgeField(0, "Edad del primer hijo"),
              const SizedBox(height: 10),
              _buildChildAgeField(1, "Edad del segundo hijo", isOptional: true),
              const SizedBox(height: 10),
              _buildChildAgeField(2, "Edad del tercer hijo", isOptional: true),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildChildAgeField(int index, String label,
      {bool isOptional = false}) {
    return TextFormField(
      controller: childrenAgeControllers[index],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (!isOptional && (value == null || value.isEmpty)) {
          return "Ingrese la edad";
        }
        if (value != null && value.isNotEmpty) {
          final age = int.tryParse(value);
          if (age == null || age < 0) {
            return "Ingrese una edad válida";
          }
        }
        return null;
      },
    );
  }

  Widget _buildRightForm() {
    return ListView(
      children: [
        const SizedBox(height: 10),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: birthDate == null
                ? "Fecha de Nacimiento"
                : DateFormat("dd/MM/yyyy").format(birthDate!),
            suffixIcon: const Icon(Icons.calendar_today),
            labelStyle:
                const TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
            border: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
          ),
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (selectedDate != null) {
              setState(() {
                birthDate = selectedDate;
              });
            }
          },
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: selectedCity.isEmpty ? null : selectedCity,
          decoration: const InputDecoration(
            labelText: "Ciudad en Andalucía",
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 136, 0), width: 2),
            ),
          ),
          items: [
            "Sevilla",
            "Granada",
            "Córdoba",
            "Málaga",
            "Almería",
            "Huelva",
            "Jaén",
            "Cádiz"
          ]
              .map((city) => DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCity = value ?? "";
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Seleccione una ciudad";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Aficiones"),
            ...selectedHobbies.keys.map((hobby) {
              return CheckboxListTile(
                title: Text(hobby),
                value: selectedHobbies[hobby],
                onChanged: (value) {
                  setState(() {
                    selectedHobbies[hobby] = value ?? false;
                  });
                },
                activeColor: const Color.fromARGB(255, 255, 136, 0),
                checkColor: Colors.white,
              );
            }),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Sexo"),
            RadioListTile(
              title: const Text("Hombre"),
              value: "Hombre",
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
              },
              activeColor: const Color.fromARGB(255, 255, 136, 0),
            ),
            RadioListTile(
              title: const Text("Mujer"),
              value: "Mujer",
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
              },
              activeColor: const Color.fromARGB(255, 255, 136, 0),
            ),
            RadioListTile(
              title: const Text("Prefiero no contestar"),
              value: "Prefiero no contestar",
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
              },
              activeColor: const Color.fromARGB(255, 255, 136, 0),
            ),
          ],
        ),
      ],
    );
  }
}

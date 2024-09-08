import 'package:flutter/material.dart';

class RegisterButtomSheet extends StatefulWidget {
  const RegisterButtomSheet({super.key});

  @override
  State<RegisterButtomSheet> createState() => _RegisterButtomSheetState();
}

class _RegisterButtomSheetState extends State<RegisterButtomSheet> {
  final _formKey = GlobalKey<FormState>();
  double _age = 18;
  String _selectedGender = "Male";
  bool _receiveNewsletter = false;
  bool? _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  hintText: "Username", border: OutlineInputBorder()),
            ),
            const SizedBox(
              width: 10,
            ),
            TextFormField(
              controller: TextEditingController(),
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Passward", border: OutlineInputBorder()),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Text("Age:${_age.round()}"),
                Expanded(
                    child: Slider(
                  min: 18,
                  max: 70,
                  divisions: 82,
                  value: _age,
                  onChanged: (value) {
                    setState(() {
                      _age = value;
                    });
                  },
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: RadioListTile(
                  title: const Text("Male"),
                  value: "Male",
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                )),
                Expanded(
                    child: RadioListTile(
                  title: const Text("Female"),
                  value: "Female",
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ))
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            SwitchListTile(
                title: const Text(" Receive Newsletter "),
                value: _receiveNewsletter,
                onChanged: (val) {
                  setState(() {
                    _receiveNewsletter = val;
                  });
                }),
            const SizedBox(
              width: 10,
            ),
            CheckboxListTile(
                title: const Text("I accept terms"),
                value: _isTermsAccepted,
                onChanged: (val) {
                  setState(() {
                    _isTermsAccepted = val;
                  });
                }),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: !(_isTermsAccepted == false) ||
                            (_isTermsAccepted == null)
                        ? () {
                            Navigator.of(context).pop();
                          }
                        : null,
                    child: const Text("Register")),
                ElevatedButton(onPressed: () {}, child: const Text("Close")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

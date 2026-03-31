import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var options = [
      "Option 1",
      "Option 2",
      "Option 3",
      "Option 1",
      "Option 2",
      "Option 3",
      "Option 1",
      "Option 2",
      "Option 3",
    ];

    final formKey = GlobalKey<FormBuilderState>();
    final emailFieldKey = GlobalKey<FormBuilderFieldState>();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Text("data"),
          SizedBox(height: 100,),
          Expanded(
            child: FormBuilder(
              key: formKey,
              child: ListView(
                children: [
                  FormBuilderTextField(
                    key: emailFieldKey,
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.password(),
                    ]),
                  ),
            
                  Dropdwon(formKey: formKey),
                  FormBuilderField(
                    name: "name",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    builder: (FormFieldState<dynamic> field) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Select option",
                          contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
                          border: InputBorder.none,
                          errorText: field.errorText,
                        ),
                        child: SizedBox(
                          height: 50,
                          child: CupertinoPicker(
                            itemExtent: 30,
                            children: options.map((c) => Text(c)).toList(),
                            onSelectedItemChanged: (index) {
                              field.didChange(options[index]);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  ClearFormBuilderTextField(fromkey: formKey),
                  MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () async {
                      formKey.currentState?.patchValue({
                        'password': formKey.currentState?.fields["password"]!.value
                            .toString(),
                      });
                      // formKey.currentState!.fields['email']!..didChange("Colors.black");
                      // Validate and save the form values
                      formKey.currentState?.saveAndValidate();
                      debugPrint(formKey.currentState?.value.toString());
            
                      // // On another side, can access all field values without saving form with instantValues
                      // formKey.currentState?.validate();
                      // debugPrint(formKey.currentState?.instantValue.toString());
                      // if (await emailFieldKey.currentState?.value != null ||
                      //     await emailFieldKey.currentState?.value != "") {
                      //   // Either invalidate using Form Key
                      //   formKey.currentState?.fields['email']?.invalidate(
                      //     'Email already taken',
                      //   );
                      //   // OR invalidate using Field Key
                      //   emailFieldKey.currentState?.invalidate(
                      //     'Email already ',
                      //   );
                      // }
                    },
                    child: const Text('Login'),
                  ),
                  FormBuilderCheckboxGroup(
                    decoration: InputDecoration(labelText: 'My best language'),
                    name: 'my_language',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "required";
                      }
                      return null;
                    },
            
                    // validator: (value) {
                    //   FormBuilderValidators.required();
                    //   return value?[0];
                    // },
                    // // validator: FormBuilderValidators.required(),
                    options:
                        ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C', 'Other']
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                  ),
                  FormBuilderTextField(
                    name: 'specify',
                    decoration: InputDecoration(
                      labelText: 'If Other, please specify',
                    ),
                    validator: (val) {
                      final List<String>? list =
                          formKey.currentState!.fields['my_language']?.value;
                      if (list != null) {
                        if ((list.length == 1 && list[0] == "Other") &&
                            (val == null || val.isEmpty)) {
                          return 'Kindly specify your language';
                        }
                      } else {
                        return "required";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class ClearFormBuilderTextField extends StatefulWidget {
  final GlobalKey<FormBuilderState> fromkey;
  const ClearFormBuilderTextField({super.key, required this.fromkey});

  @override
  State<ClearFormBuilderTextField> createState() =>
      _ClearFormBuilderTextFieldState();
}

class _ClearFormBuilderTextFieldState extends State<ClearFormBuilderTextField> {
  final ValueNotifier<String?> text = ValueNotifier<String?>(null);
  final textFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: 'age',
      key: textFieldKey,
      onChanged: (value) {
        text.value = value;
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.min(18),
        FormBuilderValidators.max(65),
      ]),
      decoration: InputDecoration(
        labelText: 'Age',
        suffixIcon: ValueListenableBuilder<String?>(
          valueListenable: text,
          child: IconButton(
            onPressed: () => textFieldKey.currentState?.didChange(null),
            tooltip: 'Clear',
            icon: const Icon(Icons.clear),
          ),
          builder: (context, value, child) =>
              (value?.isEmpty ?? true) ? const SizedBox() : child!,
        ),
      ),
    );
  }
}

class Dropdwon extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const Dropdwon({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    List<String> genderOptions = ['', 'Male', 'Female', 'Other'];

    return FormBuilderDropdown(
      validator: (value) {
        if (value == "") return "required";
        return null;
      },
      name: "gender",
      decoration: InputDecoration(
        labelText: 'Gender',
        suffix: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            formKey.currentState!.fields['gender']?.reset();
          },
        ),
        hintText: 'Select Gender',
      ),
      // decoration: InputDecoration(),
      initialValue: genderOptions[0],
      items: genderOptions
          .map((row) => DropdownMenuItem(value: row, child: Text(row)))
          .toList(),
    );
  }
}

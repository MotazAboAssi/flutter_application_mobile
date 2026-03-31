import 'package:delivery_of_orders/constants/data.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DialogEditLocation extends StatefulWidget {
  const DialogEditLocation({super.key});

  @override
  State<DialogEditLocation> createState() => _DialogEditLocationState();
}

class _DialogEditLocationState extends State<DialogEditLocation> {
  late GlobalKey<FormBuilderState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormBuilderState>();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: FormBuilder(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "change your loction :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              FormBuilderDropdown<String>(
                name: 'gender',
                dropdownColor: backgroundColor,
                menuMaxHeight: 100,
                borderRadius: BorderRadius.circular(12),
                alignment: AlignmentGeometry.centerRight,

                initialValue: 'Damascus',
                decoration: InputDecoration(
                  hintText: 'Select Gender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: cities
                    .map(
                      (gender) => DropdownMenuItem(
                        alignment: AlignmentDirectional.center,
                        value: gender,
                        child: Text(gender),
                      ),
                    )
                    .toList(),
              ),

              Align(
                alignment: AlignmentGeometry.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: primaryTextColor),
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

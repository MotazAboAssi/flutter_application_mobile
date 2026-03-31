import 'package:delivery_of_orders/widgets/edit_info/dialog_edit_location.dart';
import 'package:delivery_of_orders/widgets/edit_info/dialog_edit_name.dart';
import 'package:delivery_of_orders/widgets/edit_info/dialog_edit_phone_number.dart';
import 'package:delivery_of_orders/widgets/edit_info/dialog_edit_username.dart';
import 'package:delivery_of_orders/widgets/edit_info/edit_image_profile.dart';
import 'package:delivery_of_orders/widgets/edit_info/row_info.dart';
import 'package:flutter/material.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxRadius = 15;
    return Scaffold(
      appBar: AppBar(title: Text("Info")),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: EditImageProfile(maxRadius: maxRadius),
              ),
              RawInfo(
                icon: Icons.account_circle_outlined,
                titleInfo: "Name",
                info: "Motaz Abo Assi",
                dialog: DialogEditName(),
              ),
              RawInfo(
                icon: Icons.phone_outlined,
                titleInfo: "Phone number",
                info: "+963998548589",
                dialog: DialogEditPhoneNumber(),
              ),
              RawInfo(
                icon: Icons.alternate_email,
                titleInfo: "Username",
                info: "@Motaz_Abo_Assi",
                dialog: DialogEditUsername(),
              ),
              RawInfo(
                icon: Icons.location_on_outlined,
                titleInfo: "Location",
                info: "Damascuse",
                dialog: DialogEditLocation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

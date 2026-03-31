
  import 'package:flutter/material.dart';
import 'package:store_app/actions/back_to.dart';
import 'package:store_app/cubit/fetch_all_product/fetch_all_products_states.dart';

Dialog errorDialog(FailedFetch state, BuildContext context) {
     Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.red),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              state.errorMessage,
              style: TextStyle(
                color: Colors.red,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                backTo(context);
              },
              child: Text(
                "Got it !",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
    return errorDialog;
  }

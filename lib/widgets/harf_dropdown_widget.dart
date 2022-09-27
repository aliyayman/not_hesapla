import 'package:flutter/material.dart';
import 'package:not_hesapla/data/data_helper.dart';

import '../constants/app_constants.dart';

class HarfDropdownWidget extends StatefulWidget {
   final Function onHarfSecildi;
  const HarfDropdownWidget({super.key, required this.onHarfSecildi});
 

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
   double choseValue=4;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius
      ),
      child: DropdownButton<double>( 
        value: choseValue,
        elevation: 16,
        iconEnabledColor: Constants.anaRenk.shade200,
        onChanged: (value) {
          setState(() {
            choseValue=value!;
            widget.onHarfSecildi(choseValue);
          }); 
        },
         items: DataHelper.tumDerslerinHarfleri(),
         underline: Container(),
      ),
    );

  }
}
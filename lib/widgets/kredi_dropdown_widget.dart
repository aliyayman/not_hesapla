import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../data/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({super.key, required this.onKrediSecildi});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double chosenCredit=1;
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
        value: chosenCredit,
        elevation: 16,
        iconEnabledColor: Constants.anaRenk.shade200,
        onChanged: (value) {
          setState(() {
            chosenCredit=value!;
            widget.onKrediSecildi(value);
           
          }); 
        },
         items: DataHelper.tumDerslerinKredileri(),
         underline: Container(),
      ),
    );
  }
}
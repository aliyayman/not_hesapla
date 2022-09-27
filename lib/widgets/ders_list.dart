import 'package:flutter/material.dart';
import 'package:not_hesapla/constants/app_constants.dart';
import 'package:not_hesapla/data/data_helper.dart';

class DersList extends StatelessWidget {
  final Function onDismissed;
  const DersList({super.key, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    List tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0 ? ListView.builder(itemCount:tumDersler.length,itemBuilder: ((context, index) {
      return Dismissible(
        key:UniqueKey() ,
        
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          onDismissed(index);
    
          
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(child: ListTile(
            title: Text(tumDersler[index].name),
            leading: CircleAvatar(backgroundColor: Constants.anaRenk,
            child: Text((tumDersler[index].harfDegeri*tumDersler[index].krediDegeri).toStringAsFixed(0) ,),),
            subtitle: Text('${tumDersler[index].krediDegeri} kredi,Not değeri ${tumDersler[index].harfDegeri}'),
          ),),
        ),
      );
    }),) : Container(
      child: Center(child: Text("Lütfen Ders Ekleyin",style:Constants.baslikStyle,)));
  }
}
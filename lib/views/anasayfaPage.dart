import 'package:flutter/material.dart';
import 'package:not_hesapla/constants/app_constants.dart';
import 'package:not_hesapla/data/data_helper.dart';
import 'package:not_hesapla/model/ders.dart';
import 'package:not_hesapla/widgets/ders_list.dart';
import 'package:not_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:not_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:not_hesapla/widgets/ortalama_goster.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var formKey = GlobalKey<FormState>();
  double chosenHarf=4;
   double chosenCredit=1;
   String girilenDerAdi = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      resizeToAvoidBottomInset: false,
      appBar: AppBar( 
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Center(child: Text(Constants.baslikText,style: Constants.baslikStyle,),
      ),
      ),
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [ 
          Row(
            children: [
              Expanded(flex: 2,child: _buildForm()),
              Expanded(flex: 1,child: OrtalamaGoster(ortalama:DataHelper.ortalamaHesapla() , dersSayisi: DataHelper.tumEklenenDersler.length)),

            ],
          ),
           Expanded(child:DersList(onDismissed: (index){
            DataHelper.tumEklenenDersler.removeAt(index);
            setState(() {
              
            });
    

           },)),
          
      
        ],
      )
    );
  }
  
 Widget _buildForm() {
  return Form(
    key: formKey,
    child: Column( 
    
      children: [ 
        Padding(padding: Constants.yatayPadding8,child: _buildTextFormField(),),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Padding(padding: Constants.yatayPadding8,child:  HarfDropdownWidget(onHarfSecildi: (harf){
              chosenHarf=harf;

            },))),
            Expanded(child: Padding(padding: Constants.yatayPadding8,child:  KrediDropdownWidget(onKrediSecildi: (kredi){
              chosenCredit=kredi;
            },))),
            IconButton(onPressed: _dersEkleveOrtalamaHesapla,


         icon: Icon(Icons.arrow_forward_ios_sharp),color: Constants.anaRenk,iconSize: 30,),

          ],
        ),
        SizedBox(height: 5,)
      ],
    ),

  );
 }
 
  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          girilenDerAdi=newValue!;
          print(girilenDerAdi);
        });
        
      },
      validator: (s) {
        if(s!.length<=0){
          return 'Ders adını giriniz';
        }else 
        return null;
        
      },
      decoration: InputDecoration( 
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Constants.anaRenk.shade100.withOpacity(0.3)
      ),

    );
  }
  



  
  _dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers =Ders(name: girilenDerAdi, harfDegeri: chosenHarf, krediDegeri: chosenCredit);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.tumEklenenDersler);
      print(DataHelper.ortalamaHesapla());

      setState(() {
        
      });

    }

  }
}
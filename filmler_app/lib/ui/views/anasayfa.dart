import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/ui/cubit/anasayfa_cubit.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().filmleriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"),),
      body: BlocBuilder<AnasayfaCubit,List<Filmler>>(
        builder: (context, filmlerListesi) {
          if(filmlerListesi.isNotEmpty){
            return GridView.builder(//kutucuklu görüntü için kullanılır //diğerinde biz listwiew kullanmıştık
              itemCount: filmlerListesi.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(//bu komut bir satırda kaç tane görünmesini istiyorsan bunu belirtiyorsun
                crossAxisCount: 2,childAspectRatio: 1 / 1.8//yatay ve dikey ununluğu belirtiyor
                ),
                itemBuilder: (context, indeks) {
                  var film = filmlerListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));
                    },
                    child: Card(
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("resimler/${film.resim}"),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${film.fiyat} ₺",style: const TextStyle(fontSize: 24),),
                              ElevatedButton(onPressed: (){
                                print("${film.ad} Sepete Eklendi");
                              }, child: const Text("Sepet"))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
            );
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
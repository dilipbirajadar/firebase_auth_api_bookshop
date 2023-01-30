import 'package:book_recycler/model/most_popular_model.dart';
import 'package:flutter/material.dart';

import '../model/most_popular_model_data.dart';
import 'favorite.dart';

class CardWidget extends StatefulWidget {
  int index;
  CardWidget(this.index, {super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState(index);
}

class _CardWidgetState extends State<CardWidget> {
  int index;
  late List<MostPopular> mostPopularModel =  mostPopular;

  bool tap = true;

  _CardWidgetState(this.index);

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          height: deviceHeight(context) * 0.25,
          width: deviceWidth(context) * 0.30,
          child: Column(
            children: [
              Container(
                height: deviceHeight(context) * 0.08,
                width: deviceWidth(context) * 0.30,
                child: Stack(
                  children: [
                    Container(
                      width: deviceWidth(context),
                      child:
                      //Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrViWxt3fk2jYjO4zF2xUsFqIA1r4LfA53Qg&usqp=CAU'),
                      Image(image: NetworkImage(mostPopularModel[index].url),
                      fit: BoxFit.fill,),
                    ),
                   FavoriteWidget(onTap:(bool) {
                       return tap =!tap;
                     }),

                  ],
                ),

              ),
              Container(
                  height: deviceHeight(context) * 0.04,
                  width: deviceWidth(context) * 0.3,
                  child: Center(
                      child:Text(
                        textAlign: TextAlign.justify,
                        mostPopularModel[index].name,
                        style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                      ))
                  ),
              Container(
                height: deviceHeight(context) * 0.09,
                child: SingleChildScrollView(
                  child: Text(
                      //'While in Paris on business, Harvard symbologist Robert Langdon receives an urgent late-night phone call: the elderly curator of the Louvre has been murdered inside the museum. Near the body, police have found a baffling cipher. Solving the enigmatic riddle, Langdon is stunned to discover it leads to a trail of clues hidden in the works of da Vinci…clues visible for all to see…and yet ingeniously disguised by the painter Langdon joins forces with a gifted French cryptologist, Sophie Neveu, and learns the late curator was involved in the Priory of Sion—an actual secret society whose members included Sir Isaac Newton, Botticelli, Victor Hugo, and da Vinci, among others. The Louvre curator has sacrificed his life to protect the Priory’s most sacred trust: the location of a vastly important religious relic, hidden for centuries.In a breathless race through Paris, London, and beyond, Langdon and Neveu match wits with a faceless powerbroker who appears to work for Opus Dei—a clandestine, Vatican-sanctioned Catholic sect believed to have long plotted to seize the Priory’s secret. Unless Langdon and Neveu can decipher the labyrinthine puzzle in time, the Priory’s secret—and a stunning historical truth—will be lost forever.In an exhilarating blend of relentless adventure, scholarly intrigue, and cutting wit, symbologist Robert Langdon (first introduced in Dan Brown’s bestselling Angels & Demons) is the most original character to appear in years. The Da Vinci Code heralds the arrival of a new breed of lightning-paced, intelligent thriller…surprising at every twist, absorbing at every turn, and in the end, utterly unpredictable…right up to its astonishing conclusion.',
                      mostPopularModel[index].description,
                      style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                ),
              ),
              Container(
                height: deviceHeight(context) * 0.04,
                child: Row(
                  children: [
                    Container(
                        width: deviceWidth(context) * 0.15,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("₹ ${mostPopularModel[index].price}",
                            style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w600
                            ),),
                        )
                    ),
                    Container(
                      width: deviceWidth(context) * 0.15,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        onPressed: () { Navigator.pushNamed(context, '/cart'); },
                        child: const Text('ADD',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300
                          ),),
                      ),

                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

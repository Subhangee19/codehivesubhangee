import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: ListView(
          children: [
            QuestionPaperCard(imageLocation: "question_paper/paper1.jpg", title: "Question Paper1"),
            QuestionPaperCard(imageLocation: "question_paper/paper2.jpg", title: "Question Paper2",),
            QuestionPaperCard(imageLocation: "question_paper/paper3.jpg", title: "Question Paper2",)

          ],
        ),
      ),
    );
  }
}

class QuestionPaperCard extends StatelessWidget {
  late String imageLocation;
  late String title;

  QuestionPaperCard({Key? key,required  this.imageLocation,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      color: Colors.blue,
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width - 50,
      child: Center(
        child: Stack(
          children: [
            Image.asset(imageLocation, fit: BoxFit.fill, height: double.infinity, width: double.infinity,),
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(1),
                        Colors.white.withOpacity(0),
                      ],
                    )
                ),
            ),
            Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width/ 2 - 125,
                child: Text( title, style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ), ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_app/utility/card_details.dart';
import 'package:trivia_app/screens/difficulty_selection_screen.dart';

class ListCard extends StatelessWidget {
  const ListCard(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DifficultyScreen(
                      selectedIndex: index,
                    )),
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 21),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              height: 87,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: cardDetailList[index].gradients,
                ),
                borderRadius: BorderRadius.circular(21),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 3),
                    blurRadius: 7,
                    spreadRadius: 5,
                    color: cardDetailList[index].shadowColor,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardDetailList[index].title,
                    style: GoogleFonts.ubuntu(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Hero(
              tag: cardDetailList[index].iconTag,
              child: Image.asset(
                cardDetailList[index].iconAssetName,
                scale: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

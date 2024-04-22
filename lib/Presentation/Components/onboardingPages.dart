import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/Presentation/Components/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> onboardingPages = [
  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 30), // Adjust this value to move the title down
        Text(
          "Velkommen til",
          style: TextStyle(
            fontSize: 23,
            //fontWeight: FontWeight.bold,
            color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Compassion App",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 10), // Adjust this value to move the body down
        Text(
          "Kom med på rejsen mod en dybere forståelse af compassion og indre ro. Compassion App giver dig "
              "adgang til en række værktøjer, der kan hjælpe dig med at dyrke compassion i din daglige praksis, både på jobbet og hjemme.",
          style: TextStyle(
            fontSize: 18,
            color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    image: const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100.0), // Adjust this value to move the image down
        child: SizedBox(
          width: 200, // Specify the desired width
          height: 200, // Specify the desired height
          child: Image(
              image: AssetImage('assets/logos/compassionLogo.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ),

  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 30), // Adjust this value to move the title down
        Text(
          "Meditation og fordybelse",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 10), // Adjust this value to move the body down
        Text(
          "Udforsk en samling af guidede meditationer og øvelser designet til, "
              "at styrke din evne til at forbinde med dig selv og andre, på en dybere måde.",
          style: TextStyle(
              fontSize: 18,
              color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    image: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100.0), // Adjust this value to move the image down
        child: SizedBox(
          width: 200, // Specify the desired width
          height: 200, // Specify the desired height
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Constants.kWhiteColor, // Add your desired color here
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              'assets/icons/solar_meditation-round-outline.svg',
              width: 60,
              height: 60,
            ),
          ),
        ),
      ),
    ),
  ),


  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 30), // Adjust this value to move the title down
        Text(
          "Dagbogsnotater",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 10), // Adjust this value to move the body down
        Text(
          "Tag dig tid til refleksion og selvudvikling med vores digitale dagbogsfunktion. "
              "Skriv dine tanker, følelser og oplevelser ned, og opdag fordelene ved at udtrykke taknemmelighed og self-compassion. "
              "Sæt dig også personlige mål for dagen vha. intentionsdagbogen",
          style: TextStyle(
              fontSize: 18,
              color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    image: const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100.0), // Adjust this value to move the image down
        child: SizedBox(
          width: 200, // Specify the desired width
          height: 200, // Specify the desired height
          child: Icon(
              CupertinoIcons.calendar_today,
            size: 200,
            color: Constants.kWhiteColor,
          )
        ),
      ),
    ),
  ),


  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 30), // Adjust this value to move the title down
        Text(
          "Bliv klogere på compassion",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 10), // Adjust this value to move the body down
        Text(
          "Lær mere om compassion og dets betydning i vores liv. Udforsk forskellige "
              "ressourcer, der kan hjælpe dig med at forstå og praktisere compassion og empati i din dagligdag.",
          style: TextStyle(
              fontSize: 18,
              color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    image: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100.0), // Adjust this value to move the image down
        child: SizedBox(
          width: 200, // Specify the desired width
          height: 200, // Specify the desired height
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Constants.kWhiteColor, // Add your desired color here
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              'assets/icons/icon-park_oval-love.svg',
              width: 60,
              height: 60,
            ),
          ),
        ),
      ),
    ),
  ),
];
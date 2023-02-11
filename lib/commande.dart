import 'package:flutter/material.dart';
import 'package:shopink/main.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCommande extends StatelessWidget {
  const MyCommande({Key? key}) : super(key: key);

  @override
  build(BuildContext context) =>
      const Scaffold(
      appBar: MyCommandeAppBar(),
      body: MyCommand(),
      bottomNavigationBar: MyBottomNav(),
      backgroundColor: Colors.white,
    );
  }

  class MyCommandeAppBar extends StatelessWidget implements PreferredSizeWidget {
    const MyCommandeAppBar({Key? key}) : super(key: key);

    @override
  Size get preferredSize => const Size.fromHeight(50);

    @override
    build(BuildContext context) =>
        AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Details Products',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            actions: const [
              IconButton(
                icon: Icon(Icons.more_horiz_rounded),
                onPressed: null,
              )
            ]);
  }

  class MyCommand extends StatelessWidget {
    const MyCommand({Key? key}) : super(key: key);

    @override
    build(BuildContext context) =>
        Column(
          children: [
            Column(
              children: [
                ItemCommande(
                  imageSneaker:'assets/sneakers/jordan1highzoom.jpg',magasin: 'Nike',price: '100.99',name: 'Jordan 5 Retro',),
                Divider(color: Colors.black,),
              ],
            ),
            ItemCommande(
              imageSneaker:'assets/sneakers/jordan1highzoom.jpg',magasin: 'Nike',price: '100.99',name: 'Jordan 5 Retro',),
            const Divider(color: Colors.black,),
            ItemCommande(
              imageSneaker:'assets/sneakers/jordan1highzoom.jpg',magasin: 'Nike',price: '100.99',name: 'Jordan 5 Retro',),
            const Divider(color: Colors.black,),
            LineInfoCommande(rightText: 'Subtotal :',leftText: '€800.00',),
            LineInfoCommande(rightText: 'Delivery Fee :',leftText: '€10.00',),
            LineInfoCommande(rightText: 'Discount : :',leftText: '10%',),
            const Divider(color: Colors.black,),
            LineInfoCommande(rightText: 'Total :' ,leftText: '€780.00',),
            TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow[800]),
                ),
                onPressed: null,
                child: const Text(
                  '              Add to cart            ',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        );
    }

class LineInfoCommande extends StatelessWidget {
  final String rightText;
  final String leftText;

  LineInfoCommande({
    Key? key,required this.rightText,required this.leftText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(rightText),
          Spacer(),
          Text(leftText)
        ],
      ),
    );
  }
}

class ItemCommande extends StatelessWidget {
  final String imageSneaker;
  final String name;
  final String price;
  final String magasin;

  ItemCommande({
    Key? key,required this.imageSneaker,required this.name,required this.magasin,required this.price
  }) : super(key: key);

  @override
  build(_) =>
      Slidable(
      key: const ValueKey(0),
      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        children: const [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1),
                              BlendMode.darken),
                          image: AssetImage(imageSneaker)
                      )
                  )),
            ),Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(name ,style: TextStyle(
                  fontSize: 20,
                ), ),
                Text(magasin,style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16
                )),
                Text(price,style: TextStyle()),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Icon(Icons.remove_circle_outline_outlined),
                Text('1'),
                Icon(Icons.add_circle)
              ],
            ),],
        ),
      ),
    );
  }





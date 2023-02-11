import 'package:flutter/material.dart';

class MyDetailProducts extends StatelessWidget {
  const MyDetailProducts({Key? key}) : super(key: key);

  @override
  build(BuildContext context) =>
    const Scaffold(
      appBar: MyDetailAppBar(),
      body: MyDetailPageProducts(),
      backgroundColor: Colors.white,
    );
  }


class MyDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyDetailAppBar({Key? key}) : super(key: key);

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

class MyDetailPageProducts extends StatelessWidget {
  const MyDetailPageProducts({Key? key}) : super(key: key);

  @override
  build(_) => Column(
      children: [
        const SizedBox(
          height: 300,
          width: 500,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
            image: AssetImage('assets/sneakers/jordan1highzoom.jpg'),
            fit: BoxFit.fitWidth,
          ))),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/sneakers/jordan1highzoom.jpg'),
                              fit: BoxFit.fitWidth,
                            ),
                            border:
                                Border.all(color: Colors.yellow, width: 3.0))),
                  ),
                  CirculVIewSneaker(sneaker:'assets/sneakers/jordan1highzoom.jpg'),
                  CirculVIewSneaker(sneaker:'assets/sneakers/jordan1highzoom.jpg'),
                  CirculVIewSneaker(sneaker:'assets/sneakers/jordan1highzoom.jpg'),
                  CirculVIewSneaker(sneaker:'assets/sneakers/jordan1highzoom.jpg'),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nike Blazer Mid 77',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    children: [
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text('Women\'s Shoes',
                                style: TextStyle(color: Colors.grey)),
                          ),
                          Text('€100.99',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Taille(),
                  const Description(),
                  const Divider(
                    color: Colors.black,
                  ),
                  const Favorite(),
                  const AddCart(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

class CirculVIewSneaker extends StatelessWidget {
  final String sneaker;
  const CirculVIewSneaker({
    Key? key,required this.sneaker
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage(
                    sneaker),
                fit: BoxFit.fitWidth,
              ))),
    );
  }
}


class MyDetailPage extends StatelessWidget {
  const MyDetailPage({Key? key}) : super(key: key);

  @override
  build(_) => const Scaffold();
}

class Taille extends StatelessWidget {
  Taille({Key? key}) : super(key: key);

  final List taille = [
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '43',
    '44',
    '45',
    '47'
  ];

  @override
  build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: taille.length,
              itemBuilder: (BuildContext context, int index) {
                return CircleAvatar(
                  radius: 21,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        taille[index],
                        style: const TextStyle(fontSize: 20,color: Colors.black
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 20,
                );
              },
            ),
          )
        ],
      ),
    );
  }


class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Styled for the 70.Loved in the 80.Classic in the'),
          Text('90s.Ready for the futur.The Nike Blazer Mid 77 Next...'),
          Text('Read more ...',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }


class AddCart extends StatelessWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  build(_) => Row(
      children: [
        Container(
          color: Colors.grey,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Icon(Icons.remove_circle_outline_outlined),
              Text('1'),
              Icon(Icons.add_circle)
            ],
          ),
        ),
        const Spacer(),
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


class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Stack(
            children: const [
              FractionalTranslation(
                translation: Offset(2.25, 0.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/users/user4.webp'),
                  ),
                ),
              ),
              FractionalTranslation(
                translation: Offset(1.50, 0.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/users/user3.webp'),
                  ),
                ),
              ),
              FractionalTranslation(
                translation: Offset(0.75, 0.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/users/user2.webp'),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/users/user1.webp'),
                ),
              ),
            ],
          ),
          FractionalTranslation(
              translation: Offset(0.50, 0.0),
              child: const Text(' 10.000+ people favorite this'))
        ],
      ),
    );
  }
}

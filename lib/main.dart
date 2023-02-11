import 'package:flutter/material.dart';
import 'package:shopink/commande.dart';
import 'package:shopink/detail-products.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  build(BuildContext context) => MaterialApp(
      title: 'Shopink project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  build(BuildContext context) => SafeArea(
          child: Scaffold(
        key: _key,
        appBar: const MyAppBar(),
        body: const MyHome(),
        bottomNavigationBar: const MyBottomNav(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                accountName: Text('Shopink',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                currentAccountPicture: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: AssetImage('assets/logo/logo.png')))),
                accountEmail: Text(
                  'Chez Shopink, on est toujours à la pointe!',
                  textAlign: TextAlign.end,
                ),
              ),
              ListTile(
                title: const Text('Détail Jordan'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyDetailProducts()));
                },
              ),
              ListTile(
                title: const Text('Commandes'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCommande()));
                },
              ),
              ListTile(
                title: const Text('Your like'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ));
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const ImagePromo(),
              const SizedBox(
                height: 20,
              ),
              LinePresentationItem(title:'New Arrival'),
              NewSneakers(),
              LinePresentationItem(title:'Best Seller'),
              MarqueSneakers(),
              const BestSeller(),
            ],
          )),
        ),
      );
}

class LinePresentationItem extends StatelessWidget {
  final String title;
  LinePresentationItem({
    Key? key, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Spacer(),
        Text(
          'See all',
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class ImagePromo extends StatelessWidget {
  const ImagePromo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/background_sneacker.webp',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.srgbToLinearGamma(),
          )),
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Get your',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                    Text('sepcial sale',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                    Text('up to 50%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.yellow,
                        )),
                  ],
                ),
                const Spacer(),
                const ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(
                              Colors.yellow)),
                  child: Text('show now',
                      style: TextStyle(color: Colors.black)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  build(BuildContext context) => AppBar(
        centerTitle: true,
        title: const Text(
          'Shopink',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.notifications_rounded),
            onPressed: null,
          )
        ],
        backgroundColor: Colors.white,
      );
}

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({Key? key}) : super(key: key);

  @override
  build(BuildContext context) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person),
          ),
        ],
      );
}

class NewSneakers extends StatefulWidget {
  NewSneakers({Key? key}) : super(key: key);

  @override
  State<NewSneakers> createState() => _NewSneakersState();
}

class _NewSneakersState extends State<NewSneakers> {
  final List sneakers = [
    {
      'titre': 'Dunk Low SE',
      'magasin': 'nike',
      'price': '250€',
      'image': 'assets/sneakers/dunkLowSE.jpg',
      'like' : true,
    },
    {
      'titre': 'Jordan 1 high Zoom',
      'magasin': 'Nike',
      'price': '399€',
      'image': 'assets/sneakers/jordan1highzoom.jpg',
      'like' : true,
    },
    {
      'titre': 'Jordan 1 Mid blue',
      'magasin': 'Nike',
      'price': '300€',
      'image': 'assets/sneakers/jordan1midblue.jpg',
      'like' : true,
    },
    {
      'titre': 'Jordan 1 mid red',
      'magasin': 'Nike',
      'price': '250€',
      'image': 'assets/sneakers/jordan1midred.jpg',
      'like' : true,
    },
    {
      'titre': 'Jordan 1 Retro High',
      'magasin': 'Nike',
      'price': '399€',
      'image': 'assets/sneakers/jordan1retrohigh.jpg',
      'like' : true,
    },
    {
      'titre': 'Jordan 5 Retro',
      'magasin': 'Nike',
      'price': '1200€',
      'image': 'assets/sneakers/Jordan5retro.jpg',
      'like' : true,
    },
    {
      'titre': 'Air Jordan 1 ',
      'magasin': 'Nike',
      'price': '250€',
      'image': 'assets/images/airJordan1.webp',
      'like' : true,
    }
  ];

  @override
  build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: sneakers.length,
              itemBuilder: (BuildContext context, int index) {
                final sneaker = sneakers[index];
                final titre = sneaker['titre'];
                final image = sneaker['image'];
                final price = sneaker['price'];
                final magasin = sneaker['magasin'];
                final bool like = sneaker['like'];

                return Card(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130,
                          height: 78,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text('$titre',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(magasin),
                                    Text('$price',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 65,
                                ),
                                 IconButton(
                                     onPressed: null,
                                     icon: (like
                                     ? const Icon(Icons.star)
                                     : const Icon(Icons.favorite_border)))
                              ],
                            ),
                          ),
                        )
                      ]),
                );
                /*
              Container(
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
                );*/
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 20,
                width: 10,
              ),
            ),
          ),
        ],
      );
}

class MarqueSneakers extends StatelessWidget {
  MarqueSneakers({Key? key}) : super(key: key);

  final List<String> marque = [
    'all',
    'Nike',
    'Adidas',
    'New Balance',
    'Puma',
    'Balenciaga',
    'Liddl',
    'Converse',
    'Victoria',
    'Feyu'
  ];

  @override
  build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 32,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: marque.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  marque[index],
                  style: TextStyle(
                    backgroundColor: Colors.grey[200],
                  ),
                );
                /*return Container(
                height: 200,
                child: Text(marque[index],style: TextStyle(
                  color: Colors.black,
                )),
                decoration: BoxDecoration (
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.grey[200],
                ),);*/
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 5,
                width: 10,
              ),
            ),
          ),
        ],
      );
}

class BestSeller extends StatelessWidget {
  const BestSeller({Key? key}) : super(key: key);

  @override
  build(BuildContext context) => Column(children: [
        SizedBox(
          height: 500,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/airJordan1.webp'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Positioned(
                      right: 0,
                      top: -5,
                      child: Banner(
                        message: "10% off",
                        location: BannerLocation.topEnd,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image:
                            AssetImage('assets/sneakers/jordan1highzoom.jpg'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/sneakers/Jordan5retro.jpg'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image:
                            AssetImage('assets/sneakers/jordan1retrohigh.jpg'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image:
                            AssetImage('assets/sneakers/jordan1highzoom.jpg'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/sneakers/dunkLowSE.jpg'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/airJordan1.webp'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/airJordan1.webp'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/airJordan1.webp'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]);
}

/*
class MyDetails extends StatelessWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
            appBar: MyDetailAppBar(),
            body: MyDetailPageProducts(),
          )
      ),
    );
  }
}*/

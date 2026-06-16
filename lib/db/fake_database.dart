import 'package:projetogaejoju/domain/conversas.dart';

class FakeDatabase {

  static List listaConvervas=[
    Conversas(img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe0fRq-Y13eilOU5TRxLv0PXf2xT-kiUT__w&s', nome: 'Taylor Swift', msg: 'Hi, Im Taylor', hora: '13:13'),
    Conversas(img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoag78eTwZLaauW9vUlROdFkj82lKetZzMXA&s', nome: 'Lady Gaga', msg: 'Dont call me gaga', hora: '9:11'),
    Conversas(nome: 'Taylor Swift', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe0fRq-Y13eilOU5TRxLv0PXf2xT-kiUT__w&s', msg: 'Hi, Im taylor', hora: '13:13'),
    Conversas(nome: 'Lady gaga', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoag78eTwZLaauW9vUlROdFkj82lKetZzMXA&s', msg: 'Dont call me gaga', hora: '9:11'),
    Conversas(nome: 'Juliano Floss', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaFFy4koCXHyanRg5eSX3JPMFvME0Wwaa-vQ&s', msg: 'Já papou coxinha fofa?', hora: '3:33'),
    Conversas(nome: 'Chappell Roan', img: 'https://s2-g1.glbimg.com/EaTgMzR1sJ8Bhl3kqCc4iJ5d-LQ=/0x0:5708x3805/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2026/D/t/AZTnixSEK7XCSBH3KnAg/ap26033005917016.jpg', msg: 'Você tem filho não, né?', hora: '5:17'),
    Conversas(nome: 'Pablo Vitar', img: 'https://jogada10.com.br/wp-content/uploads/2024/05/GNPJ86UXcAAyvGb_Easy-Resize.com_.jpg', msg: 'Seu amor me pegou', hora: '18:54'),
    Conversas(nome: 'Walker Scobell', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuWpLICQ-_kxetYWl1hyL8zsAHnX2yjSt3tg&s', msg: 'Onde tá a Leah?', hora: '01:43'),
    Conversas(nome: 'Perseu Jackson', img: 'https://pbs.twimg.com/media/El7bWkMXgAE-lwV.jpg', msg: 'Eu não sou loiro burro', hora: '14:51'),
  ];
}
import 'package:flutter/material.dart';
import 'package:intro_example/features/introduction/auth_sheet/auth_sheet.dart';
import 'components/paints/desc_paint/desc_paint.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  late bool expandAuthSheet;
  late bool more;

  @override
  void initState() {
    expandAuthSheet = false;
    more = false;
    super.initState();
  }

  double postop =  0.8;

  void _topup(String pos)
{
  setState(() {
    if (pos == 'up')
      {
        postop= 0;

      }
    else if (pos == 'down')
    {
      postop= 0.8;

    }
    else if (pos == 'upmore')
    {
      postop= 0.1;
    }
  });
}
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Center(
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 10),
                    curve: Curves.easeIn,
                    width: deviceSize.width,
                    height: deviceSize.height * 0.6,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'images/33.jpg',
                            ),
                        )
                    )
                ),
              ),
            ),
            Positioned(
              bottom: deviceSize.height * 0.1,
              child: SizedBox(
                  width: deviceSize.width,
                  height: deviceSize.height * 0.53,
                  child: CustomPaint(
                    size: Size(deviceSize.width, deviceSize.height * 0.6),
                    painter: IntroductionDescriptionPaint(),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                        ),
                        child: SizedBox(
                          width: deviceSize.width * 0.8,
                          height: deviceSize.height * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Spacer(),
                              Text(
                                  'Welcome to Medical Corner!',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  )

                              ),
                              Spacer(),
                              Text(
                                'Medical Corner is a medical application that provides detection of pneumonia and brain tumour. It also provides prediction for heart disease, and diabetes.',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            Positioned(
              right: 12,
              top: 30,
              child: SizedBox(
                width: 45,
                height: 45,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,'/Home');
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              top: deviceSize.height * postop,
              child: AuthSheet(
                  isExpanded: !expandAuthSheet,
                  expandCallback: () {
                    setState(() {
                      expandAuthSheet = !expandAuthSheet;
                      expandAuthSheet ?  _topup("up") :_topup("down") ;

                    });
                  }),
            )
          ],
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/minecraft_button.dart';
import 'syllables_page.dart';

class ConstantsMenuPage extends StatefulWidget {
  const ConstantsMenuPage({super.key});

  @override
  State<ConstantsMenuPage> createState() => _ConstantsMenuPageState();
}

class _ConstantsMenuPageState extends State<ConstantsMenuPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<String> consonants = [
    'Bb',
    'Cc',
    'Dd',
    'Ff',
    'Gg',
    'Hh',
    'Jj',
    'Kk',
    'Ll',
    'Mm',
    'Nn',
    'Ññ',
    'Pp',
    'Qq',
    'Rr',
    'Ss',
    'Tt',
    'Vv',
    'Ww',
    'Xx',
    'Yy',
    'Zz',
  ];

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() async {
    await flutterTts.setLanguage("es-ES");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'lib/assets/images/background-home.png',
            ), // Landscape background as per Image 3
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Back button top left
              Positioned(
                top: 16,
                left: 16,
                child: MinecraftButton.wood(
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 36,
                  ),
                ),
              ),

              // Center inventory panel
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC6C6C6), // Minecraft light grey
                        border: Border(
                          top: const BorderSide(color: Colors.white, width: 4),
                          left: const BorderSide(color: Colors.white, width: 4),
                          bottom: const BorderSide(
                            color: Color(0xFF555555),
                            width: 4,
                          ),
                          right: const BorderSide(
                            color: Color(0xFF555555),
                            width: 4,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => _speak(
                                  'Selecciona la consonante que quieres aprender',
                                ),
                                child: Image.asset(
                                  'lib/assets/images/bocina.png',
                                  height: 70,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Selecciona la consonante\nque quieres aprender',
                                  style: GoogleFonts.pixelifySans(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Grid of consonants
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                            itemCount: consonants.length,
                            itemBuilder: (context, index) {
                              final letterPair = consonants[index];
                              return MinecraftButton.stone(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SyllablesPage(
                                        consonant: letterPair[0],
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  letterPair,
                                  style: const TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ), // Space for the character at the bottom right
                        ],
                      ),
                    ),

                    // Character icon (Piñeyrin) on the bottom right
                    Positioned(
                      right: 0,
                      bottom: -200,
                      left: 220,
                      child: Image.asset(
                        'lib/assets/images/Piñeyrin-1.png',
                        height: 350,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

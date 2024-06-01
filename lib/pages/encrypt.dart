import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:manyinone/pages/app_drawer.dart';
import 'package:manyinone/pages/home.dart';

class Encryption extends StatefulWidget {
  const Encryption({super.key});

  @override
  State<Encryption> createState() => _EncryptionState();
}

class _EncryptionState extends State<Encryption> {
  TextEditingController textEditingController = TextEditingController();
  String encrypted = '';
  String decrypted = '';
  final key = encrypt.Key.fromUtf8('my 32 length key................');
  final iv = encrypt.IV.fromLength(16);

  late encrypt.Encrypter encrypter;

  @override
  void initState() {
    super.initState();
    encrypter = encrypt.Encrypter(encrypt.AES(key));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encrypter'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter text to encrypt',
              ),
            ),
            SizedBox(height: 20),
            Text("Encrypted string: $encrypted"),
            SizedBox(height: 20),
            Text("Decrypted string: $decrypted"),
            ElevatedButton(
              onPressed: () {
                final encryptedData = encrypter.encrypt(textEditingController.text, iv: iv);
                setState(() {
                  encrypted = encryptedData.base64;
                });
              },
              child: Text("Encrypt"),
            ),
            ElevatedButton(
              onPressed: () {
                if (encrypted.isNotEmpty) {
                  final decryptedData = encrypter.decrypt64(encrypted, iv: iv);
                  setState(() {
                    decrypted = decryptedData;
                  });
                }
              },
              child: Text("Decrypt"),
            ),
          ],
        ),
      ),
    );
  }
}

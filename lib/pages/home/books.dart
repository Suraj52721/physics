import 'package:flutter/material.dart';
import 'package:physics/pages/home/storage_services/pdf_reader.dart';
import 'package:physics/pages/home/storage_services/storage_services.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  Color customColor = Color(0xFF081035);
  final storage = StorageService();
  @override
  Widget build(BuildContext context) {

    Future<List<String>> getNames(String path) async {
    final name1= await storage.getNames('books');
    return name1;
  }
  Future<List<String>> getFiles(String path) async {
    final name1= await storage.getFiles('books');
    return name1;
  }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        title: const Text('Books'),
      ),
      body: Center(
          child: 
          FutureBuilder(
            future: Future.wait([getNames('books'), getFiles('books')]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final filedata = snapshot.data as List<List<String>>;
                final names = filedata[0];
                final urls = filedata[1];
                
                return ListView.builder(
                  itemCount: urls.length,
                  itemBuilder: (context, index) {
                    final url = urls[index];
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: customColor,
                      ),
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(Icons.picture_as_pdf_outlined, size: 30),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                             '${names[index]}',
                              style: const TextStyle(fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PdfView(url: url)));
                            }, 
                            child: const Text('View')),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ],
                      )
                      );
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
    );
  }
}
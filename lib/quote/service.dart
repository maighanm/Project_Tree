import 'dart:convert';

import 'package:assigment_flutter/quote/quote.dart';
import 'package:http/http.dart' as http;

Future<List<Quote>> fetchQuote () async{
  final response =await http.get(Uri.parse("https://api.api-ninjas.com/v1/quotes"),
      headers:{'X-Api-Key': 'ETqR6RfzdNkWKiTXzFssyA==n23Uql3IPkvWsPZR'},
  );
   if (response.statusCode == 200){
     List<dynamic> data =jsonDecode(response.body) ;

     return data.map((json) => Quote.fromJson(json)).toList();
   }
   throw Exception("Faild to load data");

}
import 'dart:convert';

import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/carritoIncompleto.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';

Future<String> solicitarPedidosComidasGuisos(String idpedido) async{
  Map<String, String> body = {
    'id_pedido' : idpedido
  };
  return await executeHttpRequest(urlFile: '/obtenerPedComGui.php', requestBody: body);
}

Future<void> traerPedComGui(String idpedido, CarritoIncompleto innerPedComGui) async{ 
  return await solicitarPedidosComidasGuisos(idpedido).then((value){
    final decodedData = json.decode(value);
    innerPedComGui.fromJsonList(decodedData['pedidos']);

    
  });
}
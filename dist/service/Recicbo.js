"use strict";Object.defineProperty(exports, "__esModule", {value: true}); function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }var _CalculadoraConta = require('./CalculadoraConta'); var _CalculadoraConta2 = _interopRequireDefault(_CalculadoraConta);

 class Recibo {

      emitirRecibo(listaProdutos, listaPagantes) {
            // console.log(listaProdutos.produtos);
            let totalValorProdutos = _CalculadoraConta2.default.getTotalProducts(listaProdutos)
            
            let quantidadePagantes = listaPagantes.length;
            // let recibo = [];
            // let divisaoValorPorPagantes = [];
            // let restoDivisaoValorDosPagantes = totalValorProdutos % quantidadePagantes;
            
            let divisaoExata = Math.floor(totalValorProdutos / quantidadePagantes);
            let resto = totalValorProdutos % quantidadePagantes;

            listaPagantes.forEach((pagante) => {
                  pagante.value = divisaoExata
            });
            
            if (resto === 0) {
                  return listaPagantes;
            }

            for(var i = 0; i < resto; i++) {
                  listaPagantes[i].value++
            }

            return console.log(listaPagantes);

            // if(quantidadePagantes % 2 !== 0) {
            //       for(var i = 0; i < quantidadePagantes; i++) {
            //             if(divisaoValorPorPagantes[i] == divisaoValorPorPagantes[0] ){
            //                   divisaoValorPorPagantes.push(divisaoExata + restoDivisaoValorDosPagantes)

            //                   continue
            //             } 
                              
            //             divisaoValorPorPagantes.push(divisaoExata)
            //       }
            // } 
            
            // for(var i = 0; i < quantidadePagantes; i++) {
            //       divisaoValorPorPagantes.push(divisaoExata)
            // } 
            
            // listaPagantes.forEach((email) => {
            //       recibo.push({pagante: email, valor: divisaoValorPorPagantes})
            // });

            // console.log(divisaoValorPorPagantes);
      }
} exports.default = Recibo;
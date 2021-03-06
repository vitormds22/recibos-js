"use strict";Object.defineProperty(exports, "__esModule", {value: true}); class CalculadoraConta {

      getTotalProducts (listaProdutos) {
          let valorInicial = 0;
  
          let totalCompraProduto = this.getTotal(listaProdutos)
          
          return totalCompraProduto.reduce(
                (valorAnterior, valorAtual) => valorAnterior + valorAtual, valorInicial
          );
      }
    
       getTotal (listaProdutos) {
          return listaProdutos.produtos.map((produto) => {
                return produto.valor * produto.quantidade;
          })
      }
  } exports.default = CalculadoraConta;
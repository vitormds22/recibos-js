import CalculadoraConta from './CalculadoraConta';
import Transformer from './Transformer';

export default class Recibo {

      constructor() {
            this.calculadora = new CalculadoraConta();
            this.transformer = new Transformer();
      }

      emitirRecibo(listaProdutos, listaPagantes) {

            let totalValorProdutos = this.calculadora.getTotalValorProdutos(listaProdutos)
            
            let quantidadePagantes = listaPagantes.length;

            let divisaoExata = Math.floor(totalValorProdutos / quantidadePagantes);
            let resto = totalValorProdutos % quantidadePagantes;

            listaPagantes.forEach((pagante) => {
                  pagante.valor = divisaoExata
            });
            
            if (resto === 0) {
                  return this.transformer.transform(listaPagantes);
            }

            for(var i = 0; i < resto; i++) {
                  listaPagantes[i].valor++
            }

            return this.transformer.transform(listaPagantes);
      }
}
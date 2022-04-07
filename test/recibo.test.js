import recibo from '../src/service/emitirRecibo';
import Produto from '../src/model/Produto';
import ListaProdutos from '../src/model/ListaProdutos';
import emitirRecibo from '../src/service/emitirRecibo';

test('Validação da existência de uma lista de produtos', () => {
      let listaProdutos = new ListaProdutos;
      const espaguete = new Produto('Espaguete', 1, 100);
      // const coca_cola  = new Produto('Coca cola', 1, 100);
      // const nhoque  = new Produto('Nhoque', 1, 0);

      let listaPagantes = ['roger@mail.com', 'wanda@mail.com', 'fran@mail.com'];

      listaProdutos.adiciona(espaguete);
      // listaProdutos.adiciona(coca_cola);
      // listaProdutos.adiciona(nhoque);
      
      emitirRecibo(listaProdutos, listaPagantes);
});

// test('', ()=>{

// });
import recibo from '../src/service/emitirRecibo';
import Produto from '../src/model/Produto';
import ListaProdutos from '../src/model/ListaProdutos';
import emitirRecibo from '../src/service/emitirRecibo';

test('Validação da existência de uma lista de produtos', () => {
      let listaProdutos = new ListaProdutos;
      const celular = new Produto('Espaguete', 2, 3800);
      const capa_protetora  = new Produto('Coca cola', 3, 500);
      const carregador  = new Produto('Nhoque', 1, 3200);

      let listaPagantes = ['roger@mail.com', 'wanda@mail.com', 'fran@mail.com'];

      listaProdutos.adiciona(celular);
      listaProdutos.adiciona(capa_protetora);
      listaProdutos.adiciona(carregador);
      
      emitirRecibo(listaProdutos, listaPagantes);
});

// test('', ()=>{

// });
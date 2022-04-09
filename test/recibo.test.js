import Produto from '../src/model/Produto';
import ListaProdutos from '../src/model/ListaProdutos';
import Recibo from '../src/service/Recicbo';
import CalculadoraConta from '../src/service/CalculadoraConta'

test('Valor total distribuído entre os pagantes quando o resto da divisão não for zero', () => {
      let listaProdutos = new ListaProdutos;
      let recibo = new Recibo;
      const espaguete = new Produto('Espaguete', 1, 20000);

      let listaPagantes = [{email: 'roger@mail.com', valor:0}, {email: 'wanda@mail.com', valor:0},{email: 'fran@mail.com', valor:0}];

      listaProdutos.adiciona(espaguete);
      
      let result = recibo.emitirRecibo(listaProdutos, listaPagantes);

      expect(result).toEqual([{email: 'roger@mail.com', valor:'$66,67'}, {email: 'wanda@mail.com', valor:'$66,67'},{email: 'fran@mail.com', valor:'$66,66'}]);
});

test('Valor total distribuído entre os pagantes quando a divisão for exata', () => {
      let listaProdutos = new ListaProdutos;
      let recibo = new Recibo;
      const espaguete = new Produto('Espaguete', 1, 90);

      let listaPagantes = [{email: 'roger@mail.com', valor:0}, {email: 'wanda@mail.com', valor:0},{email: 'fran@mail.com', valor:0}];

      listaProdutos.adiciona(espaguete);
      
      let result = recibo.emitirRecibo(listaProdutos, listaPagantes);

      expect(result).toEqual([{email: 'roger@mail.com', valor:30}, {email: 'wanda@mail.com', valor:30},{email: 'fran@mail.com', valor:30}]);
});

test('Valor total distribuído entre os pagantes quando o total do valor dos produtos for alto', () => {
      let listaProdutos = new ListaProdutos;
      let recibo = new Recibo;
      const espaguete = new Produto('Espaguete', 1, 3850);
      const coca_cola = new Produto('Coca Cola', 5, 550);
      const nhoque = new Produto('Nhoque', 1, 3210);
      const paella = new Produto('Paella', 1, 5620);
      const bife_angus = new Produto('Bife Angus', 1, 6890);

      let listaPagantes = [
            {email: 'roger@mail.com', valor:0}, 
            {email: 'wanda@mail.com', valor:0}, 
            {email: 'fran@mail.com', valor:0}, 
            {email: 'gabriel@mail.com', valor:0}
      ];

      listaProdutos.adiciona(espaguete);
      listaProdutos.adiciona(coca_cola);
      listaProdutos.adiciona(nhoque);
      listaProdutos.adiciona(paella);
      listaProdutos.adiciona(bife_angus);
      
      let result = recibo.emitirRecibo(listaProdutos, listaPagantes);

      console.log(result);
      expect(result).toEqual([{email: 'roger@mail.com', valor:'$55,80'}, {email: 'wanda@mail.com', valor:'$55,80'},{email: 'fran@mail.com', valor:'$55,80'},{email: 'gabriel@mail.com', valor:'$55,80'}]);
});

test('', () => {
      
})
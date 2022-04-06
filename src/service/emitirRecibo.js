import Produto from '../model/Produto';
import ListaProdutos from '../model/ListaProdutos';

let listaProdutos = new ListaProdutos;
const celular = new Produto('Celular', 1, 350000);
const capa_protetora  = new Produto('Capa protetora', 1000, 500);

listaProdutos.adiciona(celular);
listaProdutos.adiciona(capa_protetora);

export default function emitirRecibo(listaProdutos) {
      console.log(listaProdutos);
}
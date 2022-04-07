export default function emitirRecibo(listaProdutos, listaPagantes) {
      console.log(listaProdutos.produtos);
     
      var totalCompraProduto = listaProdutos.produtos.map(function(produto) {
           return produto.valor * produto.quantidade;
      })
      
      const valorInicial = 0;
      let totalValorProdutos = totalCompraProduto.reduce(
            (valorAnterior, valorAtual) => valorAnterior + valorAtual, valorInicial
      );
      
      let divisaoValorPorPagantes = totalValorProdutos / listaPagantes.length;
      let recibo = [];
      // if(listaPagantes.length % 3 === 0) {
      //       divisaoValorPorPagantes =+ 0.01
      // }
      listaPagantes.forEach(function(email){
            recibo.push({pagante: email, valor: divisaoValorPorPagantes})
      });
      console.log(recibo);
}
export default function emitirRecibo(listaProdutos, listaPagantes) {
      // console.log(listaProdutos.produtos);
     
      var totalCompraProduto = listaProdutos.produtos.map(function(produto) {
           return produto.valor * produto.quantidade;
      })
      
      const valorInicial = 0;
      let totalValorProdutos = totalCompraProduto.reduce(
            (valorAnterior, valorAtual) => valorAnterior + valorAtual, valorInicial
      );
      
      let quantidadePagantes = listaPagantes.length;
      let recibo = [];
      let divisaoValorPorPagantes = [];
      let restoDivisaoValorDosPagantes = totalValorProdutos % quantidadePagantes;
      let divisaoExata = Math.round(totalValorProdutos / quantidadePagantes);

      if(quantidadePagantes % 2 !== 0) {
            for(var i = 0; i < quantidadePagantes; i++) {
                  if(divisaoValorPorPagantes[i] == divisaoValorPorPagantes[0] ){
                        divisaoValorPorPagantes.push(divisaoExata + restoDivisaoValorDosPagantes)
                  } else {
                        divisaoValorPorPagantes.push(divisaoExata)
                  }
            }
      } else {
            for(var i = 0; i < quantidadePagantes; i++) {
                  divisaoValorPorPagantes.push(divisaoExata)
            } 
      }
      
      listaPagantes.forEach(function(email){
            recibo.push({pagante: email, valor: divisaoValorPorPagantes})
      });

      console.log(divisaoValorPorPagantes);
}
import currency from "currency.js";

export default class Transformer {
      transform(listaPagantes) { 
            let transformed = []
            listaPagantes.forEach((pagante) => {
                  transformed.push({email: pagante.email, value: currency((pagante.value / 100), { decimal: ',', separator: '.'}).format()})
            })         
            return transformed;   
      }
}
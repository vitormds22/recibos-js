"use strict";Object.defineProperty(exports, "__esModule", {value: true}); class ListaProdutos {

      constructor() {
            this._produtos = [];
      }

      adiciona(produto) {
            this._produtos.push(produto);
      }

      get produtos() {
            return [].concat(this._produtos);
      }
} exports.default = ListaProdutos;
(function(){
  "use strict";  
  
  var WORDS_REGEX = /[a-z0-9]+/g;
  
  function Words(phrase) {
    this.phrase = phrase;
    this.words = extractWords(normalizeCase(this.phrase));
    this.count = count(this.words);
  }
  
  function normalizeCase(phrase) {
    return phrase.toLowerCase();
  }
  
  function extractWords(phrase) {
    return phrase.match(WORDS_REGEX);
  }
  
  function count(words) {
    var accumulator = {};
    words.forEach(function(word) {
      if(!accumulator[word]) {
        accumulator[word] = 0;
      }
      accumulator[word]++;
    });
    return accumulator;
  }
  
  module.exports = Words;
})();
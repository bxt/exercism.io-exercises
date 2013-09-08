module.exports = (function(){
  "use strict";  

  function Anagram(word) {
    this.word = word;
  }

  Anagram.prototype.match = function(anagrams) {
    var reference = countLetters(this.word);
    return anagrams.filter(function(anagram) {
      var current = countLetters(anagram)
      return countsEqual(current, reference);
    });
  };

  function countsEqual(countsA, countsB) {
    return countsIncluded(countsA, countsB)
        && countsIncluded(countsB, countsA);
  }

  function countsIncluded(inner, outer) {
    for (var letter in inner) {
      if (outer[letter] !== inner[letter]) {
        return false;
      }
    }
    return true;
  }

  function countLetters(word) {
    var letterCounts = {};
    eachLetter(word, function(letter) {
      if (!letterCounts[letter]) {
        letterCounts[letter] = 0;
      }
      letterCounts[letter]++;
    });
   return letterCounts;
  }

  function eachLetter(string, callback) {
    for (var i = 0; i < string.length; i++) {
      callback(string.charAt(i), i);
    }
  }

  return Anagram;
})();
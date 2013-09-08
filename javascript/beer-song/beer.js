module.exports = (function(){
  "use strict";  
  
  function verse(number) {
    return first_line(number) + second_line(number-1);
  }
  
  function first_line(number) {
    if(number == 0) {
      return "No more bottles of beer on the wall, no more bottles of beer.\n";
    }
    if(number == 1) {
      return "1 bottle of beer on the wall, 1 bottle of beer.\n";
    }
    return number + " bottles of beer on the wall, " + number + " bottles of beer.\n";
  }
  
  function second_line(number) {
    if(number < 0) {
      return "Go to the store and buy some more, 99 bottles of beer on the wall.\n";
    }
    if(number == 0) {
      return "Take it down and pass it around, no more bottles of beer on the wall.\n";
    }
    if(number == 1) {
      return "Take one down and pass it around, 1 bottle of beer on the wall.\n";
    }
    return "Take one down and pass it around, " + number + " bottles of beer on the wall.\n";
  }
  
  function sing(from, to) {
    to = to || 0;
    var verses = [];
    for (var i = from; i >= to; i--) {
      verses.push(verse(i));
    }
    return verses.join("\n");
  }

  return {"verse": verse, "sing": sing};
})();
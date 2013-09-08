module.exports = (function(){
  "use strict";
  
  var THYMIDINE = 'T', URACIL = 'U';
  
  function DNA(dna_string) {
    this.dna_string = dna_string;
  }

  DNA.prototype.toRNA = function() {
   return this.dna_string.replace(new RegExp(THYMIDINE,'g'),URACIL);
  };
  
  return DNA;
})();
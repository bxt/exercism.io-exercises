module.exports = (function(){
  "use strict";  
  
  function DNA(dna_string) {
    this.nucleotideCounts = dna_string.split('').reduce(function(counts, nucleotide){
      counts[nucleotide]++;
      return counts;
    },  { A : 0, T : 0, C : 0, G : 0 });
  }
  
  DNA.prototype.count = function(nucleotide) {
    if(nucleotide === 'U') {
      return 0;
    }
    if(this.nucleotideCounts[nucleotide] === undefined) {
      throw new Error("Invalid Nucleotide");
    }
    return this.nucleotideCounts[nucleotide];
  }
  
  return DNA;
})();
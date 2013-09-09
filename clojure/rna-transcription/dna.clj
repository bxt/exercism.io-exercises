(ns dna
  (:require [clojure.string :as s]))

(def ^:private thymidine "T")
(def ^:private uracil    "U")

(defn to-rna [dna_string]
  (s/replace dna_string thymidine uracil))
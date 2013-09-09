(ns dna
  (:require [clojure.string :as s]))

(def ^:private thymidine "T")
(def ^:private uracil    "U")

(defn to-rna [dna-string]
  (s/replace dna-string thymidine uracil))
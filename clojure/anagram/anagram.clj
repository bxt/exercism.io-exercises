(ns anagram
  (:require [clojure.string :as s]))

(defn- normalizations [word]
  (rest (reductions #(%2 %1) [word s/lower-case frequencies])))

(defn- anagram-of? [word1]
  (let [[word1 w1freq] (normalizations word1)]
    (fn [word2]
      (let [[word2 w12req] (normalizations word2)]
        (and (not= word1 word2)
             (   = w1freq w12req))))))

(defn anagrams-for [word candidates]
  (filter (anagram-of? word) candidates))
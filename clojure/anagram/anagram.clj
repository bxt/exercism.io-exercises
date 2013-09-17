(ns anagram
  (:require [clojure.string :as s]))

(defn- normalize [word]
  (let [lower (s/lower-case word)
        freqs (frequencies lower)]
        [lower freqs]))

(defn- inner-anagram-of? [[lower1 freqs1]]
  (fn [[lower2 freqs2]]
    (and (not= lower1 lower2)
         (=    freqs1 freqs2))))

(defn- anagram-of? [word]
  (comp (inner-anagram-of? (normalize word)) normalize))

(defn anagrams-for [word candidates]
  (filter (anagram-of? word) candidates))

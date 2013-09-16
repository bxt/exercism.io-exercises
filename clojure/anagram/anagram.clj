(ns anagram
  (:require [clojure.string :as s]))

(defn- on [g f x y] (g (f x) (f y)))

(defn- noralize [word]
  (let [lower (s/lower-case word)
        freqs (frequencies lower)]
        {:lower lower :freqs freqs}))

(defn- anagram-of? [word1]
  (let [n1 (noralize word1)]
    (fn [word2]
      (let [n2 (noralize word2)]
        (and (on not= :lower n1 n2)
             (on =    :freqs n1 n2))))))

(defn anagrams-for [word candidates]
  (filter (anagram-of? word) candidates))
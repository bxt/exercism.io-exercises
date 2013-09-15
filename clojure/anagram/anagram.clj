(ns anagram
  (:require [clojure.string :as s]))

(def letters (comp frequencies s/lower-case))

(defn- on [g f x y] (g (f x) (f y)))

(defn- anagram? [word1 word2]
  (and (on not= s/lower-case word1 word2)
       (on = letters word1 word2)))

(defn anagrams-for [word candidates]
  (filter #(anagram? word %) candidates))
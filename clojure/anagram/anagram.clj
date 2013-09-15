(ns anagram
  (:require [clojure.string :as s]))

(defn- normalize [word] (-> word s/lower-case sort))

(defn- anagram? [& words]
  (let [lowers (map s/lower-case words)
        freqs (map frequencies lowers)]
    (and (apply not= lowers)
         (apply = freqs))))

(defn anagrams-for [word candidates]
  (filter (partial anagram? word) candidates))
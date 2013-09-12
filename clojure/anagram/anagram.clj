(ns anagram
  (:require [clojure.string :as s]))

(defn- normalize [word] (-> word s/lower-case sort))

(defn anagrams-for [word candidates]
  (filter (fn [x] (and (not= (s/lower-case x) (s/lower-case word)) (= (normalize x) (normalize word)))) candidates))
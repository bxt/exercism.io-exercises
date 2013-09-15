(ns anagram
  (:require [clojure.string :as s]))

(defn- normalize [word] (-> word s/lower-case sort))

(defn- anagram? [x y]
  (let [xl (s/lower-case x)
        yl (s/lower-case y)]
    (and (not= xl yl)
         (= (frequencies xl) (frequencies yl)))))

(defn anagrams-for [word candidates]
  (filter (fn [x] (anagram? word x)) candidates))
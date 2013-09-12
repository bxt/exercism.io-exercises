(ns phrase
  (:require [clojure.string :as s]))

(defn- split [string] (re-seq #"\w+" string))

(defn word-count [string]
  (-> string s/lower-case split frequencies))
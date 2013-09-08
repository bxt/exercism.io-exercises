void :: Functor f => f a -> f ()
void = fmap (const ())

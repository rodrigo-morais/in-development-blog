module Header.HeaderCss exposing (..)


import Css exposing (..)
import Css.Namespace exposing (namespace)


type CssClasses
    = NavBar
    | Header
    | Title


css =
  (stylesheet << namespace "header")
  [ (.) NavBar
      [ marginTop (em 0.6)
      ]
  , (.) Header
      [
        backgroundColor (rgba 217 217 217 0.4)
      , color (hex "FFFFFF")
      , paddingTop (em 1)
      ]
  , (.) Title
      [ margin zero
      , marginLeft (em 0.4)
      ]
  ]

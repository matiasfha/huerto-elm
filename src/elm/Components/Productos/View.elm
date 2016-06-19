module Components.Productos.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown

import Components.Productos.Messages exposing (Msg(..))
import Components.Productos.Models exposing (..)
import Utils.String exposing (excerpt, concat)

list : Product -> Html Msg
list item =
  ul [] [
    li [][
      i [ classList [ ("fa",True), ("fa-dollar", True), ("fa-fw", True)]][]
      , (text (toString item.price) )
    ]
    ,li [][
      i [ classList [ ("fa",True), ("fa-leaf", True), ("fa-fw", True)]][]
      , (text item.quality)
    ]
  ]

showMarkdown : String -> Bool -> Html Msg
showMarkdown str trunc =
  if trunc then
    Markdown.toHtml [] (excerpt str 125 )
  else
    Markdown.toHtml [] str

card : Product -> Bool -> Html Msg
card item trunc =
  div [ classList [ ("col-sm-6", True), ("col-lg-4", True)]] [
    div [ class "card-product"][
      a [ href ""][
        div [ class "picture", style [("background-image",concat["url(", item.image,")"])]][]
        ,div [ class "content"] [
          h5 [] [ (text item.title)]
        , p [] [ showMarkdown item.description trunc]
        , list item
        ]
      ]
    ]
  ]

itemRow : Maybe (List Product) -> Bool -> Html Msg
itemRow items trunc =
  case items of
    Just items ->
      div [ class "row"] (List.map2 card items [trunc])
    Nothing ->
      div [ class "row" ] [ text "Cargando..." ]

view : Maybe (List Product) -> Html Msg
view items =
  div [ classList [("section", True), ("yellow", True)]][
    div [ class "container"][
      h3 [ class "text-center"][
        i [ classList [ ("fa", True), ("fa-leaf", True)]][]
        , br [] []
        , (text "Productos")
      ]
      , itemRow items True

      , div [ classList [ ("row", True), ("text-center", True)]][
        button [ onClick ShowProducts, class "btn"] [ (text "Ver todos los productos")]
      ]
    ]
  ]


fullView : Maybe (List Product) -> Html Msg
fullView items =
  div [ classList [("section", True), ("yellow", True)]][
    div [ class "container"][
      h3 [ class "text-center"][
        i [ classList [ ("fa", True), ("fa-leaf", True)]][]
        , br [] []
        , (text "Productos")
      ]
      , itemRow items False
    ]
  ]

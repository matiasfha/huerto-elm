module Components.Admin.ProductsView exposing (view, editor)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown

import Utils.String exposing (excerpt, toClassList)
import Components.Productos.Models exposing (Product)
import Components.Admin.Messages exposing (Msg(..))
import Model exposing (..)

list : Product -> Html Msg
list item =
  li [] [
    a [ onClick (ShowProduct item.id)] [
      h3 [] [
        text item.title
      ]
    , section [] [
        span [ class "description"] [ Markdown.toHtml [] (excerpt item.description 100)]
      ,  span [ class "price"] [
          text ("$" ++  (toString item.price))
        ]
      , span [class "quality"] [
          text item.quality
        ]
      ]
    ]
  ]

renderList: Maybe (List Product) -> Html Msg
renderList items =
  case items of
    Nothing ->
      div [] []
    Just items ->
      div [ class "col-sm-4"] [
        ol [class "posts-list"] (List.map list items)
      ]

viewer : Model -> Html Msg
viewer model =
  case model.admin.currentProduct of
    Nothing ->
      div [class "col-sm-8"] []
    Just product ->
      section [classList (toClassList "col-sm-8 content-preview")] [
        section [class "post-controls"] [
          a [class "post-edit", onClick (UpdateProduct product.id)] [
            i [classList (toClassList "fa fa-pencil-square-o")][]
          ]
        ]
      , section [class "content-preview-content"] [
          div [class "wrapper"] [
            h1 [class "content-preview-title"][
              text product.title
            ]
          , p [] [
              span [ class "price"] [
                text ("Precio: $" ++  (toString product.price))
              ]
            , span [class "quality"] [
                text ("Calidad: " ++ product.quality)
              ]
            ]
          , p [] [
              img [ src product.image] []
            ]
          , p [] [Markdown.toHtml [] product.description]
          ]
        ]
      ]


view : Model -> Html Msg
view model =
  div [ classList (toClassList "col-md-11 col-md-offset-1 main") ] [
    div [class "col-sm-12 view-header"] [
      h2 [ ] [
       text "Productos"
      ]
    , section [class "view-actions"] [
        a [class "new-post", onClick NewProduct] [
          text "Nuevo Producto"
        ]
      ]
    ]
    , renderList model.products
    , viewer model
    ]

editor : Html Msg
editor =
  div [ classList (toClassList "col-md-11 col-md-offset-1 main") ] [
    div [class "col-sm-12 view-header"] [
      h2 [] [
        input [autofocus True, placeholder "Nombre del Producto", tabindex 1, type' "text"] []
      ]
    , section [class "view-actions"] [
        a [classList (toClassList "new-post btn-blue")] [
          text "Guardar"
        ]
      ]
    ]
  , section [ class "col-sm-12 view-container"] [
      section [class "col-sm-6 entry-markdown"] [
        div [class "floatingheader"] [ text "Markdown"]
      , section [class "entry-markdown-content"] [
          textarea [] []
        ]
      ]
    , section [ class "col-sm-6 entry-preview"] [
        div [class "floatingheader"] [ text "Preview"]
      , section [ class "entry-preview-content"] [
          div [ class "rendered-markdown"] [
            h1 [class "content-preview-title"][

            ]
          , p [] [
              span [ class "price"] [
                text ("Precio: $" ) -- ++ (toString product.price)
              ]
            , span [class "quality"] [
                text ("Calidad: ") -- ++ product.quality
              ]
            ]
          , p [] [
              img [ src "" ] [] --product.image
            ]
          , p [] [Markdown.toHtml [] "###"] --product.description
          ]
        ]
      ]
    ]
  ]

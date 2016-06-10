module Components.About.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


view : Html a
view =
  div [ class "about "] [
    div [ class "bg-overlay" ] [
      div [ class "section" ] [
        div [ class "container" ] [
          div [ class "col-sm-7"] [
            p [] [
              em [] [
                (text " Hoy nos hemos transformado en HUERTO RIPE INALAF, Agroecológico, con
              producción de hortalizas tradicionales, como lechugas, acelgas, cilantro, etc., y otras
              hortalizas de gran aporte nutricional, como Kale, Couvé, Rúcula, Topinambur, todo
              ello producido en forma 100 % orgánica.")
              , br [] []
              , br [] []
              , (text " Estamos ubicados en la costa de la Región del Maule, provincia de Cauquenes, comuna de Pelluhue.")
              ]
            ]
          ]
        ]
      ]
    ]
  ]

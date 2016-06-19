module Components.Login.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onSubmit, onInput)

import Utils.String exposing (toClassList)
import Model exposing (..)
import Components.Login.Messages exposing (Msg(..))

view : Model -> Html Msg
view model =
  main' [class "main"] [
    div [ class "flow"] [
      div [class "flow-wrap"] [
        section [class "flow-content"] [
          Html.form [class "signin", onSubmit Validate] [
            div [class "form-group"] [
              div [class "input-group"] [
                div [ class "input-group-addon"] [
                  i [ classList (toClassList "fa fa-envelope-o")] []
                 ]
                 , input [placeholder "Email", tabindex 1, name "email", type' "email", class "input-email", onInput SetEmail][]
                ]
              ]
          , div [class "form-group"] [
              div [class "input-group"] [
                div [ class "input-group-addon"] [
                  i [ classList (toClassList "fa fa-lock")] []
                 ]
                 , input [placeholder "Password", tabindex 1, name "password", type' "password", class "input-email", onInput SetPassword][]
                ]
              ]
          , button [type' "submit", class "login-btn", tabindex 3] [ text "Ingresar"]
          , a [ class "back", onClick ShowHome] [ text "Volver"]
          ]
        , p [class "errors"] [
            text model.login.email_error
          ]
          , p [class "errors"] [
            text model.login.password_error
          ]
          , p [class "errors"] [
            text model.login.submitted_error
          ]
        ]
      ]
    ]
  ]

module Components.Login.Update exposing (update, onLogin)

import Components.Login.Messages exposing (Msg(..))
import Router exposing (navigationCmd)
import Model exposing (..)
import Ports exposing (..)

-- getErrors : Model -> { email: String, password: String}
getErrors model =
  { email_error =
      if model.login.email == "" then
        "Email no puede estar vacio"
      else
        ""
  , password_error =
      if model.login.password == "" then
        "Password no puede estar vacio"
      else
        ""
  }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let
    login = model.login
  in
    case msg of
      ShowLogin ->
        if login.loggedIn == True then
          (model, navigationCmd "/admin")
        else
          (model, navigationCmd "/login")
      ShowHome ->
        (model, navigationCmd "")
      SetEmail email ->
        let
          login' = { login | email = email }
        in
          ({model | login = login'}, Cmd.none)
      SetPassword password ->
        let
          login' = { login | password = password }
        in
          ({model | login = login'}, Cmd.none)
      Validate ->
        let
          {email_error, password_error} = (Debug.log "errors" (getErrors model))
          login' = { login | email_error = email_error, password_error = password_error}
        in
          if email_error == "" && password_error == "" then
            update SubmitForm model
          else
            ({model | login = login'}, Cmd.none)
      SubmitForm  ->
        let
          username = model.login.email
          password = model.login.password
          login' = { login | email = "", password = "", email_error = "", password_error = ""}
        in
          ({model | login = login'}, doLogin (username, password) )

onLogin: UserData -> Model -> (Model, Cmd Msg)
onLogin data model =
  let
    login = model.login
  in
    if data.status == 200 then
      let
        login' = { login | loggedIn = True,
          accessToken = data.accessToken
        , submitted_error = ""}
      in
        ({model | login = (Debug.log "login" login')}, navigationCmd "/admin")
    else
      let
        login' = { login | loggedIn = False, accessToken = "", submitted_error = data.message }
      in
        ({model | login = login'}, Cmd.none)

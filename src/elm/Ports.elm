port module Ports exposing (..)


type alias UserData =
  { message: String
  , accessToken: String
  , status: Int
  }

port doLogin : (String, String) -> Cmd msg

port loggedin : (UserData -> msg) -> Sub msg

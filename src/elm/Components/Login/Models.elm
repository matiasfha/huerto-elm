module Components.Login.Models exposing (..)

type alias Model =
  { loggedIn: Bool
  , accessToken: String
  , email: String
  , password: String
  , email_error : String
  , password_error : String
  , submitted_error : String
  }

module Components.Login.Messages exposing (..)

type Msg =
  ShowLogin
  | ShowHome
  | Validate
  | SetEmail String
  | SetPassword String
  | SubmitForm
  | LoggedIn

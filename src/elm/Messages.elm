module Messages exposing (..)

import Router
-- Components
import Components.Productos.Messages
import Components.News.Messages
import Components.Admin.Messages
import Components.Login.Messages

type alias UserData =
  { message: String
  , accessToken: String
  , status: Int
  }

type Msg =
  None
  | Router Router.Msg
  | NewsMsg Components.News.Messages.Msg
  | ProductsMsg Components.Productos.Messages.Msg
  | AdminMsg Components.Admin.Messages.Msg
  | LoginMsg Components.Login.Messages.Msg
  | LoggedIn UserData

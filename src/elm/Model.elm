module Model exposing (..)
import Hop.Types
import Router

import Components.Productos.Models exposing (Product)
import Components.News.Models exposing (News)
import Components.Admin.Models as AdminModel
import Components.Login.Models as LoginModel


type alias Model =
  { routing: Router.Model
  , products : Maybe (List Product)
  , news : Maybe (List News)
  , admin : AdminModel.Model
  , login: LoginModel.Model
}

initialModel : Hop.Types.Location -> Router.Route -> Model
initialModel location route =
  { routing = Router.Model location route
  , products = Just []
  , news = Just []
  , admin =
    { currentProduct = Nothing
    , currentNews = Nothing
    }
  , login = {
      loggedIn = False
    , accessToken = ""
    , email = ""
    , password = ""
    , email_error = ""
    , password_error = ""
    , submitted_error = ""
    }
  }

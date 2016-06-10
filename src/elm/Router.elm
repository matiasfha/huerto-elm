module Router exposing (..)
import Navigation
import Hop exposing (makeUrl, makeUrlFromLocation, matchUrl, setQuery)
import Hop.Types exposing (Config, Query, Location, PathMatcher, Router)
import Hop.Matchers exposing (..)

-- ROUTES
type Route
  = MainRoute
  | NewsRoute
  | ProductsRoute
  | NotFoundRoute

--- Model
type alias Model =
  { location : Location
  , route : Route
}

type Msg =
  NavigateTo String

navigationCmd : String -> Cmd a
navigationCmd path =
    Navigation.modifyUrl (makeUrl routerConfig path)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NavigateTo path ->
      ( model, navigationCmd path)

-- MATCHERS
matchers : List (PathMatcher Route)
matchers =
  [ match1 MainRoute ""
  , match1 NewsRoute "/news"
  , match1 ProductsRoute "/products"
  ]

-- RouterConfig
routerConfig : Config Route
routerConfig =
  { hash = True
  , basePath = ""
  , matchers = matchers
  , notFound = NotFoundRoute}

-- URL parser
urlParser : Navigation.Parser (Route, Location)
urlParser =
  Navigation.makeParser (.href >> matchUrl routerConfig)

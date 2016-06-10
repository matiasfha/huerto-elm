module TestRunner exposing (..)
import ElmTest exposing (..)

-- Components
import Components.News.Update as News
import Components.News.Messages as NewsMsg
import Model exposing (..)
import Router

runShowNews =
  let
    (model, cmd ) = News.update NewsMsg.ShowNews initialModel
  in
    model

nextModel initialModel =
  initialModel

tests : Test
tests =
    suite "A Test Suite"
        [ test "News Update" (assertEqual runShowNews (nextModel initialModel))
        ]


main : Program Never
main =
  runSuite tests

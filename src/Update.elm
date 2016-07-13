module Update exposing (..)


import Routing.Models exposing (..)
import Routing.Config exposing (routerConfig)
import Routing.Utils exposing (reverse, navigationCmd)


import Messages exposing (..)
import Models exposing (AppModel)


import Posts.List.Update
import Posts.Show.Update


import Navigation.Update


update : Msg -> AppModel -> (AppModel, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      (model, Cmd.none)

    PostsMessagesMsg subMsg ->
      let
        ( updatedPosts, msg ) =
          Posts.List.Update.update subMsg model.posts
      in
        ( { model | posts = updatedPosts }, Cmd.map PostsMessagesMsg msg )

    PostMessagesMsg subMsg ->
      let
        ( _, msg ) =
          Posts.Show.Update.update subMsg model.post
      in
        ( model, Cmd.map PostMessagesMsg msg )

    NavigationMessagesMsg subMsg ->
      let
        msg =
          Navigation.Update.update subMsg

      in
        ( model, Cmd.map NavigationMessagesMsg msg )

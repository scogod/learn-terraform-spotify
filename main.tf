# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist1" {
  artist = "Led Zeppelin"
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

data "spotify_search_track" "by_artist2" {
  artist = "Black Sabbath"
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}


resource "spotify_playlist" "playlist" {
  name        = "sjg Terraform Summer Playlist"
  description = "created by sjg via Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist1.tracks[0].id,
    data.spotify_search_track.by_artist1.tracks[1].id,
    data.spotify_search_track.by_artist1.tracks[2].id,
    data.spotify_search_track.by_artist2.tracks[0].id,
    data.spotify_search_track.by_artist2.tracks[1].id,
    data.spotify_search_track.by_artist2.tracks[2].id,
  ]
}

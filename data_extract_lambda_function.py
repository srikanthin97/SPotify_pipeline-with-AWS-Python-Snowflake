import json
import os
import boto3
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
from datetime import datetime

def lambda_handler(event, context):
    client_id = os.environ['client_id']
    client_secret = os.environ['client_secret']
    client_credentials_manager = SpotifyClientCredentials(client_id, client_secret)
    sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)
    playlist = sp.user_playlists('spotify')
    playlist_link = 'https://open.spotify.com/playlist/6VOedaf3eNWDOVpa9Qdlvg'
    playlist_uri = playlist_link.split('/')[-1]
    spotify_data = sp.playlist_tracks(playlist_uri)
    print(spotify_data)

    client = boto3.client('s3')

    filename = 'spotify_raw_' + str(datetime.now()) + '.json'

    client.put_object(Body=json.dumps(spotify_data), Bucket='spotify-etl-project-sidd', Key='raw_data/to_processed/'+filename)

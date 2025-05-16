--CREATE 3 Tables on SnowflakeDB - tblAlbum,tblArtist,tblSongs

CREATE OR REPLACE DATABASE SPOTIFY_PROJECT;
CREATE OR REPLACE SCHEMA PROJECT_SCHEMA;

CREATE OR REPLACE TABLE tblAlbum (
    album_id string,
    album_name string,
    release_date date,
    total_tracks int,
    url string  
);

CREATE OR REPLACE TABLE tblArtist (
    artist_id string,
    artist_name string,
    external_url string
);

CREATE OR REPLACE TABLE tblSongs (
    song_id string,
    song_name string,
    duration_ms int,
    url string,
    popularity int,
    song_added date,
    album_id string,
    artist_id string
);

--CREATE Storage Integrtion, File Format and Stage for data loading

CREATE OR REPLACE STORAGE INTEGRATION s3_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = s3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'your-aws-arn'
STORAGE_ALLOWED_LOCATIONS = ('your-s3-location');



desc integration s3_integration;

CREATE OR REPLACE FILE FORMAT json_ff
TYPE = CSV
FIELD_DELIMITER = ','
skip_header = 1;


CREATE OR REPLACE STAGE load_data_from_s3_album
URL = 'your-s3-location'
storage_integration = s3_integration
file_format = json_ff;

CREATE OR REPLACE STAGE load_data_from_s3_artist
URL = 'your-s3-location'
storage_integration = s3_integration
file_format = json_ff;

CREATE OR REPLACE STAGE load_data_from_s3_songs
URL = 'your-s3-location'
storage_integration = s3_integration
file_format = json_ff;




LIST @load_data_from_s3_album;
LIST @load_data_from_s3_artist;
LIST @load_data_from_s3_songs;


--Test to load data into the tables

COPY INTO tblAlbum
FROM @load_data_from_s3_album
FILE_FORMAT = json_ff;

SELECT * FROM tblAlbum;


COPY INTO tblsongs
FROM @load_data_from_s3_songs
FILE_FORMAT = json_ff;

SELECT * FROM tblsongs;

COPY INTO tblartist
FROM @load_data_from_s3_artist
FILE_FORMAT = json_ff;

SELECT * FROM tblartist;


--Create 3 SnowPipe to automate loading data
TRUNCATE TABLE tblAlbum;
TRUNCATE TABLE tblsongs;
TRUNCATE TABLE tblartist;

CREATE OR REPLACE PIPE album_pipe
auto_ingest = True
as
COPY INTO tblAlbum
FROM @load_data_from_s3_album
FILE_FORMAT = json_ff;

CREATE OR REPLACE PIPE songs_pipe
auto_ingest = True
as
COPY INTO tblsongs
FROM @load_data_from_s3_songs
FILE_FORMAT = json_ff;

CREATE OR REPLACE PIPE artist_pipe
auto_ingest = True
as
COPY INTO tblartist
FROM @load_data_from_s3_artist
FILE_FORMAT = json_ff;

show pipes;

desc pipe album_pipe;
desc pipe songs_pipe;
desc pipe artist_pipe;

SELECT * FROM tblAlbum;
SELECT * FROM tblsongs;
SELECT * FROM tblartist;





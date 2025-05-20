const axios = require('axios');
const { Movie, Genre, MovieGenre} = require('../models');
require('dotenv').config();

// Konfigurasi TMDB API
const TMDB_API_KEY = process.env.TMDB_API_KEY;
const TMDB_BASE_URL = 'https://api.themoviedb.org/3';
const TMDB_IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/';

// Fungsi untuk mengambil data dari TMDB API
async function fetchFromTMDB(endpoint, params = {}) {
    try {
        params.api_key = TMDB_API_KEY;
        
        const response = await axios.get(`${TMDB_BASE_URL}/${endpoint}`, {
        params: params,
        timeout: 30000
        });
        
        return response.data;
    } catch (error) {
        console.error(`Error fetching from TMDB (${endpoint}):`, error.message);
        throw new Error(`API Request Error: ${error.message}`);
    }
}

// Fungsi untuk mengimpor genre film
async function importGenres() {
    let count = 0;
    
    try {
        const data = await fetchFromTMDB('genre/movie/list', { language: 'en-EN' });
        
        if (data.genres && data.genres.length > 0) {
        for (const genre of data.genres) {
            const [genreObj, created] = await Genre.findOrCreate({
            where: { id: genre.id },
            defaults: {
                id: genre.id,
                name: genre.name
            }
            });
            
            if (!created) {
            await genreObj.update({ name: genre.name });
            }
            
            count++;
        }
        }
        
        console.log(`Berhasil mengimpor ${count} genre.`);
    } catch (error) {
        console.error('Error saat mengimpor genre:', error.message);
    }
}

// Fungsi untuk mengimpor film
async function importSpecificMovies(movieIds = []) {
    let count = 0;

    for (const id of movieIds) {
        try {
            const movieDetails = await fetchFromTMDB(`movie/${id}`, {
                language: 'en-EN',
                append_to_response: 'credits,videos'
            });

            const [movieObj, created] = await Movie.findOrCreate({
                where: { id: movieDetails.id },
                defaults: {
                    id: movieDetails.id,
                    title: movieDetails.title,
                    original_title: movieDetails.original_title,
                    poster_path: movieDetails.poster_path,
                    backdrop_path: movieDetails.backdrop_path,
                    overview: movieDetails.overview,
                    release_date: movieDetails.release_date || null,
                    runtime: movieDetails.runtime || null,
                    vote_average: movieDetails.vote_average,
                    vote_count: movieDetails.vote_count,
                    tmdb_popularity: movieDetails.popularity,
                    original_language: movieDetails.original_language,
                    adult: movieDetails.adult,
                }
            });

            if (!created) {
                await movieObj.update({
                    title: movieDetails.title,
                    original_title: movieDetails.original_title,
                    poster_path: movieDetails.poster_path,
                    backdrop_path: movieDetails.backdrop_path,
                    overview: movieDetails.overview,
                    release_date: movieDetails.release_date || null,
                    runtime: movieDetails.runtime || null,
                    vote_average: movieDetails.vote_average,
                    vote_count: movieDetails.vote_count,
                    tmdb_popularity: movieDetails.popularity,
                    original_language: movieDetails.original_language,
                    adult: movieDetails.adult,
                });
            }

            // Update genre
            if (movieDetails.genres && movieDetails.genres.length > 0) {
                await MovieGenre.destroy({ where: { movie_id: movieDetails.id } });

                for (const genre of movieDetails.genres) {
                    await MovieGenre.create({
                        movie_id: movieDetails.id,
                        genre_id: genre.id
                    });
                }
            }

            count++;
        } catch (error) {
            console.error(`Gagal impor film ID ${id}:`, error.message);
        }
    }

    console.log(`Berhasil mengimpor ${count} film spesifik.`);
}


async function main() {
    try {
        const specificIds = [1367952, 574475, 1375135, 1304517, 1337819, 1336738, 793387, 757725, 986056, 1308042,
            1138888, 1232546, 1241436, 1280089, 1049082, 1389137
        ];

        // Import genre terlebih dahulu
        await importGenres();
        
        // Import film-film
        // await importMovies('movie/now_playing', 'now_playing');
        // await importMovies('movie/upcoming', 'upcoming');
        // await importMovies('movie/popular', 'popular');

        await importSpecificMovies(specificIds);

        console.log('Proses import selesai!');
        process.exit(0);
    } catch (error) {
        console.error('Error utama:', error.message);
        process.exit(1);
    }
}

// Jalankan program
main();
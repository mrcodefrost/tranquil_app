// fetch all songs
// get daily quotes => call gemini api => {morning, noon, evening}
// provide advice

const Song = require("../../domain/entities/song");

class GetSongs extends UseCaseInterface {

    async execute() {
        const songRows  = await getAllSongs();
        return songRows.map(song => new Song({
            id: song.id,
            title: song.title,
            author: song.author,
            songLink: song.songLink
        }
        ));
    }
}

module.exports = GetSongs;
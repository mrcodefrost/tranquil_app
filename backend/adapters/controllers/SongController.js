const GetSongs = require("../../application/user-cases/GetSongs")

class SongController {


    static async all(req, res) {
        try{
            const getSong = new GetSongs();
            const songs = await getSong.execute();
            res.status(200).json(songs);
        }
        catch(err){
            res.status(500).json({error: err.message})
        }
    }
}

module.exports = SongController;
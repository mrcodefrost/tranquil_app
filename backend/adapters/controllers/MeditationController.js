const GetAdviceByMood = require("../../application/user-cases/GetAdviceByMood");
const GetDailyQuotes = require("../../application/user-cases/GetDailyQuotes");
const GeminiApi = require("../../infrastructure/gemini/geminiApi");

class MeditationController {

    static async dailyQuote(req, res) {
        try{

            const quotesRepository = new GeminiApi();
            const getDailyQuotes = new GetDailyQuotes(quotesRepository);
            const quotes = await getDailyQuotes.execute();
            res.status(200).json(quotes);

        }
        catch(err) {
            res.status(500).json({error: err.message});
        }
    }
    static async myMood(req, res) {
        try{

            const {mood} = req.params;
            const quotesRepository = new GeminiApi();
            const getAdviceByMood = new GetAdviceByMood(quotesRepository);
            const advice = await getDailyQuotes.execute();
            res.status(200).json(advice);

        }
        catch(err) {
            res.status(500).json({error: err.message});
        }
    }


}

module.exports = MeditationController;
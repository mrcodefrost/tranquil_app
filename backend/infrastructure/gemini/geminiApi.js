const { GoogleGenerativeAI } = require("@google/generative-ai");
const QuotesRepository = require("../../application/interfaces/QuotesRepository");



const genAi = new GoogleGenerativeAI("API_KEY");
const model = genAi.getGenerativeModel({ model: "gemini-1.5-pro" });

class GeminiApi extends QuotesRepository {

    async getDailyQuotes() {

        const prompt = `Provide three inspirational quotes for meditation, one for each part of the day: morning, noon, and evening,
        The response should be returned in this format 

    {
        "morningQuote": "Your morning quote here",
        "noonQuote": "Your noon quote here",
        "eveningQuote": "Your evening quote here"
    }
    return the json only without using keyword json
        `;
        const result = await model.generateContent(prompt);
        const response = await result.response;
        const text = response.text();
        return text;
    }

    async getAdviceByMood(mood) {
        const prompt = `
        
        Given the current mood of the user, provide an appropriate meditation advice or mental health exercise.
        The response should be returned in this format
    {
        
    "advice": "Your advice here or exercise"
    }

    For example, if the user's mood is "happy", the response should be

    {

        "advice" : "Engage in a gratitude practice by listing three things you ar thankful for today."
    
    }

    So the mood is : ${mood}
    return the json only without using keyword json
        `;
        const result = await model.generateContent(prompt);
        const response = await result.response;
        const text = response.text();
        return text;
    }

}

module.exports = GeminiApi;
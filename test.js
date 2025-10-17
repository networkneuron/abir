const assert = require('assert');
const { getEndGameMessage } = require('./game-logic.js');

function testEndGame() {
    const testCases = [
        { score: 0, expected: "Try clicking the Nexus logos and emojis!" },
        { score: 5, expected: "Keep practicing!" },
        { score: 15, expected: "Nice! You're quick!" },
        { score: 30, expected: "Great job! Nexus fan!" },
        { score: 45, expected: "Amazing! Nexus Pro!" },
        { score: 65, expected: "Incredible! Nexus Master!" },
    ];

    for (const { score, expected } of testCases) {
        const result = getEndGameMessage(score);
        assert.strictEqual(result, expected, `Test failed for score ${score}. Expected "${expected}", but got "${result}".`);
        console.log(`Test passed for score ${score}.`);
    }
}

testEndGame();
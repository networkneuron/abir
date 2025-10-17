function getEndGameMessage(score) {
    if (score === 0) return "Try clicking the Nexus logos and emojis!";
    if (score < 10) return "Keep practicing!";
    if (score < 25) return "Nice! You're quick!";
    if (score < 40) return "Great job! Nexus fan!";
    if (score < 60) return "Amazing! Nexus Pro!";
    return "Incredible! Nexus Master!";
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { getEndGameMessage };
}
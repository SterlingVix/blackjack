assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()


  describe 'playerHit', ->
    it "should give the last card from the deck", ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
      hand.playable && (assert.strictEqual deck.last(), hand.hit())
      hand.playable && (assert.strictEqual deck.length, 48)

  describe 'dealerHit', ->
    it "should give the last card from the deck", ->
      dealerHand = deck.dealDealer()
      assert.strictEqual deck.length, 48
      assert.strictEqual deck.last(), dealerHand.hit()
      assert.strictEqual deck.length, 47
      hand.playable && (assert.strictEqual deck.last(), dealerHand.hit())
      hand.playable && (assert.strictEqual deck.length, 46)


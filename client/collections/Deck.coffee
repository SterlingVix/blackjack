class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (cardValue) -> # array of [0 -- 51]... shuffle(randomize)... map(card=numberFromTheArray)
      new Card
        rank: cardValue % 13 # actual card value
        suit: Math.floor(cardValue / 13)

  dealPlayer: -> new Hand [ @pop(), @pop() ], @

  dealDealer: -> new Hand [ @pop().flip(), @pop() ], @, true

class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer, @isStanding, @isBusted) ->
    @isStanding = false
    @isBusted = false

  hit: ->
    if !@isStanding and !@isBusted
      @add(@deck.pop()).last()
      # @trigger('hit', this)
      @checkScore() #invoke score check
      # console.log(@)
    else
      if @isStanding
        console.log("can't - I'm standing")
      else
        console.log("can't - I'm busted")

  stand: ->
    @isStanding = true
    @trigger('standing', this)
    # console.log('player standing') # REMOVED "..., this)". This should trigger "standing" for App.coffee
    # @trigger('standing', this)

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false

    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  checkScore: ->
    score = @scores()[0]
    # console.log(score)
    if score > 21 then @bust()

  bust: ->
    @isBusted = true
    @trigger('busted', this)


# Hand.models[0].attributes.value # this is the card value

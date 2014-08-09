#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

# Does this reference HTML???   @collection.on 'score:add', => @render()
# game logic goes here.
# @get 'dealerHand'

  # score evaluation?
  #

# 1) Identify the score change listener
  # A) @get('playerHand').scores()[0])
#

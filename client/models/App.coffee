#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @get('playerHand').on 'standing', (-> @dealerLogik() ), this
    @get('playerHand').on 'standing', ( ->@get('dealerHand').models[0].flip()), this
    @get('playerHand').on 'standing', ( ->@dealerLogik()), this
    @get('playerHand').on 'busted', (-> )

# @get('playerHand').isStanding
# Does this reference HTML???   @collection.on 'score:add', => @render()
# game logic goes here.
# @get 'dealerHand'

  # score evaluation?
  #

# 1) Identify the score change listener
  # A) @get('playerHand').scores()[0])
#

# app specific functions
  #check score
  #game is over when dealer stands.

  dealerLogik: ->
    dealer = @get('dealerHand')
    score = dealer.scores()[0]

    while (dealer.scores()[0] < 17) # continue hitting while dealer's score < 17
      console.log('dealer is hitting...')
      dealer.hit()

    dealer.stand()
    @trigger('gameOver', this) # triggers end of game scenario
    @determineWinner() # determine winner
    console.log('dealer stands')

    # if score >= 17
    #   console.log("Dealer stands")
    # else
  determineWinner : ->
    dealer = @get('dealerHand')
    player = @get('playerHand')
    if dealer.isBusted
      trigger('playerWins', this)
      console.log("player wins")
    else
      if player.isBusted
        trigger('dealerWins', this)
        console.log("dealer wins")


    # dealerScore = 21-@get('dealerHand').scores()[0]
    dealerScore = dealer.scores()[0]
    playerScore = player.scores()[0]


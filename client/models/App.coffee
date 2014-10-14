#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
<<<<<<< HEAD
    
    # Listeners:
    @attributes.playerHand.on('busted', @dealerWins)
    @attributes.dealerHand.on('busted', @playerWins)
    #@attributes.playerHand.on('playerStands', @dealerPlays)
    @attributes.dealerHand.on('dealerStands', @gameOver)
    # this.attributes...
    # this.__proto__.hit()

  dealerPlays: ->
  debugger;
    @get('dealerHand').models[0].flip() # flip the first card
    @get('dealerHand').hit() # dealer takes first hit
      
  dealerWins: ->
    alert("Dealer wins")
    
  playerWins: ->
    alert("Player wins")
  
  gameOver: ->
#     @attributes.playerHand
#     @attributes.dealerHand
    alert(this, "Game Over")
=======
    # @get('playerHand').on 'standing', (-> @dealerLogik() ), this
    @get('playerHand').on 'standing', ( ->@get('dealerHand').models[0].flip()), this
    @get('playerHand').on 'standing', ( ->@dealerLogik()), this
    @get('playerHand').on 'busted', (-> )
    @get('dealerHand').on 'standing', -> (->determineWinner())
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
    dealerScore = 21 - dealer.scores()[0]
    playerScore = 21 - player.scores()[0]

    if dealer.isBusted
      @trigger('playerWins', this)
      alert("You won!")
    if player.isBusted
      @trigger('dealerWins', this)
      alert("FREDDY wins")
    if dealerScore < playerScore
      @trigger('dealerWins', this)
      alert("FREDDY wins")
    else
      @trigger('playerWins', this)
      alert("You win!")

    # # dealerScore = 21-@get('dealerHand').scores()[0]
    # dealerScore = dealer.scores()[0]
    # playerScore = player.scores()[0]

>>>>>>> 76bd8179390aa4673727404f0b7c655908dd015a

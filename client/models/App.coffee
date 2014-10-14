#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    
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
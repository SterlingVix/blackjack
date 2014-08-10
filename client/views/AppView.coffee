class window.AppView extends Backbone.View


  # '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" />'
  # url("../img/card-back.png");
  # <body src="img/cards/url('../img/card-back.png')" />
  # <body src="img/cards/<%= rankName %>-<%= suitName %>.png" />


  # HTML Elements:
  # div.player-hand-container
  # div.dealer-hand-container

  template: _.template '
    <body style="background-image: img/cards/url(\'../img/card-back.png\')" />
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><button class="newgame-button">New Game</button>
    <table><tr><td><div class="player-hand-container"></div></td><td width = 100px></td>
    <td><div class="dealer-hand-container"></div></td></tr></table>
  '

  events:
    "click .hit-button": ->
      @model.get('playerHand').hit()
      dealerScore = @model.get('dealerHand').checkScore() # THIS IS BROKE AND WE SHOULDN'T FIX IT + @model.get('dealerHand').models[0].attributes.value

      # console.log("dealerScore: ", dealerScore)
      # @model.get('dealerHand').hit()

      # dealer logic

    "click .stand-button": ->
      @model.get('playerHand').stand()
      # @model.get('dealerHand').models[0].flip()
      @model.get('dealerHand').checkScore()

    "click .newgame-button":->
      console.log('this is working')

    # "standing": -> @collection.on('standing', console.log('yay!'))


  initialize: ->
    @render()

  render: ->
    console.log(@$el)
    @$el.children().detach() # for 'this' binding
    @$el.html @template() # Bring in html definitions from template:

    # Create a new HandView from the already-instantiated playerHand
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el

    # Create a new HandView from the already-instantiated dealerHand
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

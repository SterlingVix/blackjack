class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '
# $('.card').first().slideToggle()

  events:
    "click .hit-button": ->
      @model.get('playerHand').hit()
    "click .stand-button": ->
      @model.get('playerHand').stand() # player stands
      @model.get('dealerHand').hit()   # dealer hits
      
  initialize: ->
    @render()

  render: ->
    @$el.children().detach() # for 'this' binding
    @$el.html @template() # Bring in html definitions from template:

    # Create a new HandView from the already-instantiated playerHand
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el

    # Create a new HandView from the already-instantiated dealerHand
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

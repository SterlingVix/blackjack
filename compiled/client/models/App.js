// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.App = (function(_super) {
    __extends(App, _super);

    function App() {
      return App.__super__.constructor.apply(this, arguments);
    }

    App.prototype.initialize = function() {
      var deck;
      this.set('deck', deck = new Deck());
      this.set('playerHand', deck.dealPlayer());
      this.set('dealerHand', deck.dealDealer());
<<<<<<< HEAD
      this.attributes.playerHand.on('busted', this.dealerWins);
      this.attributes.dealerHand.on('busted', this.playerWins);
      return this.attributes.dealerHand.on('dealerStands', this.gameOver);
    };

    App.prototype.dealerPlays = function() {
      this.get('dealerHand').models[0].flip();
      return this.get('dealerHand').hit();
    };

    App.prototype.dealerWins = function() {
      return alert("Dealer wins");
    };

    App.prototype.playerWins = function() {
      return alert("Player wins");
    };

    App.prototype.gameOver = function() {
      return alert(this, "Game Over");
=======
      this.get('playerHand').on('standing', (function() {
        return this.get('dealerHand').models[0].flip();
      }), this);
      this.get('playerHand').on('standing', (function() {
        return this.dealerLogik();
      }), this);
      this.get('playerHand').on('busted', (function() {}));
      return this.get('dealerHand').on('standing', function() {
        return function() {
          return determineWinner();
        };
      });
    };

    App.prototype.dealerLogik = function() {
      var dealer, score;
      dealer = this.get('dealerHand');
      score = dealer.scores()[0];
      while (dealer.scores()[0] < 17) {
        console.log('dealer is hitting...');
        dealer.hit();
      }
      dealer.stand();
      this.trigger('gameOver', this);
      this.determineWinner();
      return console.log('dealer stands');
    };

    App.prototype.determineWinner = function() {
      var dealer, dealerScore, player, playerScore;
      dealer = this.get('dealerHand');
      player = this.get('playerHand');
      dealerScore = 21 - dealer.scores()[0];
      playerScore = 21 - player.scores()[0];
      if (dealer.isBusted) {
        this.trigger('playerWins', this);
        alert("You won!");
      }
      if (player.isBusted) {
        this.trigger('dealerWins', this);
        alert("FREDDY wins");
      }
      if (dealerScore < playerScore) {
        this.trigger('dealerWins', this);
        return alert("FREDDY wins");
      } else {
        this.trigger('playerWins', this);
        return alert("You win!");
      }
>>>>>>> 76bd8179390aa4673727404f0b7c655908dd015a
    };

    return App;

  })(Backbone.Model);

}).call(this);

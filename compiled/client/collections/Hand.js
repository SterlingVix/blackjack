// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Hand = (function(_super) {
    __extends(Hand, _super);

    function Hand() {
      return Hand.__super__.constructor.apply(this, arguments);
    }

    Hand.prototype.model = Card;

    Hand.prototype.initialize = function(array, deck, isDealer, isStanding, isBusted) {
      this.deck = deck;
      this.isDealer = isDealer;
      this.isStanding = isStanding;
      this.isBusted = isBusted;
      this.isStanding = false;
      return this.isBusted = false;
    };

    Hand.prototype.hit = function() {
      if (!this.isStanding && !this.isBusted) {
        this.add(this.deck.pop()).last();
        return this.checkScore();
      } else {
        return console.log("can't - I'm standing");
      }
    };

    Hand.prototype.stand = function() {
      this.isStanding = true;
      return this.trigger('standing', this);
    };

    Hand.prototype.scores = function() {
      var hasAce, score;
      hasAce = this.reduce(function(memo, card) {
        return memo || card.get('value') === 1;
      }, false);
      score = this.reduce(function(score, card) {
        return score + (card.get('revealed') ? card.get('value') : 0);
      }, 0);
      if (hasAce) {
        return [score, score + 10];
      } else {
        return [score];
      }
    };

    Hand.prototype.checkScore = function() {
      var score;
      score = this.scores()[0];
      if (score > 21) {
        return this.bust();
      } else {
        if (this.isDealer != null) {
          this.dealerLogik();
        }
        return score;
      }
    };

    Hand.prototype.bust = function() {
      this.isBusted = true;
      return this.trigger('bust', this);
    };

    Hand.prototype.dealerLogik = function() {
      var score;
      score = this.scores()[0];
      if (score >= 17) {
        console.log("Dealer stands");
        return this.stand();
      }
    };

    return Hand;

  })(Backbone.Collection);

}).call(this);
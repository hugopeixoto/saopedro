import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
    Ember.$('input[name=tags]').tagsinput();
  }
});

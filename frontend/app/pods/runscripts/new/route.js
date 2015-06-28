import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return this.store.createRecord('runscript');
  },
  actions: {
    cancel: function() {
      this.transitionTo('runscripts');
    },

    save: function(runscript) {
      console.log(runscript.get("name"));
      runscript.save();
    }
  }
});

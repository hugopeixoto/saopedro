import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return Ember.RSVP.hash({
          machine: Ember.Object.create(),
          providers: this.store.findAll('provider')
      });
  },

  actions: {
    cancel: function() {
      this.transitionTo('machines');
    },

    save: function(form) {
      var machine = this.store.createRecord('machine', {
        name: form.get('name'),
        machineTemplate: form.get('')
      });
      machine.save();
    }
  }
});

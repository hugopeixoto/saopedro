import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return Ember.Object.create();
  },

  actions: {
    cancel: function() {
      this.transitionTo('runscripts');
    },

    save: function(form) {
      var runscript = this.store.createRecord('runscript', {
        name: form.get('name'),
        script: form.get('script')
      });

      runscript.save().then(function() {
        this.transitionTo('runscripts');
      }).catch(function() {
        runscript.destroyRecord();
      });
    }
  }
});

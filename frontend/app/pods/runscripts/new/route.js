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
      var that = this;
      var runscript = this.store.createRecord('runscript', {
        name: form.get('name'),
        script: form.get('script'),
        tagList: form.get('tags').split(',')
      });

      runscript.save().then(function() {
        that.transitionTo('runscripts');
      }).catch(function() {
        runscript.destroyRecord();
      });
    }
  }
});

import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('machines', { path: '/' }, function() {
    this.route('new', { path: 'machines/new' } );
    this.route('edit', { path: 'machines/edit/:machine_id' });
  });
  this.route('runscripts', function() {
    this.route('new');
  });
});

export default Router;

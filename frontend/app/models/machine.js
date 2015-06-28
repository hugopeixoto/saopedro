import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  status: DS.attr(),
  diskUsage: DS.attr(),
  tagList: DS.attr()
});
